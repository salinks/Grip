
import 'package:flutter/material.dart';
import 'package:grip/models/dashboard/cancel_booking_response.dart';
import 'package:grip/models/dashboard/my_bookings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../interacters/my_bookings_contract.dart';
import '../presenter/my_bookings_presenter.dart';
import '../utils/gripUtils.dart';

class MyBookingsActivity extends StatefulWidget {
  @override
  _MyBookingsActivityState createState() => _MyBookingsActivityState();
}

class _MyBookingsActivityState extends State<MyBookingsActivity>
    implements MyBookingsView {
  late MyBookingsPresenter presenter;
  bool isLoading = false;
  late BuildContext alertContext;
  List<BookingData>? bookingData;



  @override
  void initState() {
    super.initState();
    presenter = MyBookingsPresenter(this);
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
                                surfaceTintColor: bookingData![index].isDeleted == true ? Colors.red.shade300 : Colors.white,
                                shadowColor: Colors.grey.shade200,
                                color: GripUtils().parseColor("#FFFFFF"),
                                child: Container(
                                  margin: EdgeInsets.only(top: 10, left: 10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Package Name",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            textAlign: TextAlign.left),
                                        Text(
                                            "${bookingData![index].pACKAGENAME}",
                                            maxLines: 1,
                                            overflow: TextOverflow.clip,
                                            softWrap: false,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                            )),
                                        SizedBox(height: 8),
                                        Row(children: <Widget>[
                                          Expanded(
                                              flex: 5,
                                              child: Text(
                                                "Booking Date",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                                textAlign: TextAlign.left,
                                              )),
                                          Expanded(
                                            flex: 5,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10),
                                              child: Text(
                                                "Booking Time",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          )
                                        ]),
                                        Row(children: <Widget>[
                                          Expanded(
                                              flex: 5,
                                              child: Text(
                                                GripUtils()
                                                    .dateOneFormat2Another(
                                                        bookingData![index]
                                                            .bookingDate
                                                            .toString(),
                                                        "yyyy-MM-dd'T'HH:mm:ss",
                                                        "dd MMM yyyy"),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                textAlign: TextAlign.left,
                                              )),
                                          Expanded(
                                            flex: 5,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10),
                                              child: Text(
                                                bookingData![index]
                                                    .timeSlot
                                                    .toString(),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          )
                                        ]),
                                        SizedBox(height: 8),
                                        Row(children: <Widget>[
                                          Expanded(
                                              flex: 5,
                                              child: Text(
                                                "Trainer",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                                textAlign: TextAlign.left,
                                              )),
                                          Expanded(
                                            flex: 5,
                                            child: Padding(
                                              padding:
                                              EdgeInsets.only(right: 10),
                                              child: Text(
                                                "Info",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          )
                                        ]),
                                        Row(children: <Widget>[
                                          Expanded(
                                              flex: 5,
                                              child: Text(
                                                bookingData![index]
                                                    .employeeFirstName
                                                    .toString(),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                textAlign: TextAlign.left,
                                              )),
                                          Expanded(
                                            flex: 5,
                                            child: Padding(
                                              padding:
                                              EdgeInsets.only(right: 10),
                                              child: Text(
                                                  bookingData![index]
                                                      .aGENDANAME != null ?
                                                bookingData![index]
                                                    .aGENDANAME
                                                    .toString() : "-",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          )
                                        ]),
                                        bookingData![index].isDeleted == true ?
                                        Align(alignment: Alignment.centerRight,
                                            child:   Container(
                                          margin: const EdgeInsets.all(15.0),
                                          padding: const EdgeInsets.all(3.0),
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.red)
                                          ),
                                          child: Text('Cancelled',style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          )),
                                        )):
                                        Align(alignment: Alignment.centerRight,
                                        child: TextButton(
                                          onPressed: () {askPermission(bookingData![index].bookingId.toString());
                                          },
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.only(left: 10,right: 10),

                                          ),

                                          child: Text('Cancel Booking',style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          )),
                                        )),
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
  void successAction(MyBookingResponse it) {
    setState(() {
      bookingData = it.bookingData;
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
    presenter.callMyBookings(userId);
  }

  void askPermission(String scheduleId) async {
    return showModalBottomSheet(
        isScrollControlled: false,
        enableDrag: false,
        isDismissible: false,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15),
                    SizedBox(
                      height: 50,
                      child: Center(
                        child: Text(
                          "Delete Booking",
                          style: TextStyle(
                            color: Color.fromRGBO(65, 64, 66, 1.0),
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.grey,
                      height: .5,
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        "Are you sure want to delete this booking ?",
                        style: TextStyle(
                          color: Color.fromRGBO(65, 64, 66, 1.0),
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      width: 200,
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      child:  Row(
                        children: <Widget>[
                          Expanded(
                              flex: 5,
                              child: ElevatedButton(
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                  var userId = await getUserId();
                                  presenter.deleteBooking(userId,scheduleId);

                                },
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 0.0, vertical: 0.0),
                                    backgroundColor: Color.fromRGBO(213, 0, 109, 1.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0))),
                                child: Text(
                                  "DELETE",
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                ),
                              )),
                          SizedBox(
                            height: 50,
                            width: 5,
                          ),
                          Expanded(
                              flex: 5,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 0.0, vertical: 0.0),
                                    backgroundColor: Colors.black12,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0))),
                                child: Text(
                                  "CANCEL",
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                ),
                              ))
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 50,
                      width: 200,
                    ),
                  ],
                ))));
  }



  @override
  Future<void> successCancelAction(CancelBookingResponse it) async {

    var userId = await getUserId();
    presenter.callMyBookings(userId);
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

