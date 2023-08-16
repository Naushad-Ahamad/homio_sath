import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hica_app/res/style/colors.dart';
class RoundButton extends StatelessWidget {
  final String title;
  final int color;
  final int textColor;
  final VoidCallback onPress;
  const RoundButton({
    Key? key,
    required this.title,
    required this.color,
    required this.textColor,
    required this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: Color(color),
            borderRadius: BorderRadius.circular(10.0)
        ),
        height: 45,
        width: double.maxFinite,
        child: Center(
            child: Text(
                title,
                style: GoogleFonts.montserrat(
                    color: Color(textColor),
                    fontWeight: FontWeight.w700,
                    fontSize: 17
                )
            )
        ),
      ),
    );
  }
}