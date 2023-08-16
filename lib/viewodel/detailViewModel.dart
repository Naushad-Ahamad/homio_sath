import 'package:flutter/cupertino.dart';
import 'package:hica_app/model/detailResponse.dart';

import '../data/response/api_response.dart';
import '../repository/productDetailRepository.dart';

/**
 * Created by Vikash Kumar Bharti on 20-05-2023.
 * Designation : Flutter & Android Developer
 * Company Name : 18 Pixels India Pvt. Ltd
 * Email Id : vikash.18pixels@gmail.com
 */
class DetailViewModel extends ChangeNotifier{
  final myRepo=ProductDetailRepository();
  ApiResponse<DetailResponse> response=ApiResponse.loading();


  Future<void> getDetail(String producId) async{
    setData(ApiResponse.loading());
    myRepo.detail(producId).then((value) => {
      print(value.data.toString()),
      setData(ApiResponse.completed(value))
    }).onError((error, stackTrace) => {
      print(error.toString()),
      setData(ApiResponse.error(error.toString()))
    });
  }
  setData( ApiResponse<DetailResponse> respon){
    response=respon;
    notifyListeners();
  }
}