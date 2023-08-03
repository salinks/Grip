import 'package:grip/models/booking/booking_response.dart';

import '../models/booking/available_schedule.dart';


class ScheduleInteractor {

}

class ScheduleView{


  void error() {}

  void successAction(AvailableScheduleResponse it) {}

  void successBooking(BookingResponse it) {}

  void errorBooking(String? statusMessage) {}

}