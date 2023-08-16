import 'package:hica_app/model/favorite/BillingResponse.dart';
import 'package:hica_app/model/favorite/addFavoriteResponse.dart';

import '../data/network/appConfig.dart';
import '../data/network/baseApiServices.dart';
import '../data/network/networkApiServices.dart';
import '../model/favorite/myFavoriteResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BillingRepository{
  BaseApiServices  _apiServices=NetworkApiServices();

  Future<BillingResponse> getBillingAPI() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    try{
      dynamic response= await _apiServices.getGetApiResponse(AppConfig.getBillingList);
      return response = BillingResponse.fromJson(response);
    }catch(e){
      throw e;
    }
  }

}