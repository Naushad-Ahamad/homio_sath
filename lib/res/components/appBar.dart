import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hica_app/res/style/colors.dart';



class AppBars extends StatefulWidget {
  final List<String> city;
  const AppBars({Key? key, required this.city}) : super(key: key);
  @override
  State<AppBars> createState() => _AppBarsState();
}
class _AppBarsState extends State<AppBars> {
  String dropdownvalue = '';
  @override
  Widget build(BuildContext context) {
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
                bottomRight: Radius.circular(5.0)
            ),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color(appColors.colorAppGradient1st).withOpacity(0.4),
                  Color(appColors.colorAppGradient2nd).withOpacity(1.0)
                ]
            )
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 5.0),
              child: Stack(
                children: [
                  Center(
                    child: Text("Hi'CA",
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
                        Container(
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
                          child: Text('Search for Universities, Colleges &....',
                            style: GoogleFonts.montserrat(
                              color: Color(0xFF2F2E2E).withOpacity(0.6),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          )
                      ),
                      Icon(
                        Icons.search,
                        size: 28,
                        color: Color(0xFFA39D9D),
                      )
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
class CustomeAppBar {
  static AppBar appBar(double statusBarHeight, BuildContext context,String title,bool leading,bool searchShow,bool bellShow) {
    return AppBar(
      backgroundColor: Color(0xFFFFFFFF),
      titleSpacing: 0,
      elevation: 2,
      leading: leading?InkWell(
          onTap: (){
            Navigator.pop(context);
            },
          child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,)
      ):
      Container(),
      title: Text(title,
        style: TextStyle(
            color: Colors.black
        ),
      ),
      actions: [
        searchShow?Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: InkWell(
              onTap: (){},
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              )
          ),
        ):
        Container(),
        bellShow?Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: InkWell(
              onTap: (){},
              child: Icon(
                Icons.notifications_none,
                color: Colors.black,
                size: 30,
              )
          ),
        ):
        Container(),
      ],
    );
  }
}