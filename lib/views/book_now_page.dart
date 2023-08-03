import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grip/models/booking/available_schedule.dart';
import 'package:grip/models/booking/booking_response.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../interacters/schedule_contract.dart';
import '../models/booking/booking_request.dart';
import '../presenter/schedule_presenter.dart';
import '../utils/gripUtils.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

import 'home_page.dart';

class BookNowActivity extends StatefulWidget {
  @override
  _BookNowActivityState createState() => _BookNowActivityState();
}

class _BookNowActivityState extends State<BookNowActivity>
    implements ScheduleView {
  late SchedulePresenter presenter;
  bool shouldPop = true;
  bool isLoading = false;
  int _currentSelection = 0;
  late DateTime selectedDate;
  List<ScheduleData>? listData;

  Map<int, Widget> _children = {
    0: Text('PRIVATE SESSIONS'),
    1: Text('CLASSES')
  };

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    presenter = SchedulePresenter(this);
    isLoading = true;
    listData = null;
    callAPIS();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return shouldPop;
        },
        child: Scaffold(
            backgroundColor: GripUtils().parseColor("#f1f3f2"),
            body: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(children: <Widget>[
                  Container(
                      height: 180,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(213, 0, 109, 1.0),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(children: <Widget>[
                        SizedBox(
                            height: 80,
                            child: Padding(
                                padding: EdgeInsets.only(left: 5, top: 20),
                                child: Row(children: [
                                  IconButton(
                                      color: Colors.white,
                                      icon: Icon(Icons.arrow_back),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }),
                                  Text(
                                    "Available Schedules",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.left,
                                  )
                                ]))),
                        SizedBox(
                          width: double.infinity,
                          child: DatePicker(
                            DateTime.now(),
                            daysCount: 7,
                            initialSelectedDate: DateTime.now(),
                            selectionColor: Color.fromRGBO(107, 218, 212, 0.5),
                            selectedTextColor: Colors.white,
                            dayTextStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                            dateTextStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                            monthTextStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                            onDateChange: (date) {
                              setState(() {
                                selectedDate = date;
                                isLoading = true;
                                listData = null;
                              });
                              callAPIS();
                            },
                          ),
                        ),
                      ])),
                  SizedBox(
                    width: double.infinity,
                    child: MaterialSegmentedControl(
                      children: _children,
                      selectionIndex: _currentSelection,
                      borderColor: Colors.grey,
                      selectedColor: Color.fromRGBO(107, 218, 212, 1.0),
                      unselectedColor: Colors.white,
                      selectedTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                      unselectedTextStyle: TextStyle(
                          color: Color.fromRGBO(107, 218, 212, 1.0),
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                      borderWidth: 0.7,
                      horizontalPadding: EdgeInsets.all(10),
                      borderRadius: 5.5,
                      onSegmentTapped: (index) {
                        setState(() {
                          _currentSelection = index;
                          isLoading = true;
                          listData = null;
                        });
                        callAPIS();
                      },
                    ),
                  ),
                  _currentSelection == 0
                      ? isLoading
                          ? SizedBox(
                              width: double.infinity,
                              height: 500,
                              child: Center(
                                  child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: CircularProgressIndicator(
                                        backgroundColor:
                                            Color.fromRGBO(213, 0, 109, 1.0),
                                        strokeWidth: 5,
                                        valueColor: AlwaysStoppedAnimation(
                                            Color.fromRGBO(107, 218, 212, 1.0)),
                                      ))))
                          : (listData != null && listData!.isNotEmpty)
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: listData!.length,
                                  itemBuilder: (context, index) => SizedBox(
                                        width: double.infinity,
                                        child: GestureDetector(
                                          onTap: () => {
                                            showSessionInfo(listData![index])
                                          },
                                          child: Card(
                                            margin: const EdgeInsets.only(
                                                left: 0, right: 0, bottom: 10),
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0)),
                                            child: ListTile(
                                                title: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    SizedBox(height: 5),
                                                    Text(
                                                      listData![index]
                                                          .scheduleDescription!
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    SizedBox(height: 5),
                                                    Text(
                                                      'Trainer : ${listData![index].trinerName.toString()}  \u2022  Time : ${listData![index].timeSlot.toString()}',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    SizedBox(height: 5)
                                                  ],
                                                ),
                                                trailing: Icon(
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                  color: Colors.black54,
                                                )),
                                          ),
                                        ),
                                      ))
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
                                )
                      : isLoading
                          ? SizedBox(
                              width: double.infinity,
                              height: 500,
                              child: Center(
                                  child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: CircularProgressIndicator(
                                        backgroundColor:
                                            Color.fromRGBO(213, 0, 109, 1.0),
                                        strokeWidth: 5,
                                        valueColor: AlwaysStoppedAnimation(
                                            Color.fromRGBO(107, 218, 212, 1.0)),
                                      ))))
                          : (listData != null && listData!.isNotEmpty)
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: listData!.length,
                                  itemBuilder: (context, index) => SizedBox(
                                        width: double.infinity,
                                        child: GestureDetector(
                                          onTap: () => {
                                            showClassInfo(listData![index])
                                          },
                                          child: Card(
                                            margin: const EdgeInsets.only(
                                                left: 0, right: 0, bottom: 10),
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0)),
                                            child: ListTile(
                                                title: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    SizedBox(height: 5),
                                                    Text(
                                                      listData![index]
                                                          .scheduleDescription!
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    SizedBox(height: 5),
                                                    Text(
                                                      'Trainer : ${listData![index].trinerName.toString()}  \u2022  Time : ${listData![index].timeSlot.toString()}  \u2022  ${listData![index].seatCapacity.toString()} Seats available',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    SizedBox(height: 5)
                                                  ],
                                                ),
                                                trailing: Icon(
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                  color: Colors.black54,
                                                )),
                                          ),
                                        ),
                                      ))
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
                                )
                ]))));
  }

  Future<String> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('userId') ?? "");
    return token;
  }

  Future<void> callAPIS() async {
    var userId = await getUserId();

    String msg = _currentSelection.toString() +
        "  " +
        GripUtils().dateOneFormat2Another(
            selectedDate.toString(), "yyyy-MM-dd HH:mm:ss", "dd-MMM-yyyy");

    presenter.callAvailableSchedule(
        userId, GripUtils().dateOneFormat2Another(
        selectedDate.toString(), "yyyy-MM-dd HH:mm:ss", "dd-MMM-yyyy"), _currentSelection.toString());
  }

  void warningToast(String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        backgroundColor: Colors.orange,
        message: message.toString(),
      ),
    );
  }

  @override
  void error() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  void successAction(AvailableScheduleResponse it) {
    setState(() {
      isLoading = false;
      listData = it.data;
    });
  }

  showSessionInfo(ScheduleData scheduleData) {
    return showModalBottomSheet(

        isScrollControlled: true,
        enableDrag: false,
        isDismissible: false,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => Padding(
            padding: EdgeInsets.only(top: 0),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 0, 0, 0.8),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2), BlendMode.dstATop),
                        image: AssetImage(
                          './assets/images/bg_fp.png',
                        ),
                      ),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Center(
                          child: Text(
                        "BOOK YOUR SESSION".toUpperCase(),
                        style: TextStyle(
                          letterSpacing: 2.5,
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      )),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Image.asset(
                          './assets/images/grip_logo.png',
                          width: 120,
                        ),
                      )),
                  SizedBox(height: 10),
                  SizedBox(width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    child: Text(
                      scheduleData.scheduleDescription.toString(),
                      style: TextStyle(
                        letterSpacing: 0.5,
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )),
                  SizedBox(height: 10),
                  SizedBox(width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: Row(children: <Widget>[
                          Icon(  Icons.date_range_outlined,
                            color: Colors.black54,
                            size: 12,
                          ),
                          SizedBox(width: 8),
                          Text(GripUtils().dateOneFormat2Another(
                            scheduleData.dATE.toString(), "yyyy-MM-dd'T'HH:mm:ss", "EEEE, dd MMMM")
                          ,
                          style: TextStyle(
                            letterSpacing: 0.5,
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        )],),
                      )),
                  SizedBox(width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: Row(children: <Widget>[
                          Icon(  Icons.access_time_outlined,
                          color: Colors.black54,
                          size: 12,
                        ),
                        SizedBox(width: 8),
                          Text(
                            scheduleData.timeSlot.toString(),
                            style: TextStyle(
                              letterSpacing: 0.5,
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          )])
                      )),
                  SizedBox(height: 10),
                  Container(width: double.infinity,
                  height: .5,
                  color: Colors.grey),
                  SizedBox(height: 10),
                  SizedBox(width: double.infinity,
                      child: Padding(
                          padding: EdgeInsets.only(left: 10,right: 10),
                          child: Row(children: <Widget>[
                            Image.asset(
                              './assets/images/trainer_icon.png',
                              width: 50,
                            ),
                            SizedBox(width: 8),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 10),
                                Text(
                                  scheduleData.trinerName.toString(),
                                  style: TextStyle(
                                    letterSpacing: 0.5,
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                             /*  TextButton(onPressed:  () {}, child:  Text(
                                 "View Trainer Profile",
                                 style: TextStyle(
                                   letterSpacing: 0.5,
                                   color: Colors.cyan,
                                   fontSize: 12,
                                   fontWeight: FontWeight.w600,
                                 ),
                                 textAlign: TextAlign.left,
                               ))*/
                              ],
                            )])
                      )),
                  SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 5,
                            child: ElevatedButton(
                              onPressed: () async {

                                bookFb(scheduleData.packageRegId.toString(),scheduleData.cLASSSCHEDULEID.toString(),"0");
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0.0, vertical: 0.0),
                                  backgroundColor:
                                      Color.fromRGBO(213, 0, 109, 1.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              child: Text(
                                "BOOK",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
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
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              child: Text(
                                "CANCEL",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
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
              )),
            )));
  }

  showClassInfo(ScheduleData scheduleData) {
    return showModalBottomSheet(

        isScrollControlled: true,
        enableDrag: false,
        isDismissible: false,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => Padding(
            padding: EdgeInsets.only(top: 0),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 0, 0, 0.8),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.2), BlendMode.dstATop),
                            image: AssetImage(
                              './assets/images/bg_class.png',
                            ),
                          ),
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Center(
                              child: Text(
                                "BOOK YOUR CLASS".toUpperCase(),
                                style: TextStyle(
                                  letterSpacing: 2.5,
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.left,
                              )),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Image.asset(
                              './assets/images/grip_logo.png',
                              width: 120,
                            ),
                          )),
                      SizedBox(height: 10),
                      SizedBox(width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10,right: 10),
                            child: Text(
                              scheduleData.scheduleDescription.toString(),
                              style: TextStyle(
                                letterSpacing: 0.5,
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          )),
                      SizedBox(height: 10),
                      SizedBox(width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10,right: 10),
                            child: Row(children: <Widget>[
                              Icon(  Icons.date_range_outlined,
                                color: Colors.black54,
                                size: 12,
                              ),
                              SizedBox(width: 8),
                              Text(GripUtils().dateOneFormat2Another(
                                  scheduleData.dATE.toString(), "yyyy-MM-dd'T'HH:mm:ss", "EEEE, dd MMMM")
                                ,
                                style: TextStyle(
                                  letterSpacing: 0.5,
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              )],),
                          )),
                      SizedBox(width: double.infinity,
                          child: Padding(
                              padding: EdgeInsets.only(left: 10,right: 10),
                              child: Row(children: <Widget>[
                                Icon(  Icons.access_time_outlined,
                                  color: Colors.black54,
                                  size: 12,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  scheduleData.timeSlot.toString(),
                                  style: TextStyle(
                                    letterSpacing: 0.5,
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.left,
                                )])
                          )),
                      SizedBox(height: 10),
                      Container(width: double.infinity,
                          height: .5,
                          color: Colors.grey),
                      SizedBox(height: 10),
                      SizedBox(width: double.infinity,
                          child: Padding(
                              padding: EdgeInsets.only(left: 10,right: 10),
                              child: Row(children: <Widget>[
                                Image.asset(
                                  './assets/images/trainer_icon.png',
                                  width: 50,
                                ),
                                SizedBox(width: 8),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 10),
                                    Text(
                                      scheduleData.trinerName.toString(),
                                      style: TextStyle(
                                        letterSpacing: 0.5,
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    /*  TextButton(onPressed:  () {}, child:  Text(
                                 "View Trainer Profile",
                                 style: TextStyle(
                                   letterSpacing: 0.5,
                                   color: Colors.cyan,
                                   fontSize: 12,
                                   fontWeight: FontWeight.w600,
                                 ),
                                 textAlign: TextAlign.left,
                               ))*/
                                  ],
                                )])
                          )),
                      SizedBox(height: 50),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                flex: 5,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    bookFb(scheduleData.packageRegId.toString(),scheduleData.cLASSSCHEDULEID.toString(),"1");
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 0.0, vertical: 0.0),
                                      backgroundColor:
                                      Color.fromRGBO(213, 0, 109, 1.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10.0))),
                                  child: Text(
                                    "BOOK",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
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
                                          borderRadius:
                                          BorderRadius.circular(10.0))),
                                  child: Text(
                                    "CANCEL",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
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
                  )),
            )));
  }

  Future<void> bookFb(String regId, String scheduleId, String isClass) async {
    var userId = await getUserId();
    BookRequest req =   BookRequest();
    req.memberID = userId;
    req.bookingDate = GripUtils().dateOneFormat2Another(selectedDate.toString(), "yyyy-MM-dd HH:mm:ss", "dd-MMM-yyyy");
    req.bookingPackageRegId = regId;
    req.isClass = isClass;
    req.classScheduleID = scheduleId;


    presenter.bookNow(req);

  }

  @override
  void errorBooking(String? statusMessage) {
    errorToast(statusMessage!);
  }

  @override
  void successBooking(BookingResponse it) {
    successToast(it.result!.statusMessage.toString());
    var duration = const Duration(seconds: 2);
     Timer(duration, () {


      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) =>
            HomePage()),
      );



    });
  }

  @override
  void errorToast(String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        backgroundColor: Colors.redAccent,
        message: message.toString(),
      ),
    );
  }

  @override
  void successToast(String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: message.toString(),
      ),
    );
  }



}

