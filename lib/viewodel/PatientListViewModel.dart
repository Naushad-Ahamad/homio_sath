import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hica_app/model/favorite/PatientResponse.dart';

import 'package:hica_app/model/favorite/StockResponse.dart';
import 'package:hica_app/repository/PatientRepository.dart';
import 'package:hica_app/repository/StockRepository.dart';
import 'package:hica_app/utils/utils.dart';

import '../data/response/api_response.dart';

/**
 * Created by Shailaja  on 30-05-2023.
 * Designation : Flutter & Android Developer
 * Company Name : 18 Pixels India Pvt. Ltd
 * Email Id : Shailaja.18pixels@gmail.com
 */
class PatientListViewModel extends ChangeNotifier {
  final repo = PatientRepository();

  bool _loading = false;
  bool get loading => _loading;
  bool _regLoading = false;
  bool get regLoading => _regLoading;

  ApiResponse<PatientResponse> model = ApiResponse.loading();
 // ApiResponse<AdDetailsResponse> vmodel = ApiResponse.loading();

  setListData(ApiResponse<PatientResponse> mlistResponse) {
    model = mlistResponse;
    notifyListeners();
  }

  Future<void> getListDataAPI() async {
    setListData(ApiResponse.loading());
    repo.getPatientAPI()
        .then((value) => {setListData(ApiResponse.completed(value))})
        .onError((error, stackTrace) =>
            {setListData(ApiResponse.error(error.toString()))});
  }

 /* void setDeleteData(bool value) {
    _regLoading = value;
    notifyListeners();
  }

  Future<void> getDelete(dynamic data, BuildContext context) async {
    setDeleteData(true);
    repo.DeleteDataAPI(data)
        .then((value) => {
              setDeleteData(false),
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(value.message.toString()))),
              getListDataAPI(),
              *//* Navigator.pushNamedAndRemoveUntil(context,RoutesName.loginScreen, (route) => false),*//*
            })
        .onError((error, stackTrace) => {
              setDeleteData(false),
              Utils.errorMessage(error.toString(), context),
            });
  }

  setDetailListData(ApiResponse<AdDetailsResponse> mDetaillistResponse) {
    vmodel = mDetaillistResponse;
    notifyListeners();
  }

  Future<void> getDetailListDataAPI(String id) async {
    setDetailListData(ApiResponse.loading());
    repo.Addetailslisting(id)
        .then((value) => {setDetailListData(ApiResponse.completed(value))})
        .onError((error, stackTrace) =>
            {setDetailListData(ApiResponse.error(error.toString()))});
  }
*/
}
