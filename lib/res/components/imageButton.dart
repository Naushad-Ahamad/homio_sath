import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hica_app/res/style/colors.dart';

class ImageButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final int color;
  final String type;
  const ImageButton({Key? key, required this.title,  required this.color, required this.type,required this.onPress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: Color(color),
            borderRadius: BorderRadius.circular(5.0)
        ),
        height: 40,
        width: double.maxFinite,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Icon(
              type=='appoint'?Icons.calendar_today_outlined: Icons.chat_outlined,
             color: Colors.white,
             size: 20,
             ),
             Padding(
               padding: const EdgeInsets.only(left: 5.0),
               child: Text(title,
               style: GoogleFonts.montserrat(
                 fontSize: 16,
                 color: Colors.white,
                 fontWeight: FontWeight.w500
               ),),
             )
           ],
        ),
      ),
    );
  }
}
