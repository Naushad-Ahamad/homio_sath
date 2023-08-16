import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hica_app/res/components/imageButton.dart';
import 'package:hica_app/res/components/ratingBar.dart';
import 'package:hica_app/res/style/colors.dart';

import '../../res/components/shimmerEffect.dart';
import '../../res/style/textStyle.dart';

class ListWidget extends StatelessWidget {
  final String image;
  final String title;
  final String rating;
  final String cityName;
  final String contactNo;
  final String time;
  final bool isFav;
  final VoidCallback onChatPress;
  final VoidCallback onOppointmentPress;
  final VoidCallback onFavPress;
  const ListWidget({Key? key,
    required this.image,
    required this.title,
    required this.rating,
    required this.cityName,
    required this.contactNo,
    required this.time,
    required this.isFav,
    required this.onChatPress,
    required this.onOppointmentPress,
    required this.onFavPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: CachedNetworkImage(
                imageUrl: image,
                errorWidget: (context, url, error) =>
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                        height:  185,
                        width: double.maxFinite,
                        child: Image.asset('assets/images/grey_logo.png',
                            fit:BoxFit.fill
                        )
                    ),
                placeholder: (context, url) =>new ShimmerEffect(5.0, 5.0, 0.0, 0.0, double.maxFinite,185),
                imageBuilder: (context, imageProvider) =>
                    Container(
                      height:  185,
                      width: double.maxFinite,
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
          Padding(
            padding:  EdgeInsets.fromLTRB(15.0,5.0,15.0,0.0),
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
                  ),) ,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: CustomeRatingBar(rateCount: double.parse(rating)),
                ),
                Spacer(),
                Image.asset('assets/images/ic_compare.png',
                width: 25,
                height: 25,
                color: Color(0xFFF58925)),
                InkWell(
                  onTap: onFavPress,
                  child: Container(
                    margin: EdgeInsets.only(left: 10.0),
                    padding: EdgeInsets.all(5.0),
                    child: Icon(isFav?Icons.favorite:Icons.favorite_border,
                      color:Color(0xFFF58925),
                      size: 25,),
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
                  child:NormalText(title: cityName,maxLines: 1,)
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.fromLTRB(15.0,5.0,15.0,0.0),
            child: Row(
              children: [
                Icon(Icons.phone,
                  color:Color(appColors.colorPrimaryDark),
                  size: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(contactNo,
                    style: GoogleFonts.montserrat(
                        color: Color(0xFF111010),
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                    ),),
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
            padding:  EdgeInsets.fromLTRB(8.0,10.0,8.0,8.0),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: ImageButton(
                      title: 'Chat',
                      onPress: onChatPress,
                      color: 0xFF2ECC71,
                      type: 'chat',
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InkWell(
                      child: ImageButton(
                        title: 'Book an appointment',
                        onPress: onChatPress,
                        color: 0xFF186DDE,
                        type: 'appoint',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
