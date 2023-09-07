

import 'dart:convert';
import 'package:grip/models/dashboard/home_image_response.dart';
import 'package:grip/models/dashboard/my_profile_response.dart';
import 'package:grip/models/forgotPassword/forgot_password_response.dart';
import 'package:http/http.dart' as http;
import 'package:grip/models/login/LoginResponse.dart';
import 'package:grip/webservice/api_constants.dart';

import '../models/booking/available_schedule.dart';
import '../models/booking/booking_request.dart';
import '../models/booking/booking_response.dart';
import '../models/dashboard/cancel_booking_response.dart';
import '../models/dashboard/freezing_details.dart';
import '../models/dashboard/my_bookings.dart';
import '../models/dashboard/my_packages.dart';
import '../models/forgotPassword/change_password_response.dart';
import '../models/login/reg_fcm_response.dart';

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







        Future<RegFCMResponse?> regFCM(String userId,String fcmToken,String deviceType) async {
          try {


            final response = await http.post(
              Uri.parse(ApiConstants.baseUrl + ApiConstants.regFcm),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                'Member_ID': userId,
                'FCM_Code': fcmToken,
                'Device_Type': deviceType,
              }),
            );
            if (response.statusCode == 200) {

              RegFCMResponse _model = RegFCMResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
              return _model;

            }
            else{

              try {
                RegFCMResponse _model = RegFCMResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
                return _model;
              } catch (e) {
                print(e);
              }
            }
          } catch (e) {

            if(e.toString().startsWith("ClientException with SocketException")){
              RegFCMResponse mm = RegFCMResponse();
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



        Future<FreezingDetails?> freezingDetails(String userId) async {
          try {
            final response = await http.post(
              Uri.parse(ApiConstants.baseUrl + ApiConstants.freezingDetails),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                'MemberID': userId,
              }),
            );

            if (response.statusCode == 200) {

              FreezingDetails _model = FreezingDetails.fromJson(json.decode(response.body) as Map<String, dynamic>);
              return _model;

            }
            else{

              FreezingDetails _model = FreezingDetails.fromJson(json.decode(response.body) as Map<String, dynamic>);
              return _model;
            }
          } catch (e) {

            if(e.toString().startsWith("ClientException with SocketException")){
              FreezingDetails mm = FreezingDetails();
              mm.result!.statusCode ="1000";
              mm.result!.statusMessage = "No Connection With Server";
              return mm;

            }
          }
        }





        Future<MyBookingResponse?> myBookings(String userId) async {
          try {
            final response = await http.post(
              Uri.parse(ApiConstants.baseUrl + ApiConstants.bookingList),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                'MemberID': userId,
              }),
            );

            if (response.statusCode == 200) {

              MyBookingResponse _model = MyBookingResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
              return _model;

            }
            else{

              MyBookingResponse _model = MyBookingResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
              return _model;
            }
          } catch (e) {

            if(e.toString().startsWith("ClientException with SocketException")){
              MyBookingResponse mm = MyBookingResponse();
              mm.result!.statusCode ="1000";
              mm.result!.statusMessage = "No Connection With Server";
              return mm;

            }
          }
        }



        Future<CancelBookingResponse?> cancelBooking(String userId,String bookingID) async {
          try {
            final response = await http.post(
              Uri.parse(ApiConstants.baseUrl + ApiConstants.cancelBooking),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                'MemberID': userId,
                'BookingID': bookingID
              }),
            );

            if (response.statusCode == 200) {

              CancelBookingResponse _model = CancelBookingResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
              return _model;

            }
            else{

              CancelBookingResponse _model = CancelBookingResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
              return _model;
            }
          } catch (e) {

            if(e.toString().startsWith("ClientException with SocketException")){
              CancelBookingResponse mm = CancelBookingResponse();
              mm.result!.statusCode ="1000";
              mm.result!.statusMessage = "No Connection With Server";
              return mm;

            }
          }
        }




        Future<MyProfileResponse?> myProfile(String userId) async {
          try {
            final response = await http.get(
              Uri.parse(ApiConstants.baseUrl + ApiConstants.myProfile+userId),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },

            );

            if (response.statusCode == 200) {

              MyProfileResponse _model = MyProfileResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
              return _model;

            }
            else{

              MyProfileResponse _model = MyProfileResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
              return _model;
            }
          } catch (e) {

            if(e.toString().startsWith("ClientException with SocketException")){
              MyProfileResponse mm = MyProfileResponse();
              mm.result!.statusCode ="1000";
              mm.result!.statusMessage = "No Connection With Server";
              return mm;

            }
          }
        }


        Future<HomeImageResponse?> homeImages() async {
          try {
            final response = await http.get(
              Uri.parse(ApiConstants.baseUrl + ApiConstants.homeImages),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },

            );

            if (response.statusCode == 200) {

              HomeImageResponse _model = HomeImageResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
              return _model;

            }
            else{

              HomeImageResponse _model = HomeImageResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
              return _model;
            }
          } catch (e) {

            if(e.toString().startsWith("ClientException with SocketException")){
              HomeImageResponse mm = HomeImageResponse();
              mm.result!.statusCode ="1000";
              mm.result!.statusMessage = "No Connection With Server";
              return mm;

            }
          }
        }




        Future<AvailableScheduleResponse?> availableSchedule(String userId,String selDate,String isClass) async {
          try {




            final response = await http.post(
              Uri.parse(ApiConstants.baseUrl + ApiConstants.availableSchedule),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                'MemberID': userId,
                'BookingDate': selDate,
                'Is_Class': isClass
              }),
            );

            if (response.statusCode == 200) {

              AvailableScheduleResponse _model = AvailableScheduleResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
              return _model;

            }
            else{

              AvailableScheduleResponse _model = AvailableScheduleResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
              return _model;
            }
          } catch (e) {

            if(e.toString().startsWith("ClientException with SocketException")){
              AvailableScheduleResponse mm = AvailableScheduleResponse();
              mm.result!.statusCode ="1000";
              mm.result!.statusMessage = "No Connection With Server";
              return mm;

            }
          }
        }



        Future<ChangePasswordResponse?> changePassword(String userId,String newPassword) async {
          try {




            final response = await http.post(
              Uri.parse(ApiConstants.baseUrl + ApiConstants.changePassword),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                'MemberID': userId,
                'User_New_Password': newPassword
              }),
            );

            if (response.statusCode == 200) {

              ChangePasswordResponse _model = ChangePasswordResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
              return _model;

            }
            else{

              ChangePasswordResponse _model = ChangePasswordResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
              return _model;
            }
          } catch (e) {

            if(e.toString().startsWith("ClientException with SocketException")){
              ChangePasswordResponse mm = ChangePasswordResponse();
              mm.result!.statusCode ="1000";
              mm.result!.statusMessage = "No Connection With Server";
              return mm;

            }
          }
        }




        Future<BookingResponse?> bookNow(BookRequest req) async {
          try {




            final response = await http.post(
              Uri.parse(ApiConstants.baseUrl + ApiConstants.bookNow),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                'MemberID': req.memberID.toString(),
                'BookingDate':  req.bookingDate.toString(),
                'BookingPackageRegId':  req.bookingPackageRegId.toString(),
                'ClassScheduleID':  req.classScheduleID.toString(),
                'Is_Class':  req.isClass.toString()
              }),
            );

            if (response.statusCode == 200) {

              BookingResponse _model = BookingResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
              return _model;

            }
            else{

              BookingResponse _model = BookingResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
              return _model;
            }
          } catch (e) {

            if(e.toString().startsWith("ClientException with SocketException")){
              BookingResponse mm = BookingResponse();
              mm.result!.statusCode ="1000";
              mm.result!.statusMessage = "No Connection With Server";
              return mm;

            }
          }
        }





}
