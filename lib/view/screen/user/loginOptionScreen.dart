import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../res/components/roundButton.dart';
import '../../../utils/routes/routes_name.dart';

/**
 * Created by Vikash Kumar Bharti on 12-05-2023.
 * Designation : Flutter & Android Developer
 * Company Name : 18 Pixels India Pvt. Ltd
 * Email Id : vikash.18pixels@gmail.com
 */



class LoginOption extends StatefulWidget {
  const LoginOption({Key? key}) : super(key: key);

  @override
  State<LoginOption> createState() => _LoginOptionState();
}

class _LoginOptionState extends State<LoginOption> {
  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.white70);
    TextStyle linkStyle = GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 18);
    return Scaffold(
      body:  Stack(
        children: [
          Image.asset('assets/images/login_image.png',
          width: double.maxFinite,
          height: double.maxFinite,
          fit: BoxFit.fill),
          Container(
            padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  'Hi’CA',
                  style: GoogleFonts.montserrat(
                      fontSize: 60,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 20.0),
                        child: Text('OR',
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600
                          ),),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0,right: 30.0,top: 0.0),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Color(0xFF03A9F4),
                            borderRadius: BorderRadius.circular(100.0)
                        ),
                        child:Image.asset('assets/images/facebook.png',
                            color: Colors.white,
                            width: 25),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Color(0xFFEFECEC),
                            borderRadius: BorderRadius.circular(100.0)
                        ),
                        child: Image.asset('assets/images/google.png',
                            width: 30),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Color(0xFF03A9F4),
                            borderRadius: BorderRadius.circular(100.0)
                        ),
                        child: Image.asset('assets/images/twitter.png',
                            color: Colors.white,
                            width: 30),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(14.0),
                        decoration: BoxDecoration(
                            color: Color(0xFFEFECEC),
                            borderRadius: BorderRadius.circular(100.0)
                        ),
                        child: Image.asset('assets/images/instagram.png',
                            width: 25),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Color(0xFF03A9F4),
                            borderRadius: BorderRadius.circular(100.0)
                        ),
                        child: Icon(
                            Icons.mail_outline_rounded,
                            color: Colors.white,
                            size: 30
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0,top: 50.0),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text:TextSpan(
                        style: defaultStyle,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'By using Hi’CA you agree to our ',

                          ),
                          TextSpan(
                              text: 'Terms of Service',
                              style: linkStyle,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('Terms of Service"');
                                }),
                          TextSpan(text: ' and '),
                          TextSpan(
                              text: 'Privacy Policy',
                              style: linkStyle,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('Privacy Policy"');
                                }),
                        ],
                      ) ),
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text:TextSpan(
                      style: defaultStyle,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Already have an account? ',
                        ),
                        TextSpan(
                            text: 'Sign in',
                            style: linkStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context,RoutesName.loginScreen);
                              }),
                      ],
                    ) ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
