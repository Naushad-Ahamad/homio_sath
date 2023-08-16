import 'package:hica_app/model/favorite/addFavoriteResponse.dart';

import '../data/network/appConfig.dart';
import '../data/network/baseApiServices.dart';
import '../data/network/networkApiServices.dart';
import '../model/favorite/myFavoriteResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteRepository{
  BaseApiServices  _apiServices=NetworkApiServices();

  Future<MyFavoriteResponse> getFavoriteAPI() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    try{
      dynamic response= await _apiServices.getGetApiResponse(AppConfig.favoriteListAPI+sharedPreferences.getString("userId").toString());
      return response = MyFavoriteResponse.fromJson(response);
    }catch(e){
      throw e;
    }
  }
  Future<AddFavoriteResponse> addFavoriteAPI(dynamic data) async{
    try{
      dynamic response= await _apiServices.getPostApiResponse(AppConfig.addToFavAPI,data);
      return response = AddFavoriteResponse.fromJson(response);
    }catch(e){
      throw e;
    }
  }
  Future<AddFavoriteResponse> removeFromFav(dynamic data) async{
    try{
      dynamic response= await _apiServices.getPostApiResponse(AppConfig.removeFromFavAPI,data);
      return response = AddFavoriteResponse.fromJson(response);
    }catch(e){
      throw e;
    }
  }

}