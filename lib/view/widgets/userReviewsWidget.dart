import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hica_app/res/style/colors.dart';

import '../../res/components/ratingBar.dart';
import '../../res/style/textStyle.dart';

/**
 * Created by Vikash Kumar Bharti on 25-05-2023.
 * Designation : Flutter & Android Developer
 * Company Name : 18 Pixels India Pvt. Ltd
 * Email Id : vikash.18pixels@gmail.com
 */
class UserReviewWidget extends StatelessWidget {
  const UserReviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.only(right: 5.0),
                  decoration: BoxDecoration(
                    color: Color(appColors.colorAppGradient1st),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Color(appColors.colorAppGradient1st),
                      borderRadius: BorderRadius.circular(100.0),
                      image: DecorationImage(
                          image: NetworkImage('https://cdn-icons-png.flaticon.com/128/924/924915.png')
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ProductHeading(title: 'Vikash', maxLines: 1,),
                      NormalText(title: 'Vikash', maxLines: 1,)
                    ],
                  ),
                ),
                Text('14 Feb',style: GoogleFonts.montserrat(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500
                ),)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: CustomeRatingBar(rateCount: double.parse('4.5')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child:NormalText(title: 'Vikash', maxLines: 100,)
              ,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.thumb_up_off_alt_outlined,
                          size: 30,),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: NormalText(title: 'Helpful', maxLines: 1),
                          )
                        ],
                      )),
                  Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.messenger_outline,
                          size: 30,),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: NormalText(title: 'Comment', maxLines: 1),
                          )
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
