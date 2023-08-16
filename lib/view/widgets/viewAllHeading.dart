import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hica_app/res/style/colors.dart';
import 'package:hica_app/res/style/textStyle.dart';
class ViewAllHeading extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  const ViewAllHeading({Key? key, required this.title, required this.onClick}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
      child: Row(
        children: [
          Expanded(
              child: HeadingText(title: title,)
          ),
          Text(
            'See all',
            style: GoogleFonts.montserrat(
                decoration: TextDecoration.underline,
                decorationColor: Color(appColors.colorBlue),
                color: Color(appColors.colorBlue),
                fontWeight: FontWeight.w500,
                fontSize: 16
            ),
          )

        ],
      ),
    );
  }
}
