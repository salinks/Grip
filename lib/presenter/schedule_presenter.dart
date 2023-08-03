



import 'package:grip/interacters/schedule_contract.dart';

import '../models/booking/booking_request.dart';
import '../webservice/api_service.dart';

class SchedulePresenter implements ScheduleInteractor {
  ScheduleView view;
  SchedulePresenter(this.view);
  ApiService api = ApiService();






  @override
  Future<void> callAvailableSchedule(String userid,String mDate,String type) async {
    await api.availableSchedule(userid,mDate,type).then((it){

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





  @override
  Future<void> bookNow(BookRequest req) async {
    await api.bookNow(req).then((it){

      if(it != null){
        if(it.result?.statusCode == "200"){
          view.successBooking(it);
        }else{
          view.errorBooking(it.result?.statusMessage);
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