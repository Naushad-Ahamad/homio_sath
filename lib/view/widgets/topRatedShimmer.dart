import 'package:flutter/material.dart';

import '../../res/components/shimmerEffect.dart';

/**
 * Created by Vikash Kumar Bharti on 29-04-2023.
 * Designation : Flutter & Android Developer
 * Company Name : 18 Pixels India Pvt. Ltd
 * Email Id : vikash.18pixels@gmail.com
 */
 class TopRatedShimmer extends StatelessWidget {
   const TopRatedShimmer({Key? key}) : super(key: key);
   @override
   Widget build(BuildContext context) {
     return Column(
       mainAxisSize: MainAxisSize.min,
       children: [
         Padding(
           padding: EdgeInsets.only(right: 10.0,left: 10.0),
           child: ShimmerEffect(5.0, 5.0, 5.0, 5.0, double.maxFinite, 55.0),
         ),
         Container(
           height: 390,
           padding: EdgeInsets.only(left: 5.0,top: 10.0),
           child: ListView.builder(
               scrollDirection: Axis.horizontal,
               itemBuilder: (context, index) {
                 return Card(
                   elevation: 4,
                   child: Container(
                     width:250 ,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         ShimmerEffect(5.0, 5.0, 0.0, 0.0, double.maxFinite, 190.0),
                         Padding(
                           padding: const EdgeInsets.only(top: 15.0,left: 10.0,right: 10.0),
                           child: ShimmerEffect(0.0, 0.0, 0.0, 0.0, double.maxFinite, 55.0),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(top: 15.0,left: 10.0,right: 10.0),
                           child: ShimmerEffect(0.0, 0.0, 0.0, 0.0, 100.0, 25.0),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 5.0),
                           child: ShimmerEffect(0.0, 0.0, 0.0, 0.0, 160.0, 25.0),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 5.0,bottom: 5.0),
                           child: ShimmerEffect(0.0, 0.0, 0.0, 0.0, 200.0, 25.0),
                         ),
                       ],
                     ),
                   ),
                 );
               },
               itemCount: 6),
         ),
       ],
     );
   }
 }

