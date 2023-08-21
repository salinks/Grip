









import 'package:grip/interacters/dashboard_contract.dart';

import '../webservice/api_service.dart';

class DashboardPresenter implements DashboardInteractor {
  DashboardView view;
  DashboardPresenter(this.view);
  ApiService api = ApiService();






  @override
  Future<void> callHomeImages() async {
    await api.homeImages().then((it){

      if(it != null && it.result != null){
        if(it.result?.statusCode == "200"){
          view.successAction(it);
        }else{
          view.error("A");
        }

      }
      else{
        view.error("B");
      }
    }).catchError((e){

      view.error("$e");
    }

    );
  }







}