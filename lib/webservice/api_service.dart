

import 'dart:convert';
import 'package:grip/models/forgotPassword/forgot_password_response.dart';
import 'package:http/http.dart' as http;
import 'package:grip/models/login/LoginResponse.dart';
import 'package:grip/webservice/api_constants.dart';

import '../models/dashboard/my_packages.dart';

class ApiService {


        Future<LoginResponse?> doLogin(String userName, String password) async {
          try {


            final response = await http.post(
              Uri.parse(ApiConstants.baseUrl + ApiConstants.memberLogin),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                'User_ID': userName,
                'User_Password': password,
              }),
            );
            if (response.statusCode == 200) {

              LoginResponse _model = LoginResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
              return _model;

            }
            else{

              try {
                LoginResponse _model = LoginResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
                return _model;
              } catch (e) {
                print(e);
              }
            }
          } catch (e) {

            if(e.toString().startsWith("ClientException with SocketException")){
              LoginResponse mm = LoginResponse();
              mm.result?.statusCode ="1000";
              mm.result?.statusMessage = "No Connection With Server";
              return mm;

            }
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

      if(e.toString().startsWith("ClientException with SocketException")){
        ForgotPasswordResponse mm = ForgotPasswordResponse();
        mm.statusCode ="1000";
        mm.statusMessage = "No Connection With Server";
        return mm;

      }
    }
  }






        Future<MyPackageResponse?> myPackages(String userId) async {
          try {




            final response = await http.post(
              Uri.parse(ApiConstants.baseUrl + ApiConstants.myPackages),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                'MemberID': userId,
              }),
            );

            if (response.statusCode == 200) {

              MyPackageResponse _model = MyPackageResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
              return _model;

            }
            else{

              MyPackageResponse _model = MyPackageResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
              return _model;
            }
          } catch (e) {

            if(e.toString().startsWith("ClientException with SocketException")){
              MyPackageResponse mm = MyPackageResponse();
              mm.result!.statusCode ="1000";
              mm.result!.statusMessage = "No Connection With Server";
              return mm;

            }
          }
        }








}
