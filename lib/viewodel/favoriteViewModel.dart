import 'package:flutter/cupertino.dart';
import 'package:hica_app/utils/utils.dart';

import '../data/response/api_response.dart';
import '../model/favorite/myFavoriteResponse.dart';
import '../repository/favoriteRepository.dart';

class FavoriteViewModel extends ChangeNotifier{
  final repo= FavoriteRepository();
  ApiResponse<MyFavoriteResponse> response=ApiResponse.loading();


  setListData( ApiResponse<MyFavoriteResponse> listResponse){
    response=listResponse;
    notifyListeners();
  }
  Future<void > getListDataAPI() async{
    setListData(ApiResponse.loading());
    repo.getFavoriteAPI().then((value) => {
      setListData(ApiResponse.completed(value))
    }).onError((error, stackTrace) => {
      setListData(ApiResponse.error(error.toString()))
    });
  }
  // setResponse( ApiResponse<MyFavoriteResponse> listResponse){
  //   response=listResponse;
  //   notifyListeners();
  // }
  Future<void > addToFavAPI(dynamic data,BuildContext context) async{
    // setListData(ApiResponse.loading());
    repo.addFavoriteAPI(data).then((value) => {
      // setListData(ApiResponse.completed(value))
      Utils.successMessage(value.message, context)
    }).onError((error, stackTrace) => {
      Utils.errorMessage(error.toString(), context)
      // setListData(ApiResponse.error(error.toString()))
    });
  }
  Future<void > removeFromFavAPI(dynamic data,BuildContext context) async{
    // setListData(ApiResponse.loading());
    repo.removeFromFav(data).then((value) => {
      getListDataAPI(),
      Utils.successMessage(value.message, context)
    }).onError((error, stackTrace) => {
      Utils.errorMessage(error.toString(), context)
    });
  }
}