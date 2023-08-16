import '../data/network/appConfig.dart';
import '../data/network/baseApiServices.dart';
import '../data/network/networkApiServices.dart';
import '../model/home/topRatedInstituteResponse.dart';

/**
 * Created by Vikash Kumar Bharti on 05-05-2023.
 * Designation : Flutter & Android Developer
 * Company Name : 18 Pixels India Pvt. Ltd
 * Email Id : vikash.18pixels@gmail.com
 */
class ListingRepository{
  BaseApiServices  _apiServices=NetworkApiServices();

  Future<TopRatedInstituteResponse> listing(dynamic data) async{
    try{
      dynamic response= await _apiServices.getPostApiResponse(AppConfig.categoryListingApi,data);
      return response = TopRatedInstituteResponse.fromJson(response);
    }catch(e){
      throw e;
    }
  }
}