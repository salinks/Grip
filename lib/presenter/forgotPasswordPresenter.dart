
import 'package:grip/interacters/forgot_password_contract.dart';
import 'package:grip/webservice/api_service.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';



class ForgotPasswordPresenter implements ForgotPasswordInteractor {
  ForgotPasswordView view;
  ForgotPasswordPresenter(this.view);
  ApiService api = ApiService();





  @override
  void doResetPassword(String code, ProgressDialog pr) async {
    await api.forgotPassword(code).then((it){
      pr.hide();
      if(it != null){
        if(it.statusCode == "200"){
          view.successToast(it.statusMessage);
          view.successAction();
        }else{
          view.errorToast(it.statusMessage);
        }

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




}