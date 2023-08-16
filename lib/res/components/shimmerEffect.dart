import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class ShimmerEffect extends Container{
  double topLeft,topRight,bottomLeft,bottomRight,width,height;
  ShimmerEffect(this.topLeft,this.topRight,this.bottomLeft,this.bottomRight,this.width,this.height);
  @override
  // TODO: implement child
  Widget? get child => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      )
    ),
    child: Shimmer.fromColors(
      baseColor: Colors.black26,
      highlightColor: Colors.black54,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeft),
              topRight: Radius.circular(topRight),
              bottomLeft: Radius.circular(bottomLeft),
              bottomRight: Radius.circular(bottomRight),
            )
        ),
        height: height,
        width:width,
      )
    ),
  );
}