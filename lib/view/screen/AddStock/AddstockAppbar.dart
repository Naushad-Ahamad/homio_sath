import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hica_app/res/components/roundButton.dart';
import 'package:hica_app/res/components/roundHeaderButton.dart';
import 'package:hica_app/res/style/colors.dart';
import 'package:hica_app/view/screen/homeContainer/homeContainer.dart';

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
                      style: GoogleFonts.notoSans(
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
                              underline: homeContainer(),
                              icon: Icon(Icons.keyboard_arrow_down_sharp),
                              value: dropdownvalue.isNotEmpty ? dropdownvalue : null,
                              // hint: Text('City',
                              //     style: GoogleFonts.notoSans(
                              //         fontWeight: FontWeight.w700,
                              //         fontSize: 15)),
                              items: widget.city.map((String items) {
                                return DropdownMenuItem(
                                  value: dropdownvalue,
                                  child: Text(
                                    items,
                                    style: GoogleFonts.notoSans(
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
                        style: GoogleFonts.notoSans(
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
class AddstockAppbar {
  static AppBar appBar(double statusBarHeight, Color color,BuildContext context, String title, bool leading,) {
    return AppBar(
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
          :Container(),
      title: Text(
        title,
        style: GoogleFonts.notoSans(
            fontSize: MediaQuery.of(context).size.height *
                0.0195, color: Colors.black, fontWeight: FontWeight.w600),
      ),
    );
  }
}
