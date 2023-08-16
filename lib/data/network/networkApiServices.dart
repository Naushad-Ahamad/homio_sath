import 'dart:convert';
import 'dart:io';

import 'package:hica_app/data/network/baseApiServices.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../appException.dart';



class NetworkApiServices extends BaseApiServices {
  // TODO: implement getGetApiResponse
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 15));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await post(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: data,
      ).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
        case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 404:
        throw UnauthorisedException('');
      case 204:
        throw NoDataException('');
      case 400:
        throw NoDataException('These credentials do not match our records.');
        case 403:
        throw NoDataException('You need to confirm your account. We have sent you an activation link, please check your email');
      default:
        throw FetchDataException('Error');
    }
  }
}
