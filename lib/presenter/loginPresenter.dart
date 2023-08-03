
import 'package:grip/interacters/login_activity_contract.dart';
import 'package:grip/webservice/api_service.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

class LoginActivityPresenter implements LoginActivityInteractor {
  LoginActivityView view;
  LoginActivityPresenter(this.view);
  ApiService api = ApiService();








  @override
  void doLogin(String userName,String password) async {
    await api.doLogin(userName,password).then((it){

      if(it != null){
        if(it.result?.statusCode == "200"){
          view.successToast(it.result!.statusMessage.toString());
          view.successAction(it);
        }else{
          view.errorToast(it.result!.statusMessage.toString());
        }

      }
      else{

        view.errorToast("Something went wrong");
      }
    }).catchError((e){

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