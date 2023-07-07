
import 'package:grip/interacters/login_activity_contract.dart';
import 'package:grip/webservice/api_service.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

class LoginActivityPresenter implements LoginActivityInteractor {
  LoginActivityView view;
  LoginActivityPresenter(this.view);
  ApiService api = ApiService();





  @override
  void doLoginGet(String code,ProgressDialog pr) async {
    await api.doLogin(code).then((it){
      if(it?.statusCode == "1"){
        // User u = User.fromJson(it.data);
        // this.success(u.api_token);
        view?.finish();
      }else{
       // view?.toast("Login gagal. Periksa email dan katasandi anda");
      }
    }).catchError((e){
      print("Exception $e");
     // view?.toast("Terjadi kesalahan");
    });
  }



  @override
  void doLogin(String userName,String password, ProgressDialog pr) async {
    await api.forgotPassword(userName).then((it){
      pr.hide();
      if(it != null){
        // if(it.statusCode == "200"){
        //   view.successToast(it.statusMessage);
        //   view.successAction();
        // }else{
        //   view.errorToast(it.statusMessage);
        // }

      }
      else{
        view.errorToast("Something went wrong");
      }
    }).catchError((e){
      pr.hide();
      print("Exception $e");
      view.errorToast("Something went wrong");
    }

    );
  }



  @override
  void destroy() {
   view.finish();
  }

  @override
  void success(String token) {

  }
}