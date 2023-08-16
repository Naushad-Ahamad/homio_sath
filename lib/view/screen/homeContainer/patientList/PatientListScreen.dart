import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hica_app/data/network/appConfig.dart';
import 'package:hica_app/model/favorite/PatientResponse.dart';
import 'package:hica_app/res/style/colors.dart';
import 'package:hica_app/utils/routes/routes_name.dart';
import 'package:hica_app/utils/utils.dart';
import 'package:hica_app/view/screen/homeContainer/patientList/AddVitalForm.dart';
import 'package:hica_app/view/screen/homeContainer/patientList/SearchMadicineBox.dart';
import 'package:hica_app/viewodel/PatientListViewModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'EdiEdittPatientForm.dart';

class PatientListScreen extends StatefulWidget {
  const PatientListScreen({Key? key}) : super(key: key);

  @override
  State<PatientListScreen> createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  var isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, //or set color with: Color(0xFF0000FF)
    ));
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
        appBar: buildAdAppBar(500, context),
        body: Container(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Color(appColors.colorBackground),
                  child: Card(
                    child: Stack(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  "Patient Name : ",
                                                  style: GoogleFonts.montserrat(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.0175,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  "Gender : ",
                                                  style: GoogleFonts.montserrat(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.0175,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0.0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Adhar No : ",
                                                      style: GoogleFonts.montserrat(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.0175,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      "Email : ",
                                                      style: GoogleFonts.montserrat(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.0175,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      "Uuid : ",
                                                      style: GoogleFonts.montserrat(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.0175,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
/*
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets
                                              .fromLTRB(
                                              10.0,
                                              10.0,
                                              20.0,
                                              1.0),
                                          child: Text(
                                            "Email : "+listdata[index].email.toString(),
                                            style: GoogleFonts
                                                .montserrat(
                                              fontSize: MediaQuery.of(
                                                  context)
                                                  .size
                                                  .height *
                                                  0.0175,
                                              color: Colors
                                                  .black,
                                              fontWeight:
                                              FontWeight
                                                  .w600,
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),*/
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              children: [
                                Theme(
                                  data: Theme.of(context).copyWith(
                                    cardColor: Colors.transparent,
                                    //   canvasColor:Colors.transparent,
                                  ),
                                  child: PopupMenuButton<int>(
                                    constraints: const BoxConstraints.expand(
                                        width: 80, height: 260),
                                    onSelected: (item) =>
                                        handleClick(item, context),
                                    offset: Offset(30, 30),
                                    elevation: 0,
                                    itemBuilder: (context) => [
                                      const PopupMenuItem<int>(
                                          value: 0,
                                          child: Card(
                                              color: Color(0xFF39053B),
                                              child: Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.menu_outlined,
                                                        color: Colors.white),
                                                  ],
                                                ),
                                              ))),
                                      const PopupMenuItem<int>(
                                          value: 1,
                                          child: Card(
                                              color: Color(0xFF39053B),
                                              child: Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Icon(Icons.edit_outlined,
                                                    color: Colors.white),
                                              ))),
                                      const PopupMenuItem<int>(
                                          value: 2,
                                          child: Card(
                                              color: Color(0xFF39053B),
                                              child: Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Icon(
                                                    Icons.delete_outline,
                                                    color: Colors.white),
                                              ))),
                                      const PopupMenuItem<int>(
                                          value: 3,
                                          child: Card(
                                              color: Color(0xFF39053B),
                                              child: Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Icon(Icons.add_outlined,
                                                    color: Colors.white),
                                              ))),
                                      const PopupMenuItem<int>(
                                          value: 4,
                                          child: Card(
                                              color: Color(0xFF39053B),
                                              child: Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Icon(
                                                  Icons.add_box,
                                                  color: Colors.white,
                                                ),
                                              ))),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: 4,
          ),
          /*}
},
),
)*/
        ));
  }

  Future<void> handleClick(int item, BuildContext context) async {
    switch (item) {
      case 0:
        Utils.successMessage("Comming Soon", context);
        /*Navigator.pushNamed(context, RoutesName.PersonaldetailsForm);*/
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EditPatientForm()),
        );

        break;
      case 2:
        Utils.successMessage("Comming Soon", context);
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddVitalForm()),
        );
        break;
      case 4:
        Utils.successMessage("Comming Soon", context);

        break;
      /* default:
        Navigator.pushNamed(context, RoutesName.addNewCourseForm);*/
    }
  }

  AppBar buildAdAppBar(double statusBarHeight, BuildContext context) {
    return AppBar(
      elevation: 3.0,
      titleSpacing: 0,
      backgroundColor: Colors.white,
      leadingWidth: 200,
      leading: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: Text(
            "Patient List",
            style: GoogleFonts.montserrat(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(20),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 0, 0, 10),
            padding: EdgeInsets.fromLTRB(15, 5, 0, 10),
            decoration: BoxDecoration(
                color: Color(0xFF39053B),
                borderRadius: BorderRadius.circular(5.0)),
            height: 35,
            width: 150,
            child: Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.addPatientScreen);
                },
                child: Row(
                  children: [
                    Icon(Icons.add, size: 20, color: Colors.white),
                    Text("Add Patients",
                        style: GoogleFonts.notoSans(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SearchMadicineBox()),
              );
            },
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 25,
            ),
          ),
        )
      ],
    );
  }
}
