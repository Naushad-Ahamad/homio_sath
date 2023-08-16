import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hica_app/res/style/colors.dart';

import '../res/style/textStyle.dart';

class Utils{
  // TODO : CUSTOME TOAST
  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Color(appColors.colorPrimary),
            duration:  Duration(seconds: 1),
            content: Text(message,
              style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500
              ),
            )
        )
    );
  }


  // TODO : SUCCESS TOAST
  static successMessage(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.green,
            duration:  Duration(seconds: 1),
            content: Text(message,
              style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500
              ),
            )
        )
    );
  }
  // TODO : ERROR TOAST
  static errorMessage(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.red,
            duration:  Duration(seconds: 1),
            content: Text(message,
              style: GoogleFonts.montserrat(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500
              ),
            )
        )
    );
  }
}