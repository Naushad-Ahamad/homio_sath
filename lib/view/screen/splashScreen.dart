import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hica_app/view/screen/InteroScreen.dart';
import 'package:hica_app/view/screen/user/loginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homeContainer/homeContainer.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  String? _currentAddress;
  Position? _currentPosition;

  @override
  void initState() {
    _getCurrentPosition();
    super.initState();
    getService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Image(
          width: double.maxFinite,
          height: double.maxFinite,
          image: AssetImage('assets/images/homeosathi.jpg'),
         fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  getService() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Timer(
        Duration(seconds: 6),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => sharedPreferences.getString("userId") ==
                          null ||
                      sharedPreferences.getString("userId") == '' &&
                          sharedPreferences.getString("authToken") == null ||
                      sharedPreferences.getString("authToken") == ''
                  ? InteroScreen()
                  : HomeContainer(pageIndex: 0),
            )));
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        preferences.setDouble("deviceLat", _currentPosition!.latitude);
        preferences.setDouble("deviceLong", _currentPosition!.longitude);
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }
}
