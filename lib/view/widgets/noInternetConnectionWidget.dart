import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hica_app/res/style/textStyle.dart';

/**
 * Created by Vikash Kumar Bharti on 24-05-2023.
 * Designation : Flutter & Android Developer
 * Company Name : 18 Pixels India Pvt. Ltd
 * Email Id : vikash.18pixels@gmail.com
 */
class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/ic_internet_error.png',
          height: 400,
          width: 400,
        ),
        HeadingText(title: 'Connection Lost'),
        Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
          child: Text(
            'Looks like the page you are trying to visit doesn’t exist. Please check the URL and try again',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                fontSize: 15,
                color: Color(0xFF111010),
                fontWeight: FontWeight.w500),
          ),
        ))
      ],
    );
  }
}
