import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hica_app/res/style/colors.dart';

import '../../res/components/shimmerEffect.dart';
/**
 * Created by Vikash Kumar Bharti on 26-04-2023.
 * Designation : Flutter & Android Developer
 * Company Name : 18 Pixels India Pvt. Ltd
 * Email Id : vikash.18pixels@gmail.com
 */
class CircleCategoryWidget extends StatelessWidget{
  final int position;
  final String imgURL;
  final String title;
  final VoidCallback onPress;
  const CircleCategoryWidget({Key? key, required this.imgURL, required this.title, required this.position, required this.onPress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CachedNetworkImage(
              imageUrl: imgURL,
              errorWidget: (context, url, error) =>
                  Container(
                      height: 80,
                      width:80,
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFEBD1),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset('assets/images/ic_logo.png')
                  ),
              placeholder: (context, url) => new Container(
                height: 80,
                width:80,
                child: ShimmerEffect(100.0, 100.0, 100.0, 100.0, double.maxFinite,double.maxFinite),
              ),
              imageBuilder: (context, imageProvider) =>
                  Container(
                    height: 80,
                    width:80,
                    decoration: BoxDecoration(
                      color: Color(
                          position==0?
                          0xFFE1DFED :0==position%2? 0xFFE1DFED:
                          0xFFFFEBD1),
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          colorFilter: position==0?
                          ColorFilter.mode(Color(0xFF6A6395), BlendMode.srcIn):
                          0==position%2?
                          ColorFilter.mode(Color(0xFF6A6395), BlendMode.srcIn):
                          ColorFilter.mode(Color(0xFFC47000), BlendMode.srcIn),
                          image: imageProvider,
                          scale: 1.7
                      ),
                    ),
                  )
          ),
          Container(
            padding: EdgeInsets.only(top: 5.0),
            width:95,
            child: Text(title.toString(),
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w500
              ),),
          )
        ],
      ),
    );
  }
}
