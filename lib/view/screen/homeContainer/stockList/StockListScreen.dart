import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hica_app/data/network/appConfig.dart';
import 'package:hica_app/model/favorite/StockResponse.dart';
import 'package:hica_app/res/style/colors.dart';
import 'package:hica_app/utils/routes/routes_name.dart';
import 'package:hica_app/view/screen/homeContainer/stockList/SearchPatient.dart';
import 'package:hica_app/viewodel/StockListViewModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class StiockListScreen extends StatefulWidget {
  const StiockListScreen({Key? key}) : super(key: key);

  @override
  State<StiockListScreen> createState() => _StiockListScreenState();
}

class _StiockListScreenState extends State<StiockListScreen> {
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
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "Medicine Name : ",
                                    style: GoogleFonts.montserrat(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.0175,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "Quantity : ",
                                    style: GoogleFonts.montserrat(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Available Quantity : ",
                                        style: GoogleFonts.montserrat(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.0175,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "Selling Quantity : ",
                                        style: GoogleFonts.montserrat(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.0175,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 10.0, 30.0, 1.0),
                                child: Text(
                                  "Price : ",
                                  style: GoogleFonts.montserrat(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.0175,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Text(
                                    " Expairy Date : ",
                                    style: GoogleFonts.montserrat(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.0175,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: 1,
          ),
/*  }
},
),
)*/
        ));
  }
}

Future<void> handleClick(int item, int index) async {
  switch (item) {
    /*  case 0:
        break;*/
    case 0:
      //  Navigator.pushNamed(context, RoutesName.PersonaldetailsForm);
      break;
    case 1:
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
          "Stock List",
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
                Navigator.pushNamed(context, RoutesName.addstockform);
              },
              child: Row(
                children: [
                  Icon(Icons.add, size: 20, color: Colors.white),
                  Text("Add Stocks",
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
    /*PreferredSize(
      preferredSize: const Size.fromHeight(20),
      child:  Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Padding(
            padding: const EdgeInsets.all( 10.0),
            child: RoundHeaderButton(
              title:   "+Add Stocks",
              color: 0xFF39053B,
              textColor: 0xFFFFFFFF,
              onPress: () {
                 Navigator.pushNamed(
                      context, RoutesName.addstockform);
              },
            ),
          ),
        ),
      ),
    ),*/
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchPatient()),
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
