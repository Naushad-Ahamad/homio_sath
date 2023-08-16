import 'package:hica_app/model/StockFormResponse.dart';
import 'package:hica_app/model/favorite/BillingResponse.dart';
import 'package:hica_app/model/favorite/StockResponse.dart';
import 'package:hica_app/model/favorite/addFavoriteResponse.dart';

import '../data/network/appConfig.dart';
import '../data/network/baseApiServices.dart';
import '../data/network/networkApiServices.dart';
import '../model/favorite/myFavoriteResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StockRepository{
  BaseApiServices  _apiServices=NetworkApiServices();

  Future<StockResponse> getStockAPI() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    try{
      dynamic response= await _apiServices.getGetApiResponse(AppConfig.getStockList+sharedPreferences.getString("userId").toString());
      return response = StockResponse.fromJson(response);
    }catch(e){
      throw e;
    }
  }

  Future<StockFormResponse> personalFormAPI(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppConfig.getSaveStockList, data);
      return response = StockFormResponse.fromJson(response);
    } catch (e) {
      throw e;
    }
  }


}

