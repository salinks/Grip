
import 'package:flutter/material.dart';
import 'package:grip/models/dashboard/cancel_booking_response.dart';
import 'package:grip/models/dashboard/my_bookings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../interacters/mynotifications_contract.dart';
import '../models/dashboard/notification_response.dart';
import '../presenter/my_notifications_presenter.dart';
import '../utils/gripUtils.dart';

class NotificationsActivity extends StatefulWidget {
  @override
  _NotificationsActivityState createState() => _NotificationsActivityState();
}

class _NotificationsActivityState extends State<NotificationsActivity>
    implements MyNotificationsView {
  late MyNotificationsPresenter presenter;
  bool isLoading = false;
  late BuildContext alertContext;
  List<NotificationData>? bookingData;



  @override
  void initState() {
    super.initState();
    presenter = MyNotificationsPresenter(this);
    isLoading = true;
    callActivePackages();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: GripUtils().parseColor("#f0f0f0"),
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: isLoading
                ? Center(
                    child: SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          backgroundColor: Color.fromRGBO(213, 0, 109, 1.0),
                          strokeWidth: 5,
                          valueColor: AlwaysStoppedAnimation(
                              Color.fromRGBO(107, 218, 212, 1.0)),
                        )))
                :  bookingData != null && bookingData!.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: bookingData!.length,
                            itemBuilder: (context, index) => SizedBox(
                              width: double.infinity,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                elevation: 5,
                                surfaceTintColor: Colors.white,
                                shadowColor: Colors.grey.shade200,
                                color: GripUtils().parseColor("#FFFFFF"),
                                child: Container(
                                  margin: EdgeInsets.only(top: 10, left: 10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text( GripUtils()
                                            .dateOneFormat2Another(
                                            bookingData![index].nTime
                                                .toString(),
                                            "yyyy-MM-dd'T'HH:mm:ss",
                                            "dd MMM yyyy"),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            textAlign: TextAlign.left),
                                        Text(
                                            "${bookingData![index].nTitle}",
                                            maxLines: 1,
                                            overflow: TextOverflow.clip,
                                            softWrap: false,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                            )),
                                        Text(
                                            "${bookingData![index].nDescription}",
                                            maxLines: 1,
                                            overflow: TextOverflow.clip,
                                            softWrap: false,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w700,
                                            )),
                                        SizedBox(height: 8),



                                        SizedBox(height: 5),
                                      ]),
                                ),
                              ),
                            ),
                          )
                        : SizedBox(
                      height: 400,
                      child: Center(
                          child: Text(
                            "No data available",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          )),
                    ),
                  ));
  }

  @override
  void error() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  void successAction(MyNotifications it) {
    setState(() {
      bookingData = it.data;
      isLoading = false;
    });
  }

  Future<String> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('userId') ?? "");
    return token;
  }

  Future<void> callActivePackages() async {
    var userId = await getUserId();
    presenter.callMyNotifications(userId);
  }



  @override
  Future<void> successCancelAction(CancelBookingResponse it) async {

    var userId = await getUserId();
    presenter.callMyNotifications(userId);
  }

  @override
  void errorMessage(String statusMessage) {

    showTopSnackBar(

      Overlay.of(context),
      CustomSnackBar.info(

        backgroundColor: Colors.orange,
        message: statusMessage.toString(),
      ),
    );
  }

}

