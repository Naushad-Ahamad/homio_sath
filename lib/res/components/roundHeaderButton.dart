import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hica_app/res/style/colors.dart';
class RoundHeaderButton extends StatelessWidget {
  final String title;
  final int color;
  final int textColor;
  final VoidCallback onPress;
  const RoundHeaderButton({
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
        height: 35,
        width: 120,
        child: Center(
            child: Text(
                title,
                style: GoogleFonts.montserrat(
                    color: Color(textColor),
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.height *
                        0.0175,
                )
            )
        ),
      ),
    );
  }
}