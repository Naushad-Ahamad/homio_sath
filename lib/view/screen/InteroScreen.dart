import 'package:flutter/material.dart';
import 'package:hica_app/view/screen/user/loginScreen.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:getwidget/getwidget.dart';



class InteroScreen extends StatefulWidget {
  const InteroScreen({Key? key}) : super(key: key);

  @override
  _IntroSliderDemoState createState() => _IntroSliderDemoState();
}

class _IntroSliderDemoState extends State<InteroScreen> {
  late PageController _pageController;
  late List<Widget> slideList;
  late int initialPage;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    initialPage = _pageController.initialPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GFIntroScreen(
        color: Colors.blueGrey,
        slides: slides(),
        pageController: _pageController,
        currentIndex: 2,
        pageCount: 5,
        introScreenBottomNavigationBar: GFIntroScreenBottomNavigationBar(
          pageController: _pageController,
          pageCount: slideList.length,
          currentIndex: initialPage,
          onForwardButtonTap: () {
            _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear);
          },
          onBackButtonTap: () {
            _pageController.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear);
          },
          navigationBarColor: Colors.white,
          showDivider: false,
          inactiveColor: Colors.grey,
          activeColor: GFColors.SUCCESS,
          onDoneTap: (){
            goHomepage(context);
          },
          onSkipTap: (){
            goHomepage(context);
          },
        ),
      ),
    );
  }

  List<Widget> slides() {
    slideList = [
      Container(
        // color: Colors.teal,
        child: GFImageOverlay(
          width: MediaQuery
              .of(context)
              .size
              .width,
          image: const AssetImage('assets/images/inscreen4.png'),
          boxFit: BoxFit.cover,
          colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            image: DecorationImage(
              image: AssetImage('assets/images/inscreen1.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.darken),
            )),
      ),
      Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: BoxDecoration(
          // color: Colors.tealAccent,
            borderRadius: BorderRadius.circular(0),
            image: DecorationImage(
              image: AssetImage('assets/images/inscreen2.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.darken),
            )),
      ),
      Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            image: DecorationImage(
              image: AssetImage('assets/images/inscreen3.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.darken),
            )),
      ),
    ];
    return slideList;
  }
}
void goHomepage(context){
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context){
        return LoginScreen();
      }
      ), (Route<dynamic> route) => false);
  //Navigate to home page and remove the intro screen history
  //so that "Back" button wont work.
}