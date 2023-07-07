import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

class LoginActivityInteractor {
  void doLoginGet(String email,ProgressDialog pr){}
  void doLogin(String email,String password,ProgressDialog pr){}

  void destroy(){}
}

class LoginActivityView{
  void warningToast(String message){}
  void successToast(String message){}
  void errorToast(String message){}

  void finish(){}
}