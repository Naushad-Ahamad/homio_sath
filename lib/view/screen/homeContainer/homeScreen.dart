import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hica_app/res/style/colors.dart';
import 'package:hica_app/utils/my_theme.dart';
import 'package:hica_app/utils/routes/routes_name.dart';
import 'package:hica_app/view/widgets/baseAppBar.dart';
import 'package:hica_app/viewodel/homeScreenViewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/home/topRatedInstituteResponse.dart';
import '../../../viewodel/favoriteViewModel.dart';

var isLoading = true;
HomeViewModel homeViewModel = HomeViewModel();

class HomeScreenView extends StatefulWidget {
  HomeScreenView({Key? key}) : super(key: key);
  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  Timer? _timer;
  int clickCount = 1;
  bool isFav = false;
  List<String> city = [];
  List<String> location = [];
  List<String> distance = [];
  List<String> openingDays = [];
  @override
  void initState() {
    if (isLoading) {
      // _timer = Timer(Duration(seconds: 20), () {
      homeViewModel.getHomeDataAPI();
      // });
      super.initState();
    }
  }

  // @override
  // void dispose() {
  //   if (_timer != null) {
  //     _timer!.cancel();
  //     _timer = null;
  //     // homeViewModel.dispose();
  //   }
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
 /*   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: MyTheme.basecolorApp //or set color with: Color(0xFF0000FF)
    ));*/
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: BaseAppbar.appBar(
          640, Colors.white, context, '', true),
      body: Container(
        color: Color(0xFFFFFFFF),
        child: Center(
          child: Container(

            width: 400,
            height: 400,
            padding: EdgeInsets.only(
                top: 16.0, left: 16.0, right: 16.0, bottom: 16.0),
            child: Column(
              children: [
                /*Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0)),

                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Enjoy the features we've provided and stay Healthy!",
                      style: GoogleFonts.poppins(
                          fontSize: MediaQuery.of(context).size.height *
                              0.0195,
                          color: Colors.black,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),*/

                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context,
                                RoutesName.patientList);
                          },
                          child: Card(
                            elevation: 3,
                            //color: Color(0xFFFFEBD1),

                            child: Container(
                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(10.0)),
                              margin: EdgeInsets.all(5),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 16.0, left: 6.0, right: 6.0, bottom: 6.0),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Container(
                                          height: 120,
                                          width: 90,
                                          padding: EdgeInsets.all(5.0),
                                          child:
                                          Image.asset('assets/images/patient.png')),
                                    ),
                                    Center(
                                      child: Text(
                                        'Patient',
                                        style: GoogleFonts.notoSans(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ),
                    Expanded(
                      child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesName.SymptomListScreen);
                          },
                          child: Card(
                            elevation: 3,
                           //   color: Color(0xFFE1DFED),
                            child: Container(
                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(10.0)),
                              margin: EdgeInsets.all(5),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 16.0, left: 6.0, right: 6.0, bottom: 6.0),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Container(
                                          height: 120,
                                          width: 90,
                                          padding: EdgeInsets.all(5.0),
                                          child: Image.asset(
                                              'assets/images/symptom.png')),
                                    ),
                                    Center(
                                      child: Text(
                                        'Symptoms',
                                        style: GoogleFonts.notoSans(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesName.StiockListScreen);
                          },
                          child: Card(
                            elevation: 3,
                            //color: Color(0xFFE1DFED),
                            child: Container(
                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(10.0)),
                              margin: EdgeInsets.all(5),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 16.0, left: 6.0, right: 6.0, bottom: 6.0),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Container(
                                          height: 120,
                                          width: 90,
                                          padding: EdgeInsets.all(5.0),
                                          child:
                                          Image.asset('assets/images/box.png')),
                                    ),
                                    Center(
                                      child: Text(
                                        'Stock',
                                        style: GoogleFonts.notoSans(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ),
                    Expanded(
                      child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesName.BillingListScreen);
                          },
                          child: Card(
                            elevation: 3,
                           // color: Color(0xFFFFEBD1),
                            child: Container(
                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(10.0)),
                              margin: EdgeInsets.all(5),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 16.0, left: 6.0, right: 6.0, bottom: 6.0),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Container(
                                          height: 120,
                                          width: 90,
                                          padding: EdgeInsets.all(5.0),
                                          child: Image.asset(
                                              'assets/images/Receipt.png')),
                                    ),
                                    Center(
                                      child: Text(
                                        'Billing',
                                        style: GoogleFonts.notoSans(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                    )
                  ],
                ),
             /*   Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context,
                                  RoutesName.patientList);
                            },
                            child: Card(
                              elevation: 3,
                              color: Color(0x894F1352),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.155,
                                //width: MediaQuery.of(context).size.height * 0.315,
                                decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(10.0)),
                                margin: EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Align(alignment: Alignment.centerLeft,child:  Icon(Icons.supervised_user_circle,color: Colors.white,),),
                                    Spacer(),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "Patient",
                                        style: GoogleFonts.montserrat(
                                            fontSize: MediaQuery.of(context).size.height *
                                                0.0210,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RoutesName.SymptomListScreen);
                            },
                            child: Card(
                              elevation: 3,
                              color: Color(0x5FEC5B0E),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.155,
                                //width: MediaQuery.of(context).size.height * 0.315,

                                decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(10.0)),
                                margin: EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Align(alignment: Alignment.centerLeft,child: Icon(Icons.book_outlined,color: Colors.white,)),
                                    Spacer(),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "Symptom",
                                        style: GoogleFonts.montserrat(
                                            fontSize: MediaQuery.of(context).size.height *
                                                0.0210,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RoutesName.StiockListScreen);
                            },
                            child: Card(
                              elevation: 3,
                              color: Color(0x894F1352),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.155,
                                //width: MediaQuery.of(context).size.height * 0.315,

                                decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(10.0)),
                                margin: EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Align(alignment: Alignment.centerLeft,child: Icon(Icons.add_shopping_cart,color: Colors.white,)),
                                    Spacer(),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "Stock",
                                        style: GoogleFonts.montserrat(
                                            fontSize: MediaQuery.of(context).size.height *
                                                0.0210,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RoutesName.BillingListScreen);
                            },
                            child: Card(
                              elevation: 3,
                              color: Color(0x5FEC5B0E),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.155,
                                // width: MediaQuery.of(context).size.height * 0.315,

                                decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(10.0)),
                                margin: EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Align(alignment: Alignment.centerLeft,child: Icon(Icons.contact_page_outlined,color: Colors.white,)),
                                    Spacer(),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "Billing",
                                        style: GoogleFonts.montserrat(
                                            fontSize: MediaQuery.of(context).size.height *
                                                0.0210,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  //TODO : APPBAR
  AppBar buildAppBar(double statusBarHeight, BuildContext context,
      HomeViewModel homeViewModel) {
    String dropdownvalue = '';
    return AppBar(
      toolbarHeight: 160,
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      flexibleSpace: Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0)),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color(appColors.colorAppGradient1st).withOpacity(0.4),
                  Color(appColors.colorAppGradient2nd).withOpacity(1.0)
                ])),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 5.0),
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      "Homeo Sathi",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700, fontSize: 30),
                    ),
                  ),
                  Center(
                    child: Row(
                      children: [
                        Icon(
                          Icons.place,
                          size: 30,
                          color: Color(0xFFEC770C),
                        ),
                        Spacer(),
                        CircleAvatar(
                          backgroundColor: Color(0xFFD9D9D9),
                          child: Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
                onTap: () {
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Search for Universities, Colleges &....',
                        style: GoogleFonts.montserrat(
                          color: Color(0xFF2F2E2E).withOpacity(0.6),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      )),
                      Icon(
                        Icons.search,
                        size: 28,
                        color: Color(0xFFA39D9D),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  getAdd(List<Datum> data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    for (int i = 0; i < data.length; i++) {
      placemarkFromCoordinates(
              double.parse(data[i].latitude), double.parse(data[i].longitude))
          .then((List<Placemark> placemarks) {
        Placemark place = placemarks[0];
        setState(() {
          location.add('${place.subLocality}, ${place.subAdministrativeArea}');
          // _currentAddress =
          // /*' ${place.subLocality}, */'${place.subAdministrativeArea}';
        });
      }).catchError((e) {
        debugPrint(e.toString());
      });
      final double dist = Geolocator.distanceBetween(
              double.parse(data[i].latitude),
              double.parse(data[i].longitude),
              sharedPreferences.getDouble("deviceLat")!,
              sharedPreferences.getDouble("deviceLong")!) *
          0.001;
      setState(() {
        distance.add(', ' + dist.toStringAsFixed(2) + 'KM');
      });
    }
  }

  getPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("authToken") != null ||
        sharedPreferences.getString("authToken") != "") {
      homeViewModel.getRecentViewData();
    }
  }

  update() async {
    setState(() {
      isLoading = false;
    });
  }
}
