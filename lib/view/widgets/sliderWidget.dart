// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// import 'package:flutter/material.dart';
//
// import '../../res/components/shimmerEffect.dart';
//
// class SliderWidget extends StatelessWidget {
//   final imageUrl;
//   const SliderWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final CarouselController _controller = CarouselController();
//
//     return Column(
//       children: [
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.28,
//           child:CarouselSlider(
//               carouselController: _controller,
//               items: sliderData.map((item) => InkWell(
//                   onTap: () async {
//                     },
//                   child: Container(
//                       child: Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5.0),
//                           ),
//                           elevation: 2,
//                           child: Container(
//                             child: CachedNetworkImage(
//                               imageUrl: ,
//                               errorWidget: (context, url, error) =>
//                                   Container(
//                                       height: double.maxFinite,
//                                       width: double.maxFinite,
//                                       child: Image.asset('assets/images/grey_logo.png',
//                                         fit: BoxFit.fill,
//                                       )
//                                   ),
//                               imageBuilder: (context, imageProvider) => Container(
//                                 width: double.infinity,
//                                 height: MediaQuery.of(context).size.height * 0.29,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5.0),
//                                   image: DecorationImage(
//                                     image: imageProvider,
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                               ),
//                               placeholder: (context, url) => new ShimmerEffect(0.0, 0.0, 0.0, 0.0, double.maxFinite),
//                             ),
//                           )
//                       )
//                   )
//               )).toList(),
//               options: CarouselOptions(
//                   height: MediaQuery.of(context).size.height * 0.28,
//                   enlargeCenterPage: true,
//                   autoPlay: true,
//                   // aspectRatio: 16 / 9,
//                   autoPlayCurve: Curves.fastOutSlowIn,
//                   enableInfiniteScroll: true,
//                   autoPlayAnimationDuration: Duration(milliseconds: 800),
//                   viewportFraction: 1.0,
//                   onPageChanged: (index, reason) {
//                   })
//           )
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: sliderData.asMap().entries.map((entry) {
//             return GestureDetector(
//               onTap: () => _controller.animateToPage(entry.key),
//               child: Container(
//                 width: MediaQuery.of(context).size.height * 0.010,
//                 height: MediaQuery.of(context).size.height * 0.010,
//                 margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black26).withOpacity(_current == entry.key ? 0.9 : 0.4)
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
// }
