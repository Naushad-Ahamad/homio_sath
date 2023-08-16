

import 'package:hica_app/model/user/LogoutResponse.dart';
import 'package:hica_app/model/user/loginResponse.dart';

import '../data/network/appConfig.dart';
import '../data/network/baseApiServices.dart';
import '../data/network/networkApiServices.dart';
import '../model/user/userRegistrationResponse.dart';

/**
 * Created by Vikash Kumar Bharti on 15-05-2023.
 * Designation : Flutter & Android Developer
 * Company Name : 18 Pixels India Pvt. Ltd
 * Email Id : vikash.18pixels@gmail.com
 */
class AuthRepository{
  BaseApiServices  _apiServices=NetworkApiServices();

  Future<LoginResponse> loginAPI(dynamic data) async{
    try{
      dynamic response= await _apiServices.getPostApiResponse(AppConfig.loginAPI,data);
      return response = LoginResponse.fromJson(response);
    }catch(e){
      throw e;
    }
  }
  Future<UserRegistrationResponse> registrationAPI(dynamic data) async{
    try{
      dynamic response= await _apiServices.getPostApiResponse(AppConfig.registrationAPI,data);
      return response = UserRegistrationResponse.fromJson(response);
    }catch(e){
      throw e;
    }
  }

  Future<LogoutResponse> logoutAPI(dynamic data) async{
    try{
      dynamic response= await _apiServices.getPostApiResponse(AppConfig.loginAPI,data);
      return response = LogoutResponse.fromJson(response);
    }catch(e){
      throw e;
    }
  }
}