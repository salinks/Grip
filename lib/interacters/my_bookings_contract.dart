



import 'package:grip/models/dashboard/cancel_booking_response.dart';
import 'package:grip/models/dashboard/my_bookings.dart';

class MyBookingsInteractor {
  void callMyBookings(String userId){}

}

class MyBookingsView{

  void error() {}

  void successAction(MyBookingResponse it) {}

  void successCancelAction(CancelBookingResponse it) {}

  void errorMessage(String statusMessage) {}
}