import 'package:flutter/widgets.dart';
import 'package:hica_app/data/response/api_response.dart';
import 'package:hica_app/model/home/topRatedInstituteResponse.dart';
import 'package:hica_app/model/searchResponse.dart';
import 'package:hica_app/repository/searchRepository.dart';
import 'package:hica_app/utils/utils.dart';

/**
 * Created by Vikash Kumar Bharti on 18-05-2023.
 * Designation : Flutter & Android Developer
 * Company Name : 18 Pixels India Pvt. Ltd
 * Email Id : vikash.18pixels@gmail.com
 */

class SearchViewModel extends ChangeNotifier{
  final myRepo=SearchRepository();
  ApiResponse<SearchResponse> response=ApiResponse.loading();

  setListData( ApiResponse<SearchResponse> respo){
    response=respo;
    notifyListeners();
  }

  Future<void> search(dynamic data, BuildContext context) async{
    setListData(ApiResponse.loading());
    myRepo.searchAPI(data).then((value) => {
    setListData(ApiResponse.completed(value)),
    }).onError((error, stackTrace) => {
      setListData(ApiResponse.error(error.toString()))
    });
  }
}