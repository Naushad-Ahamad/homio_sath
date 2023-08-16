
import 'package:hica_app/model/home/savedSearchResponse.dart';
import 'package:hica_app/model/home/sliderResponse.dart';
import 'package:hica_app/model/home/topDanceResponse.dart';
import 'package:hica_app/model/home/topDesignInstituteResponse.dart';
import 'package:hica_app/model/home/topFootballResponse.dart';
import 'package:hica_app/model/home/topTutorResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/network/baseApiServices.dart';
import '../data/network/networkApiServices.dart';
import '../model/home/homeScreenResponse.dart';
import '../data/network/appConfig.dart';
import '../model/home/recentlyVisitedResponse.dart';
import '../model/home/topRatedInstituteResponse.dart';

class HomeRepository{
  BaseApiServices  _apiServices=NetworkApiServices();

  Future<HomeScreenResponse> homeSectionAPI() async{
    try{
      dynamic response= await _apiServices.getGetApiResponse(AppConfig.homeSectionApi);
      return response = HomeScreenResponse.fromJson(response);
    }catch(e){
      throw e;
    }
  }
  Future<RecentlyVisitedResponse> getRecAPI() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    try{
      dynamic response= await _apiServices.getGetApiResponse(AppConfig.recentlyVisitedAPI+sharedPreferences.getString("userId").toString());
      return response = RecentlyVisitedResponse.fromJson(response);
    }catch(e){
      throw e;
    }
  }
  Future<SavedSearchResponse> getSaved() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    try{
      dynamic response= await _apiServices.getGetApiResponse(AppConfig.savedSearchAPI+sharedPreferences.getString("userId").toString());
      return response = SavedSearchResponse.fromJson(response);
    }catch(e){
      throw e;
    }
  }

  Future<TopRatedInstituteResponse> topRatedAPI() async{
    try{
      dynamic response= await _apiServices.getGetApiResponse(AppConfig.topRatedApi);
      return response = TopRatedInstituteResponse.fromJson(response);
    }catch(e){
      throw e;
    }
  }
  Future<TopDesignInstituteResponse> topDesignAPI() async{
    try{
      dynamic response= await _apiServices.getGetApiResponse(AppConfig.topDesignInstitutesApi);
      return response = TopDesignInstituteResponse.fromJson(response);
    }catch(e){
      throw e;
    }
  }
  Future<TopFootballResponse> topFootballAPI() async{
    try{
      dynamic response= await _apiServices.getGetApiResponse(AppConfig.topFootballApi);
      return response = TopFootballResponse.fromJson(response);
    }catch(e){
      throw e;
    }
  }
  Future<TopDanceResponse> getTopDanceData() async{
    try{
      dynamic response= await _apiServices.getGetApiResponse(AppConfig.topDanceAPI);
      return response = TopDanceResponse.fromJson(response);
    }catch(e){
      throw e;
    }
  }
  Future<SliderResponse> getSlider() async{
    try{
      dynamic response= await _apiServices.getGetApiResponse(AppConfig.sliderAPI);
      return response = SliderResponse.fromJson(response);
    }catch(e){
      throw e;
    }
  }
  Future<TopTutorResponse> getTutor() async{
    try{
      dynamic response= await _apiServices.getGetApiResponse(AppConfig.topTutorAPI);
      return response = TopTutorResponse.fromJson(response);
    }catch(e){
      throw e;
    }
  }
}