
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

import '../interacters/my_bookings_contract.dart';
import '../webservice/api_service.dart';

class MyBookingsPresenter implements MyBookingsInteractor {
  MyBookingsView view;
  MyBookingsPresenter(this.view);
  ApiService api = ApiService();



  @override
  Future<void> callMyBookings(String userId) async {
    await api.myBookings(userId).then((it){

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
  Future<void> deleteBooking(String userId,String bookingID) async {
    await api.cancelBooking(userId,bookingID).then((it){

      if(it != null){
        if(it.result?.statusCode == "200"){

          view.successCancelAction(it);
        }else{

          view.errorMessage(it.result!.statusMessage.toString());
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