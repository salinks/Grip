import '../interacters/active_packages.dart';
import '../webservice/api_service.dart';

class MyPackagesPresenter implements MyPackagesInteractor {
  MyPackagesView view;
  MyPackagesPresenter(this.view);
  ApiService api = ApiService();






  @override
  Future<void> callMyPackages(String userid) async {
    await api.myPackages(userid).then((it){

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