import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hica_app/res/components/roundButton.dart';
import 'package:hica_app/res/style/colors.dart';

import '../../../utils/routes/routes_name.dart';

class ListingAppBar extends StatefulWidget {
  ListingAppBar({Key? key}) : super(key: key);

  @override
  State<ListingAppBar> createState() => _ListingAppBarState();
}

class _ListingAppBarState extends State<ListingAppBar> {
  String dropdownvalue = '';

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      flexibleSpace: Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
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
                      "Enrollments",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700, fontSize: 30),
                    ),
                  ),
                  Center(
                    child: Row(
                      children: const [
                        Icon(Icons.arrow_back_ios_new_rounded,
                            size: 30, color: Colors.black),
                        /*Container(
                            child: DropdownButton<String>(
                              underline: Container(),
                              icon: Icon(Icons.keyboard_arrow_down_sharp),
                              value: dropdownvalue.isNotEmpty ? dropdownvalue : null,
                              // hint: Text('City',
                              //     style: GoogleFonts.montserrat(
                              //         fontWeight: FontWeight.w700,
                              //         fontSize: 15)),
                              items: widget.city.map((String items) {
                                return DropdownMenuItem(
                                  value: dropdownvalue,
                                  child: Text(
                                    items,
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w700, fontSize: 15),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {},
                            )
                        ),*/
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
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => SearchScreen()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Search for Universities, Colleges &....',
                        style: GoogleFonts.montserrat(
                          color: Color(0xFF2F2E2E).withOpacity(0.6),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      )),
                      Icon(
                        Icons.search,
                        size: 28,
                        color: Color(0xFF090000),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

//Appbar used for Courses
class SymptomAppBar {
  PageController _pageController = new PageController(initialPage: 0);
  static GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  static AppBar appBar(
      double statusBarHeight,
      Color color,
      BuildContext context,
      String title,
      bool leading,
      bool searchShow,
      bool bellShow,
      bool stepper,
      bool menu) {
    return AppBar(
      key: _scaffoldKey,
      backgroundColor: color,
      titleSpacing: 0,
      elevation: 2,
      leading: leading
          ? InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
                size: 20,
              ))
          : Container(),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: stepper
            ? Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: RoundButton(
                                  title: '+ Filter',
                                  color: 0xFF39053B,
                                  textColor: 0xFFFFFFFF,
                                  onPress: () {
                                    _modalBottomSheetMenu(context);
                                  },
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(2, 0, 0, 0),
                              width: 180,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: RoundButton(
                                  title: 'Add Symptoms',
                                  color: 0xFFB88231,
                                  textColor: 0xFFFFFFFF,
                                  onPress: () {
                                    Navigator.pushNamed(
                                        context, RoutesName.addSymptomForm);
                                    /* Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return addClassGradeScreen();
                                    }));*/
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              )
            : Container(),
      ),
      title: Text(
        title,
        style: GoogleFonts.montserrat(
            fontSize: MediaQuery.of(context).size.height * 0.0195,
            color: Colors.black,
            fontWeight: FontWeight.w700),
      ),
      actions: [
        searchShow
            ? Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 25,
                    )),
              )
            : Container(),
        bellShow
            ? Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.notifications_none,
                      color: Colors.black,
                      size: 25,
                    )),
              )
            : Container(),
        menu
            ? Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: InkWell(
                  onTap: () {
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                  child: Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}

void _modalBottomSheetMenu(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        bool ischecked = true;
        return new Container(
          height: 350.0,
          color: Colors.transparent, //could change this to Color(0xFF737373),
          //so you don't have to change MaterialApp canvasColor
          child: Container(
            padding: EdgeInsets.only(top: 24),
            height: MediaQuery.of(context).size.height / 1.35,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Filter',
                            style: GoogleFonts.montserrat(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.0195,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          )),
                    ),
                    Divider(),
                    Padding(
                        padding: EdgeInsets.only(top: 5.0, left: 2.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Course Type",
                              style: GoogleFonts.montserrat(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.0195,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "One -Time",
                          style: GoogleFonts.montserrat(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.0195,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Checkbox(
                          value: ischecked,
                          onChanged: (bool? value) {
                            /*    setState(() {
                            isChecked = value!;
                          });*/
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recurring",
                          style: GoogleFonts.montserrat(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.0195,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Checkbox(
                          value: ischecked,
                          onChanged: (bool? value) {
                            /*    setState(() {
                            isChecked = value!;
                          });*/
                          },
                        ),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 5.0, left: 2.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Enrolled in",
                              style: GoogleFonts.montserrat(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.0195,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Listing 1",
                          style: GoogleFonts.montserrat(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.0195,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Checkbox(
                          value: ischecked,
                          onChanged: (bool? value) {
                            /*    setState(() {
                            isChecked = value!;
                          });*/
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Listing 2",
                          style: GoogleFonts.montserrat(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.0195,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Checkbox(
                          value: ischecked,
                          onChanged: (bool? value) {
                            /*    setState(() {
                            isChecked = value!;
                          });*/
                          },
                        ),
                      ],
                    ),
                    Divider(),
                    /* InkWell(
                      onTap: () {},
                      child: Text(
                        'Clear all',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 16),
                      ),
                    ),*/
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Clear All',
                          style: GoogleFonts.montserrat(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.0195,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                        Container(
                          width: 140,
                          height: 40,
                          child: RoundButton(
                              title: 'Apply',
                              color: 0xFFF58925,
                              textColor: 0xFFFFFFFF,
                              onPress: () {}),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
/*Widget buildFilterSheet() {
  //Todo: filter sheet design
  return Align(
    alignment: Alignment.bottomCenter,
    child: StatefulBuilder(builder: (context, setState) {
      return Material(
        child: Container(
          padding: EdgeInsets.only(top: 24),
          height: MediaQuery.of(context).size.height / 1.35,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Filter by',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Clear all',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 18,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: new BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height / 1.8,
                        maxHeight: MediaQuery.of(context).size.height / 1.75,
                      ),
                      width: MediaQuery.of(context).size.width / 3,
                      // height: MediaQuery.of(context).size.height / 1.75,
                      color: Colors.grey.withOpacity(0.4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          constraints: new BoxConstraints(
                            minHeight: MediaQuery.of(context).size.height / 1.8,
                            maxHeight:
                                MediaQuery.of(context).size.height / 1.75,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            side: new BorderSide(
                                color: MyTheme.light_grey, width: 2.0),
                            // borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        child: Text(
                          "Close",
                          style: TextStyle(color: Colors.grey),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    // VerticalDivider(),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            side: new BorderSide(
                                color: MyTheme.light_grey, width: 2.0),
                            // borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        // color: Color.fromRGBO(52, 168, 83, 1),
                        child: Text(
                          "APPLY",
                          style: TextStyle(color: MyTheme.accent_color),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }),
  );
}*/
