import 'package:grip/models/login/LoginResponse.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

class LoginActivityInteractor {

  void doLogin(String email,String password){}

  void destroy(){}
}

class LoginActivityView{
  void warningToast(String message){}
  void successToast(String message){}
  void errorToast(String message){}

  void finish(){}

  void successAction(LoginResponse? it) {}
}