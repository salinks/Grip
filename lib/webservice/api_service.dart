

import 'dart:convert';
import 'dart:developer';
import 'package:grip/models/common/common_response.dart';
import 'package:grip/models/forgotPassword/forgot_password_response.dart';
import 'package:http/http.dart' as http;
import 'package:grip/models/login/LoginResponse.dart';
import 'package:grip/webservice/api_constants.dart';

class ApiService {
  Future<LoginResponse?> doLogin(String code) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {

        LoginResponse _model = LoginResponse.fromJson(response.body as Map<String, dynamic>);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }


    Future<ForgotPasswordResponse?> forgotPassword(String code) async {
    try {




      final response = await http.post(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.forgotPassword),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
      'Email': code,
      }),
      );

      if (response.statusCode == 200) {

        ForgotPasswordResponse _model = ForgotPasswordResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
        return _model;

      }
      else{

        ForgotPasswordResponse _model = ForgotPasswordResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
        return _model;
      }
    } catch (e) {
      log(e.toString());
      if(e.toString().startsWith("ClientException with SocketException")){
        ForgotPasswordResponse mm = ForgotPasswordResponse();
        mm.statusCode ="1000";
        mm.statusMessage = "No Connection With Server";
        return mm;

      }
    }
  }






}
