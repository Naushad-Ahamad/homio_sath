import 'package:flutter/cupertino.dart';
import '../data/response/api_response.dart';
import '../model/home/topRatedInstituteResponse.dart';
import '../repository/ListingRepository.dart';

/**
 * Created by Vikash Kumar Bharti on 05-05-2023.
 * Designation : Flutter & Android Developer
 * Company Name : 18 Pixels India Pvt. Ltd
 * Email Id : vikash.18pixels@gmail.com
 */

class InstituteListingViewModel extends ChangeNotifier{
  final repo= ListingRepository();
   bool show=false;
  ApiResponse<TopRatedInstituteResponse> model=ApiResponse.loading();

  setListData( ApiResponse<TopRatedInstituteResponse> response){
    model=response;
    notifyListeners();
  }
  setfilter(bool value ){
    show=value;
    notifyListeners();
  }
  Future<void > getListDataAPI(dynamic data) async{
    setListData(ApiResponse.loading());
    repo.listing(data).then((value) => {
      setfilter(true),
      setListData(ApiResponse.completed(value))
    }).onError((error, stackTrace) => {
      setfilter(false),
      setListData(ApiResponse.error(error.toString()))
    });
  }
}