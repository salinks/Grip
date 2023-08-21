
import '../interacters/change_password_contract.dart';
import '../webservice/api_service.dart';

class ChangePasswordPresenter implements ChangePasswordInteractor {
  ChangePasswordsView view;
  ChangePasswordPresenter(this.view);
  ApiService api = ApiService();



  @override
  Future<void> callMyProfile(String userId) async {
    await api.myProfile(userId).then((it){

      if(it != null){
        if(it.result?.statusCode == "200"){
          view.successAction(it);
        }else{
          view.error();
        }

      }
      else{
        view.error();
      }
    }).catchError((e){

      view.error();
    }

    );
  }



  Future<void> changePassword(String userId,String newPassword) async {
    await api.changePassword(userId,newPassword).then((it){

      if(it != null){
        if(it.result?.statusCode == "200"){
          view.onChangePassword(it);
        }else{
          view.errorMessage(it.result!.statusMessage!);
        }

      }
      else{
        view.errorMessage("");
      }
    }).catchError((e){

      view.errorMessage("");
    }

    );
  }




}