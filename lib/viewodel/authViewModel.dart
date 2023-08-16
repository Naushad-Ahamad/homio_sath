import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hica_app/model/user/LogoutResponse.dart';
import 'package:hica_app/repository/authRepository.dart';
import 'package:hica_app/utils/routes/routes_name.dart';
import 'package:hica_app/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/response/api_response.dart';
import '../model/user/userRegistrationResponse.dart';

/**
 * Created by Vikash Kumar Bharti on 15-05-2023.
 * Designation : Flutter & Android Developer
 * Company Name : 18 Pixels India Pvt. Ltd
 * Email Id : vikash.18pixels@gmail.com
 */
class AuthViewModel extends ChangeNotifier{


  final repo= AuthRepository();

  bool _loading=false;
  bool get loading =>_loading;
  bool _regLoading=false;
  bool get regLoading =>_regLoading;
  String authToken='';
  String userId='';
  void setLoading( bool value){
    _loading =value;
    notifyListeners();
  }
  Future<void > getLogin(dynamic data, BuildContext context) async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    setLoading(true);
    repo.loginAPI(data).then((value) => {
      setLoading(false),
      sharedPreferences.setString("authToken", 'Bearer '+value.data.token),
      sharedPreferences.setString("userId", value.data.userId.toString()),
/*
      sharedPreferences.setString("profilePicture", value.data.photo.toString()),
*/
        Navigator.pushNamedAndRemoveUntil(context,RoutesName.homeContainer, (route) => false),
    }).onError((error, stackTrace) => {
    setLoading(false),
    Utils.errorMessage(error.toString(), context),
    });
  }
  void setRegistrationData(bool value){
    _regLoading =value;
    notifyListeners();
  }
  Future<void > getRegistration(dynamic data, BuildContext context) async{
    setRegistrationData(true);
    repo.registrationAPI(data).then((value) => {
      setRegistrationData(false),
        Navigator.pushNamedAndRemoveUntil(context,RoutesName.loginScreen, (route) => false),
    }).onError((error, stackTrace) => {
      setRegistrationData(false),
    Utils.errorMessage(error.toString(), context),
    });
  }

  /*setLogoutData(ApiResponse<LogoutResponse> mlistResponse) {
    model = mlistResponse;
    notifyListeners();
  }

  Future<void> getLogout(context) async {
    setLogoutData(ApiResponse.loading());
    repo
        .logoutAPI()
        .then((value) => {
      setLogoutData(ApiResponse.completed(value)),
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(value.name.toString()))),
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.loginScreen, (route) => false),
      *//* ToastComponent.showDialog(value.message.toString(), context, gravity: Toast.center),*//*
    })
        .onError((error, stackTrace) =>
    {setLogoutData(ApiResponse.error(error.toString()))});
  }*/
}