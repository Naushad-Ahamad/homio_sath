import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hica_app/res/style/colors.dart';
import 'package:hica_app/view/screen/Profile%20Screen/Edit%20Profile%20screen.dart';
import 'package:hica_app/view/screen/homeContainer/AboutUs.dart';
import 'package:hica_app/view/screen/homeContainer/homeScreen.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import 'addPlaceScreen.dart';


class HomeContainer extends StatefulWidget {
  final int pageIndex;
  const HomeContainer({Key? key, required this.pageIndex}) : super(key: key);
  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  var heart = false;
  late int page;
  dynamic selected;

  @override
  void initState() {
    selected = widget.pageIndex;
    page = widget.pageIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: page);
    return Scaffold(
      bottomNavigationBar: StylishBottomBar(
        backgroundColor: Colors.white,
        items: [
          BottomBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: MediaQuery.of(context).size.height * 0.030,
              ),
              selectedIcon: Icon(
                Icons.home,
                size: MediaQuery.of(context).size.height * 0.030,
                color: Color(appColors.colorGolden),
              ),
              backgroundColor: Color(appColors.colorPrimary),
              selectedColor: Color(appColors.colorGolden),
              title: Text('Home',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400, fontSize: 12))),
          BottomBarItem(
              icon: Icon(
                Icons.bookmark_outline_sharp,
                size: MediaQuery.of(context).size.height * 0.030,
              ),
              selectedIcon: Icon(
                Icons.bookmark_outline_sharp,
                size: MediaQuery.of(context).size.height * 0.030,
                color: Color(appColors.colorGolden),
              ),
              selectedColor: Color(appColors.colorGolden),
              backgroundColor: Color(0xFFD09704),
              title: Text('About',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400, fontSize: 12))),
          BottomBarItem(
              icon: Icon(
                Icons.history_outlined,
                size: MediaQuery.of(context).size.height * 0.030,
              ),
              selectedIcon: Icon(
                Icons.history_outlined,
                size: MediaQuery.of(context).size.height * 0.030,
                color: Color(appColors.colorGolden),
              ),
              backgroundColor: Color(appColors.colorPrimary),
              selectedColor: Color(0xFFD09704),
              title: Text('Histoy',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400, fontSize: 12))),
          BottomBarItem(
              icon: Icon(
                Icons.person,
                size: MediaQuery.of(context).size.height * 0.030,
              ),
              selectedIcon: Icon(
                Icons.person,
                size: MediaQuery.of(context).size.height * 0.030,
                color: Color(appColors.colorGolden),
              ),
              selectedColor: Color(appColors.colorGolden),
              title: Text('Profile',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400, fontSize: 12))),
        ],
        hasNotch: false,
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            controller.jumpToPage(index);
            selected = index;
          });
        },
        option: AnimatedBarOptions(
          iconSize: MediaQuery.of(context).size.height * 0.030,
          iconStyle: IconStyle.Default,
          opacity: 0.3,
        ),
      ),
      body: SafeArea(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            HomeScreenView(),
            AboutUsScreen(),
            AddPlaceScreen(),
            ProfileEdit(),
          ],
        ),
      ),
    );
  }
}
