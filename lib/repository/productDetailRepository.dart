import 'package:hica_app/model/detailResponse.dart';

import '../data/network/appConfig.dart';
import '../data/network/baseApiServices.dart';
import '../data/network/networkApiServices.dart';

/**
 * Created by Vikash Kumar Bharti on 20-05-2023.
 * Designation : Flutter & Android Developer
 * Company Name : 18 Pixels India Pvt. Ltd
 * Email Id : vikash.18pixels@gmail.com
 */

class ProductDetailRepository{
  BaseApiServices  _apiServices=NetworkApiServices();
  Future<DetailResponse> detail(String producId) async{
    try{
      dynamic response= await _apiServices.getGetApiResponse(AppConfig.productDetailAPI+producId.toString());
      return response = DetailResponse.fromJson(response);
    }catch(e){
      throw e;
    }
  }
}