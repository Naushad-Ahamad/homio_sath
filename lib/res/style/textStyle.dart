import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
/**
 * Created by Vikash Kumar Bharti on 28-04-2023.
 * Designation : Flutter & Android Developer
 * Company Name : 18 Pixels India Pvt. Ltd
 * Email Id : vikash.18pixels@gmail.com
 */
class HeadingText extends StatelessWidget {
  final String title;
  const HeadingText({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(title,
      style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: Color(0xFF2F2E2E)
      ),
    );
  }
}

//TODO : Product Name Heading Style
class ProductHeading extends StatelessWidget {
  final String title;
  final int maxLines;
  const ProductHeading({Key? key, required this.title, required this.maxLines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
      maxLines: maxLines,
      style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Color(0xFF000000)
      ),
    );
  }
}



//TODO : Normal Text Style
class NormalText extends StatelessWidget {
  final String title;
  final int maxLines;
  const NormalText({Key? key, required this.title, required this.maxLines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
      maxLines: maxLines,
      style: GoogleFonts.montserrat(
          fontSize: 15,
          color: Color(0xFF111010),
          fontWeight: FontWeight.w500
      ),
    );
  }
}

// TODO : CUSTOME STYLE
class CustomeText{
  static TextStyle editStyle = GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.grey);
 static TextStyle defaultStyle = GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.black);
 static TextStyle linkStyle = GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 18);
}
