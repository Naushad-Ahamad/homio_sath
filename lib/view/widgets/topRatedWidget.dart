import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hica_app/res/style/textStyle.dart';
import 'package:hica_app/res/style/colors.dart';
import '../../res/components/ratingBar.dart';
import '../../res/components/shimmerEffect.dart';

class TopRatedWidget extends StatelessWidget {
  final VoidCallback onPress;
  final String image;
  final String time;
  final String title;
  final int maxLine;
  final String rating;
  final String cityName;
  final String contactNo;
  final String day;
  final bool isFav;
  final VoidCallback favClick;

  const TopRatedWidget({Key? key,
    required this.image,
    required this.title,
    required this.maxLine,
    required this.rating,
    required this.cityName,
    required this.contactNo,
    required this.time,
    required this.day,
    required this.isFav,
    required this.onPress,
    required this.favClick,

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: onPress,
     child: Card(
       elevation: 1,
       child: Container(
         width: 250,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             CachedNetworkImage(imageUrl: image,
               errorWidget: (context, url, error) =>
                   Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(5.0)
                       ),
                       width: double.infinity,
                       height: 190,
                       child: Image.asset('assets/images/ic_logo.png',
                       )
                   ),
               placeholder: (context, url) =>new ShimmerEffect(5.0, 5.0, 0.0, 0.0, double.maxFinite,190),
               imageBuilder: (context, imageProvider) =>
                   Container(
                     width: double.infinity,
                     height: 190,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.only(topLeft:  Radius.circular(5.0),topRight: Radius.circular(5.0)),
                       image: DecorationImage(
                           fit: BoxFit.fill,
                           image: imageProvider
                       ),
                     ),
                   ),
             ),
             Padding(
               padding:  EdgeInsets.fromLTRB(15.0,15.0,15.0,0.0),
               child:
                   Container(
                     width: double.maxFinite,
                       child: ProductHeading(
                         title: title, maxLines: maxLine,
                       )
                   ),
             ),
             Padding(
               padding:  EdgeInsets.fromLTRB(15.0,5.0,15.0,0.0),
               child: Row(
                 children: [
                   Image.asset('assets/images/google.png',
                   width: 25,
                   height: 25,),
                   Container(
                     margin: EdgeInsets.only(left: 5.0),
                     padding: EdgeInsets.all(5.0),
                     decoration: BoxDecoration(
                         color: Color(appColors.colorPrimary)
                     ),
                     child:Text(double.parse(rating).toString(),
                       style: GoogleFonts.montserrat(
                           color: Colors.white,
                           fontWeight: FontWeight.w500,
                           fontSize: 12
                       ),
                     ) ,
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 5.0),
                     child: CustomeRatingBar(
                         rateCount: double.parse(rating)
                     ),
                   ),
                   Spacer(),
                   InkWell(
                     onTap: favClick,
                     child: Icon(
                       !isFav?
                       Icons.favorite_border:
                       Icons.favorite,
                       size: 25,
                       color: Color(0xFFF58925),
                     ),
                   ),
                 ],
               ),
             ),
             Padding(
               padding:  EdgeInsets.fromLTRB(15.0,5.0,15.0,0.0),
               child: Row(
                 children: [
                   Icon(Icons.location_on,
                     color:Color(appColors.colorPrimaryDark),
                     size: 20,),
                   Container(
                     width: 200,
                       padding: const EdgeInsets.only(left: 5.0),
                       child: NormalText(title: cityName,maxLines: 2,)
                   ),
                 ],
               ),
             ),
             Padding(
               padding:  EdgeInsets.fromLTRB(15.0,5.0,15.0,0.0),
               child: Row(
                 children: [
                   Icon(Icons.call,
                     color:Color(appColors.colorPrimaryDark),
                   size: 20,),
                   Padding(
                     padding: const EdgeInsets.only(left: 5.0),
                     child: NormalText(title: contactNo,maxLines: 1,)
                   ),
                 ],
               ),
             ),
             Padding(
               padding:  EdgeInsets.fromLTRB(15.0,5.0,15.0,0.0),
               child: Row(
                 children: [
                   Icon(Icons.watch_later,
                   color:Color(appColors.colorPrimaryDark),
                   size: 20,),
                   Padding(
                     padding: const EdgeInsets.only(left: 5.0),
                     child: NormalText(title: time,maxLines: 1,)
                   ),
                 ],
               ),
             ),
             Padding(
               padding:  EdgeInsets.fromLTRB(15.0,5.0,15.0,0.0),
               child: Row(
                 children: [
                   Text('Open - ',
                     style: GoogleFonts.montserrat(
                         fontSize: 14,
                         color: Color(0xFF524F4F),
                         fontWeight: FontWeight.w500
                     ),),
                   Padding(
                     padding: const EdgeInsets.only(left: 5.0),
                     child: NormalText(title: day,maxLines: 1,)
                   ),
                 ],
               ),
             ),
           ],
         ),
       ),
     ),
    );
  }
}
