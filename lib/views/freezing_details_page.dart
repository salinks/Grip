import 'package:flutter/material.dart';
import 'package:grip/models/dashboard/freezing_details.dart';
import 'package:grip/models/dashboard/my_bookings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../interacters/freezing_contract.dart';
import '../interacters/my_bookings_contract.dart';
import '../presenter/freezing_presenter.dart';
import '../presenter/my_bookings_presenter.dart';
import '../utils/gripUtils.dart';
import 'custom_app_bar.dart';

class FreezingDetailsActivity extends StatefulWidget {
  @override
  _FreezingDetailsActivityState createState() =>
      _FreezingDetailsActivityState();
}

class _FreezingDetailsActivityState extends State<FreezingDetailsActivity>
    implements FreezingView {
  late FreezingPresenter presenter;
  bool isLoading = false;
  List<FreezingData>? freezingData;
  bool shouldPop = true;

  @override
  void initState() {
    super.initState();
    presenter = FreezingPresenter(this);
    isLoading = true;
    callActivePackages();
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
            child: Column(
              children: <Widget>[
                CustomAppBar(
                  height: 80,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, top: 20),
                    child: Row(children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Expanded(
                        child: Text(
                          "Freezing Details",
                          style: TextStyle(
                            color: Color.fromRGBO(65, 64, 66, 1.0),
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15, top: 8),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              './assets/images/grip_logo.png',
                              width: 100,
                            )),
                      ),
                    ]),
                  ),
                ),
                isLoading
                    ? SizedBox(
                        width: double.infinity,
                        height: 700,
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
                                ))),
                      )
                    : freezingData != null && freezingData!.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: freezingData!.length,
                            itemBuilder: (context, index) => SizedBox(
                              width: double.infinity,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                elevation: 5,
                                surfaceTintColor: Colors.white,
                                shadowColor: Colors.grey.shade200,
                                color: GripUtils().parseColor("#FFFFFF"),
                                child: Column(children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Expanded(
                                          flex: 3,
                                          child:Padding(
                                            padding: EdgeInsets.all(5),
                                            child:  Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                              elevation: 5,
                                              surfaceTintColor: Colors.white,
                                              shadowColor: Colors.grey.shade200,
                                              color: GripUtils()
                                                  .parseColor("#FFFFFF"),
                                              child:  Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Column(

                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text(
                                                        "Start Date",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 10,
                                                          fontWeight:
                                                          FontWeight.w300,
                                                        ),
                                                        textAlign:
                                                        TextAlign.center,
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text(
                                                          GripUtils().dateOneFormat2Another(
                                                              freezingData![index]
                                                                  .freezeFromDate
                                                                  .toString(),
                                                              "yyyy-MM-dd'T'HH:mm:ss",
                                                              "MMMM"),
                                                          maxLines: 1,
                                                          overflow:
                                                          TextOverflow.clip,
                                                          softWrap: false,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 13,
                                                            fontWeight:
                                                            FontWeight.w700,
                                                          )),
                                                      Text(
                                                          GripUtils().dateOneFormat2Another(
                                                              freezingData![index]
                                                                  .freezeFromDate
                                                                  .toString(),
                                                              "yyyy-MM-dd'T'HH:mm:ss",
                                                              "dd"),
                                                          maxLines: 1,
                                                          overflow:
                                                          TextOverflow.clip,
                                                          softWrap: false,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 25,
                                                            letterSpacing: 2,
                                                            fontWeight:
                                                            FontWeight.w800,
                                                          )),
                                                      Text(
                                                          GripUtils().dateOneFormat2Another(
                                                              freezingData![index]
                                                                  .freezeFromDate
                                                                  .toString(),
                                                              "yyyy-MM-dd'T'HH:mm:ss",
                                                              "yyyy"),
                                                          maxLines: 1,
                                                          overflow:
                                                          TextOverflow.clip,
                                                          softWrap: false,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 13,
                                                            letterSpacing: 2,
                                                            fontWeight:
                                                            FontWeight.w700,
                                                          )),
                                                    ]),
                                              ),
                                            ),
                                          )),
                                      Expanded(
                                          flex: 3,
                                          child:Padding(
                                            padding: EdgeInsets.all(5),
                                            child:  Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                              elevation: 5,
                                              surfaceTintColor: Colors.white,
                                              shadowColor: Colors.grey.shade200,
                                              color: GripUtils()
                                                  .parseColor("#FFFFFF"),
                                              child:  Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Column(

                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text(
                                                        "End Date",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 10,
                                                          fontWeight:
                                                          FontWeight.w300,
                                                        ),
                                                        textAlign:
                                                        TextAlign.center,
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text(
                                                          GripUtils().dateOneFormat2Another(
                                                              freezingData![index]
                                                                  .freezeToDate
                                                                  .toString(),
                                                              "yyyy-MM-dd'T'HH:mm:ss",
                                                              "MMMM"),
                                                          maxLines: 1,
                                                          overflow:
                                                          TextOverflow.clip,
                                                          softWrap: false,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 13,
                                                            fontWeight:
                                                            FontWeight.w700,
                                                          )),
                                                      Text(
                                                          GripUtils().dateOneFormat2Another(
                                                              freezingData![index]
                                                                  .freezeToDate
                                                                  .toString(),
                                                              "yyyy-MM-dd'T'HH:mm:ss",
                                                              "dd"),
                                                          maxLines: 1,
                                                          overflow:
                                                          TextOverflow.clip,
                                                          softWrap: false,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 25,
                                                            letterSpacing: 2,
                                                            fontWeight:
                                                            FontWeight.w800,
                                                          )),
                                                      Text(
                                                          GripUtils().dateOneFormat2Another(
                                                              freezingData![index]
                                                                  .freezeToDate
                                                                  .toString(),
                                                              "yyyy-MM-dd'T'HH:mm:ss",
                                                              "yyyy"),
                                                          maxLines: 1,
                                                          overflow:
                                                          TextOverflow.clip,
                                                          softWrap: false,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 13,
                                                            letterSpacing: 2,
                                                            fontWeight:
                                                            FontWeight.w700,
                                                          )),
                                                    ]),
                                              ),
                                            ),
                                          )),
                                      Expanded(
                                          flex: 3,
                                          child:Padding(
                                            padding: EdgeInsets.all(5),
                                            child:  Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                              elevation: 5,
                                              surfaceTintColor: Colors.white,
                                              shadowColor: Colors.grey.shade200,
                                              color: GripUtils()
                                                  .parseColor("#FFFFFF"),
                                              child:  Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Column(

                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text(
                                                        "No Of Days",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 10,
                                                          fontWeight:
                                                          FontWeight.w300,
                                                        ),
                                                        textAlign:
                                                        TextAlign.center,
                                                      ),
                                                      SizedBox(height: 20),

                                                      Text(

                                                          freezingData![index].freezingDayCount.toString(),
                                                          maxLines: 1,
                                                          overflow:
                                                          TextOverflow.clip,
                                                          softWrap: false,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 25,
                                                            letterSpacing: 2,
                                                            fontWeight:
                                                            FontWeight.w800,
                                                          )),
                                                      Text(
                                                          "DAYS",
                                                          maxLines: 1,
                                                          overflow:
                                                          TextOverflow.clip,
                                                          softWrap: false,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 13,
                                                            letterSpacing: 2,
                                                            fontWeight:
                                                            FontWeight.w700,
                                                          )),
                                                    ]),
                                              ),
                                            ),
                                          )),

                                    ],
                                  )
                                ]),
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
              ],
            ),
          ),
        ));
  }

  @override
  void error() {
    setState(() {
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
    presenter.callFreezingDetails(userId);
  }

  @override
  void successFreezingAction(FreezingDetails it) {
    setState(() {
      freezingData = it.freezingData;
      isLoading = false;
    });
  }

  int dateDifference(FreezingData freezingData) {

    DateTime from = DateTime.parse(freezingData.freezeFromDate.toString());
    DateTime to = DateTime.parse(freezingData.freezeToDate.toString());

    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
}

