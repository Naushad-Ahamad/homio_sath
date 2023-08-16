import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hica_app/res/style/colors.dart';
import 'package:hica_app/res/style/textStyle.dart';

import '../../res/components/ratingBar.dart';
import '../../res/components/shimmerEffect.dart';

class TopTutorWidget extends StatelessWidget {
  final String image;
  final String title;
  final String rating;
  final String cityName;
  final String contactNo;
  final String time;
  final String day;
  final VoidCallback onPress;
  final VoidCallback favClick;
  const TopTutorWidget({Key? key,
    required this.image,
    required this.title,
    required this.rating,
    required this.cityName,
    required this.contactNo,
    required this.time,
    required this.day,
    required this.onPress,
    required this.favClick
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Card(
        elevation: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: CachedNetworkImage(imageUrl: image,
                errorWidget: (context, url, error) =>
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                        height:  165,
                        width: 130,
                        child: Image.asset('assets/images/ic_logo.png',
                            fit:BoxFit.fill
                        )
                    ),
                placeholder: (context, url) =>new ShimmerEffect(5.0, 5.0, 5.0, 5.0, 130,165),
                imageBuilder: (context, imageProvider) =>
                    Container(
                      height:  165,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: imageProvider
                        ),
                      ),
                    ),
              )
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.fromLTRB(15.0,15.0,15.0,0.0),
                    child: ProductHeading(title: title,maxLines: 1,)
                  ),
                  Padding(
                    padding:  EdgeInsets.fromLTRB(15.0,5.0,15.0,0.0),
                    child: Row(
                      children: [
                        Container(
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
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: NormalText(title: cityName,maxLines: 1,)
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
                          child: Expanded(child: NormalText(title: time,maxLines: 1,))
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.fromLTRB(15.0,5.0,15.0,0.0),
                    child: Row(
                      children: [
                        NormalText(title: 'Open - ',maxLines: 1,),
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
            InkWell(
              onTap: favClick,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: Color(0xFFD9D9D9).withOpacity(0.7),
                  ),
                  child: Icon(Icons.favorite_border,
                    size: 25,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
