import 'package:flutter/material.dart';
import 'package:hica_app/res/style/colors.dart';
import 'package:hica_app/utils/routes/routes.dart';
import 'package:hica_app/utils/routes/routes_name.dart';
import 'package:hica_app/view/screen/splashScreen.dart';
import 'package:hica_app/viewodel/detailViewModel.dart';
import 'package:hica_app/viewodel/favoriteViewModel.dart';
import 'package:hica_app/viewodel/homeScreenViewModel.dart';
import 'package:hica_app/viewodel/instituteListingViewModel.dart';
import 'package:hica_app/viewodel/searchViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
       MyApp()
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => DetailViewModel()),
        ChangeNotifierProvider(create: (context) => SearchViewModel()),
        ChangeNotifierProvider(create: (context) => FavoriteViewModel()),
      ],
    child:   MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(appColors.colorPrimary),
        ),
      ),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    ),);

  }
}