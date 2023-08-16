import 'package:hica_app/model/favorite/BillingResponse.dart';
import 'package:hica_app/model/favorite/PatientResponse.dart';
import 'package:hica_app/model/favorite/StockResponse.dart';
import 'package:hica_app/model/favorite/addFavoriteResponse.dart';

import '../data/network/appConfig.dart';
import '../data/network/baseApiServices.dart';
import '../data/network/networkApiServices.dart';
import '../model/favorite/myFavoriteResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientRepository{
  BaseApiServices  _apiServices=NetworkApiServices();

  Future<PatientResponse> getPatientAPI() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    try{
      dynamic response= await _apiServices.getGetApiResponse(AppConfig.getPatientList);
      return response = PatientResponse.fromJson(response);
    }catch(e){
      throw e;
    }
  }

}