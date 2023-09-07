
import '../interacters/mynotifications_contract.dart';
import '../webservice/api_service.dart';

class MyNotificationsPresenter implements MyNotificationsInteractor {
  MyNotificationsView view;
  MyNotificationsPresenter(this.view);
  ApiService api = ApiService();



  @override
  Future<void> callMyNotifications(String userId) async {
    await api.getMyNotifications(userId).then((it){

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