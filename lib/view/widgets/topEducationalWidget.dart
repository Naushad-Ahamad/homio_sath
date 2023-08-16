
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopEducationalWidget extends StatelessWidget {
  final bool isActive;
  final double height;
  final String title;
  final String iconName;
  final VoidCallback onPress;
  const TopEducationalWidget({Key? key,required this.isActive, required this.height, required this.title, required this.iconName,required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color(isActive?0xFFCE7C7C:0xFFDCF9E2).withOpacity(0.9),
                    Color(isActive?0xFF6A5E5E:0xFF7B9A82).withOpacity(0)
                  ]
              ),
              image: DecorationImage(
                  image:AssetImage(iconName)
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Color(isActive?0xFF656262:0xFF757575),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5.0),bottomRight:Radius.circular(5.0)),
                ),
                  child: Center(child: Text(title,
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                  ),)))
            ],
          ),
        ),
      ),
    );
  }
}
