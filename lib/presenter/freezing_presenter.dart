import '../interacters/freezing_contract.dart';
import '../webservice/api_service.dart';

class FreezingPresenter implements FreezingInteractor {
  FreezingView view;
  FreezingPresenter(this.view);
  ApiService api = ApiService();


  @override
  Future<void> callFreezingDetails(String userid) async {
    await api.freezingDetails(userid).then((it){

      if(it != null){
        if(it.result?.statusCode == "200"){
          view.successFreezingAction(it);
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