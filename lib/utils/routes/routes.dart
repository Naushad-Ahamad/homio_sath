import 'package:flutter/material.dart';
import 'package:hica_app/utils/routes/routes_name.dart';
import 'package:hica_app/view/screen/Add%20Patient/AddPatientFrom.dart';
import 'package:hica_app/view/screen/AddBillings/AddBillingFrom.dart';
import 'package:hica_app/view/screen/AddStock/AddStockFrom.dart';
import 'package:hica_app/view/screen/homeContainer/AboutUs.dart';
import 'package:hica_app/view/screen/homeContainer/BillingListScreen.dart';
import 'package:hica_app/view/screen/homeContainer/patientList/PatientListScreen.dart';
import 'package:hica_app/view/screen/homeContainer/stockList/StockListScreen.dart';
import 'package:hica_app/view/screen/homeContainer/SymptomListScreen.dart';

import 'package:hica_app/view/screen/user/loginScreen.dart';

import '../../view/screen/homeContainer/homeContainer.dart';
import '../../view/screen/splashScreen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => SplashScreen());
      case RoutesName.homeContainer:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeContainer(
                  pageIndex: 0,
                ));

      case RoutesName.loginScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());
      case RoutesName.addstockform:
        return MaterialPageRoute(
            builder: (BuildContext context) => AddStockForm());
      case RoutesName.addPatientScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => AddPatientForm());
      case RoutesName.patientList:
        return MaterialPageRoute(
            builder: (BuildContext context) => PatientListScreen());
      case RoutesName.addBills:
        return MaterialPageRoute(
            builder: (BuildContext context) => AddBillingForm());

      case RoutesName.aboutusScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => AboutUsScreen());
      case RoutesName.SymptomListScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => SymptomListScreen());
      case RoutesName.StiockListScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => StocktListScreen());
      case RoutesName.BillingListScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => BillingList());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
