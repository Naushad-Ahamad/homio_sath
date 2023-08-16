import 'package:hica_app/model/home/topRatedInstituteResponse.dart';

import '../data/network/appConfig.dart';
import '../data/network/baseApiServices.dart';
import '../data/network/networkApiServices.dart';
import '../model/searchResponse.dart';

/**
 * Created by Vikash Kumar Bharti on 18-05-2023.
 * Designation : Flutter & Android Developer
 * Company Name : 18 Pixels India Pvt. Ltd
 * Email Id : vikash.18pixels@gmail.com
 */

class SearchRepository{
  BaseApiServices  _apiServices=NetworkApiServices();
  Future<SearchResponse> searchAPI(dynamic data) async{
    try{
      dynamic response= await _apiServices.getPostApiResponse(AppConfig.serachAPI,data);
      return response = SearchResponse.fromJson(response);
    }catch(e){
      throw e;
    }
  }
}