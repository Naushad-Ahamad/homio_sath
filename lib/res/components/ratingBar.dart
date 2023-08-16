import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomeRatingBar extends StatelessWidget {
  final double rateCount;
  // final VoidCallback onRateClick;
  const CustomeRatingBar({Key? key,required this.rateCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RatingBar.builder(
        direction: Axis.horizontal,
        ignoreGestures: true,
        itemSize: MediaQuery.of(context).size.height*0.025,
        initialRating: rateCount,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(
            horizontal: 0.0),
        itemBuilder: (context, _) =>
            Icon(
              Icons.star,
              color: Color(0xFFF58925),
            ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
    );
  }
}
