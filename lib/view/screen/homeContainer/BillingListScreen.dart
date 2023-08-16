import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hica_app/repository/BillingRepository.dart';
import 'package:hica_app/res/components/shimmerEffect.dart';
import 'package:hica_app/res/style/colors.dart';

import 'package:hica_app/repository/SymptomRepository.dart';
import 'package:hica_app/res/components/roundHeaderButton.dart';
import 'package:hica_app/utils/routes/routes_name.dart';
import 'package:hica_app/view/widgets/SymptomAppBar.dart';

class BillingList extends StatefulWidget {
  const BillingList({Key? key}) : super(key: key);

  @override
  State<BillingList> createState() => _BillingListScreenState();
}

class _BillingListScreenState extends State<BillingList> {
  BillingRepository viewModel = BillingRepository();

  @override
  void initState() {
    viewModel.getBillingAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, //or set color with: Color(0xFF0000FF)
    ));
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
  /*    appBar: SymptomAppBar.appBar(statusBarHeight, Colors.white, context,
          'Symptom', true, false, false, true, false),*/
      appBar: buildAdAppBar(500, context),
      body:
          ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              /*Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ServiceDetailScreen(
                                    id: value.model.data!.data![index].id
                                        .toString());
                              }));*/
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              color: Color(appColors.colorBackground),

              child:  Card(
                child: Padding(
                  padding:
                  const EdgeInsets.all(
                      10.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment
                            .centerLeft,
                        child: Column(
                          mainAxisSize:
                          MainAxisSize
                              .max,
                          mainAxisAlignment:
                          MainAxisAlignment
                              .start,
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets
                                  .only(
                                  left:
                                  8.0),
                              child: Text(
                                "Appointment Date",
                                style: GoogleFonts
                                    .montserrat(
                                  fontSize: MediaQuery.of(context)
                                      .size
                                      .height *
                                      0.0175,
                                  color: Colors
                                      .black,
                                  fontWeight:
                                  FontWeight
                                      .w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets
                                  .only(
                                  left:
                                  8.0),
                              child: Text(
                                "Patient Name",
                                style: GoogleFonts
                                    .montserrat(
                                  fontSize: MediaQuery.of(context)
                                      .size
                                      .height *
                                      0.0175,
                                  color: Colors
                                      .black,
                                  fontWeight:
                                  FontWeight
                                      .w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .start,
                        children: [

                          Padding(
                            padding:
                            const EdgeInsets
                                .only(
                                left:
                                0.0),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .start,
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                                children: [
                                  Text(
                                   "Gender",
                                    style: GoogleFonts.montserrat(
                                        fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.0175,
                                        fontWeight:
                                        FontWeight
                                            .w500,
                                        color: Colors
                                            .black),
                                  ),
                                  Text(
                                    "DOB :  23-00-1111" ,
                                    style: GoogleFonts.montserrat(
                                        fontSize: MediaQuery.of(context).size.height *
                                            0.0175,
                                        fontWeight: FontWeight
                                            .w500,
                                        color:
                                        Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets
                            .fromLTRB(
                            8.0,
                            0.0,
                            20.0,
                            0.0),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets
                                  .only(
                                  top:
                                  4.0,
                                  bottom:
                                  4.0),
                              child: Align(
                                alignment:
                                Alignment
                                    .centerLeft,
                                child: Text(
                                  "MobileNo : +91 444444444" ,
                                  style: GoogleFonts.montserrat(
                                      fontSize:
                                      MediaQuery.of(context).size.height *
                                          0.0175,
                                      fontWeight:
                                      FontWeight
                                          .w500,
                                      color: Colors
                                          .black),
                                ),
                              ),
                            ),
                            Row(
                              children: [

                                Text(
                                  "Adhar No : 37429874326734 " ,
                                  style: GoogleFonts
                                      .montserrat(
                                    fontSize:
                                    MediaQuery.of(context).size.height *
                                        0.0175,
                                    fontWeight:
                                    FontWeight.w500,
                                    color: Colors
                                        .black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [

                          Padding(
                            padding:
                            const EdgeInsets
                                .only(
                                left:
                                8.0),
                            child: Text(
                              "Medicine Amounts : 4",
                              style: GoogleFonts
                                  .montserrat(
                                fontSize: MediaQuery.of(context)
                                    .size
                                    .height *
                                    0.0175,
                                fontWeight:
                                FontWeight
                                    .w500,
                                color: Colors
                                    .black,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                              "Discount",
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
                          Text(
                            "Appointment Fee : 200", /*==null
                                                                  ? value
                                                                      .model
                                                                      .data!
                                                                      .data![
                                                                          index]
                                                                      .appointmentStatus
                                                                      .toString()
                                                                  : Container()*/

                            style: GoogleFonts
                                .montserrat(
                              fontSize: MediaQuery.of(
                                  context)
                                  .size
                                  .height *
                                  0.0175,
                              color: Colors
                                  .green,
                              fontWeight:
                              FontWeight
                                  .w500,
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
        itemCount: 2,
      ),

    );
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
      /*showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Align(
              alignment: Alignment.center,
              child: Text(
                'Delete',
                style: GoogleFonts.montserrat(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Are you sure you want to Delete!',
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      color: Colors.grey,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    MaterialButton(
                      color: MyTheme.yellowBrown,
                      onPressed: () async {
                        SharedPreferences sharedPref =
                        await SharedPreferences.getInstance();
                        print("dgdggdh" +
                            sharedPref.getString("userId").toString());
                        final data = json.encode({
                          "provider_id":
                          sharedPref.getString("userId").toString(),
                          "service_id": list![index].id.toString(),
                          //"service_id": data[item-1].id.toString(),
                        });
                        viewModel.getDelete(data, context);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Confirm',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ));*/
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
    leading:  Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 22.0),
        child: Text(
          "Billing List",
          style: GoogleFonts.montserrat(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w600),
        ),
      ),
    ),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(20),
      child:  Align(
        alignment: Alignment.centerLeft,
        child:  Container(
          margin: EdgeInsets.fromLTRB(15, 0, 0, 10),
          padding: EdgeInsets.fromLTRB(15, 5, 0, 10),
          decoration: BoxDecoration(
              color: Color(0xFF39053B),
              borderRadius: BorderRadius.circular(5.0)
          ),
          height: 35,
          width: 150,
          child: Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(
                    context, RoutesName.addBills);
              },
              child: Row(
                children: [
                  Icon(Icons.add,
                      size: 20, color: Colors.white),
                  Text(
                      "Add New Bills",
                      style: GoogleFonts.notoSans(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14
                      )
                  ),
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
