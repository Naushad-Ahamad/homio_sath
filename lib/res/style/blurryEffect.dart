/**
 * Created by Vikash Kumar Bharti on 26-04-2023.
 * Designation : Flutter & Android Developer
 * Company Name : 18 Pixels India Pvt. Ltd
 * Email Id : vikash.18pixels@gmail.com
 */
import 'dart:ui';

import 'package:flutter/material.dart';
class BlurryEffect extends StatelessWidget {

  @override  Widget build(BuildContext context) {
    return Container(
      child: ClipRect(
        child:  BackdropFilter(
          filter:  ImageFilter.blur(sigmaX:5.0, sigmaY:5.0),
          child:  Container(
            width: double.infinity,
            height:  double.infinity,
            decoration:  BoxDecoration(
                color: Colors.grey.shade800.withOpacity(0.85)
            ),
          ),
        ),
      ),
    );
  }
}