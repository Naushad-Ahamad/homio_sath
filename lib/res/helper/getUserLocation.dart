/**
 * Created by Vikash Kumar Bharti on 26-05-2023.
 * Designation : Flutter & Android Developer
 * Company Name : 18 Pixels India Pvt. Ltd
 * Email Id : vikash.18pixels@gmail.com
 */
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void>_getLocation(String lat, String long) async
{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    placemarkFromCoordinates(double.parse(lat), double.parse(long))
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      return place.locality;
    }).catchError((e) {
      debugPrint(e.toString());
    });
}