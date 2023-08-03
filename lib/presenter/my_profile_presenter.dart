import '../interacters/profile_contract.dart';
import '../webservice/api_service.dart';

class MyProfilePresenter implements MyProfileInteractor {
  MyProfileView view;
  MyProfilePresenter(this.view);
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




}