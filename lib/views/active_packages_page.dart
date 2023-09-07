import 'package:flutter/material.dart';
import 'package:grip/models/dashboard/cancel_booking_response.dart';
import 'package:grip/models/dashboard/my_bookings.dart';
import 'package:grip/presenter/my_packages_presenter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../interacters/active_packages.dart';
import '../models/dashboard/my_packages.dart';
import '../presenter/my_bookings_presenter.dart';
import '../utils/gripUtils.dart';

class ActivePackagesActivity extends StatefulWidget {
  @override
  _ActivePackagesActivityState createState() => _ActivePackagesActivityState();
}

class _ActivePackagesActivityState extends State<ActivePackagesActivity>
    implements MyPackagesView {
  late MyPackagesPresenter presenter;
  bool isLoading = false;
  late BuildContext alertContext;
  List<PackageData>? packageData;

  @override
  void initState() {
    super.initState();
    presenter = MyPackagesPresenter(this);
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
              : packageData != null && packageData!.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: packageData!.length,
                      itemBuilder: (context, index) => SizedBox(
                        width: double.infinity,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          elevation: 5,
                          surfaceTintColor: Colors.white,
                          shadowColor: Colors.grey.shade200,
                          color: GripUtils().parseColor("#FFFFFF"),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                      margin: EdgeInsets.all(10),
                                      child: Image.asset(
                                        './assets/images/grip_logo.png',
                                        width: 100,
                                      ))),
                              Expanded(
                                  flex: 8,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10),
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
                                              "${packageData![index].pACKAGENAME}",
                                              maxLines: 1,
                                              overflow: TextOverflow.clip,
                                              softWrap: false,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700,
                                              )),
                                          SizedBox(height: 5),
                                          Row(children: <Widget>[
                                            Expanded(
                                                flex: 5,
                                                child: Text(
                                                  "Package Validity",
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
                                                  "Package Expired By",
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
                                                  "${packageData![index].validityInDays.toString()} Days",
                                                  maxLines: 1,
                                                  overflow: TextOverflow.clip,
                                                  softWrap: false,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                )),
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(right: 10),
                                                child: Text(
                                                  GripUtils()
                                                      .dateOneFormat2Another(
                                                          packageData![index]
                                                              .extendedEndDate
                                                              .toString(),
                                                          "yyyy-MM-dd'T'HH:mm:ss",
                                                          "dd MMM yyyy"),
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
                                          SizedBox(height: 5),
                                          Row(children: <Widget>[
                                            Expanded(
                                                flex: 5,
                                                child: Text(
                                                  "Package Amount",
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
                                                  "Amount Paid",
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
                                                  GripUtils().currencyFormatter(
                                                      packageData![index]
                                                                  .netAmount !=
                                                              null
                                                          ? packageData![index]
                                                              .netAmount
                                                              .toString()
                                                          : "0",
                                                      true),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.clip,
                                                  softWrap: false,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                )),
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(right: 10),
                                                child: Text(
                                                  GripUtils().currencyFormatter(
                                                      packageData![index]
                                                                  .paidAmount !=
                                                              null
                                                          ? packageData![index]
                                                              .paidAmount
                                                              .toString()
                                                          : "0",
                                                      true),
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
                                          packageData![index].isClass == false
                                              ? Column(
                                            children: <Widget>[
                                              SizedBox(height: 5),
                                              Row(children: <Widget>[
                                                Expanded(
                                                    flex: 5,
                                                    child: Text(
                                                      "Total Sessions",
                                                      style: TextStyle(
                                                        color:
                                                        Colors.black,
                                                        fontSize: 10,
                                                        fontWeight:
                                                        FontWeight
                                                            .w300,
                                                      ),
                                                      textAlign:
                                                      TextAlign.left,
                                                    )),
                                                Expanded(
                                                    flex: 5,
                                                    child: Text(
                                                      "Booked Sessions",
                                                      style: TextStyle(
                                                        color:
                                                        Colors.black,
                                                        fontSize: 10,
                                                        fontWeight:
                                                        FontWeight
                                                            .w300,
                                                      ),
                                                      textAlign:
                                                      TextAlign.center,
                                                    )),
                                                Expanded(
                                                    flex: 5,
                                                    child: Text(
                                                      "Available Sessions",
                                                      style: TextStyle(

                                                        color:
                                                        Colors.black,
                                                        fontSize: 10,
                                                        fontWeight:
                                                        FontWeight
                                                            .w300,
                                                      ),
                                                      textAlign:
                                                      TextAlign.right,
                                                    )),
                                                SizedBox(
                                                  width: 10,
                                                )

                                              ]),
                                              Row(children: <Widget>[
                                                Expanded(
                                                    flex: 5,
                                                    child: Text(

                                                          packageData![index]
                                                              .noOfSession !=
                                                              null
                                                              ? packageData![
                                                          index]
                                                              .noOfSession
                                                              .toString()
                                                              : "0",

                                                      maxLines: 1,
                                                      overflow:
                                                      TextOverflow
                                                          .clip,
                                                      softWrap: false,
                                                      style: TextStyle(
                                                        color:
                                                        Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                        FontWeight
                                                            .w700,
                                                      ),
                                                    )),
                                                Expanded(
                                                    flex: 5,
                                                    child: Text(

                                                          packageData![index]
                                                              .totalBookingCount !=
                                                              null
                                                              ? packageData![
                                                          index]
                                                              .totalBookingCount
                                                              .toString()
                                                              : "0",

                                                      maxLines: 1,
                                                      overflow:
                                                      TextOverflow
                                                          .clip,
                                                      softWrap: false,
                                                      style: TextStyle(
                                                        color:
                                                        Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                        FontWeight
                                                            .w700,
                                                      ),
                                                      textAlign:
                                                      TextAlign.center,
                                                    )),
                                                Expanded(
                                                    flex: 5,
                                                    child: Text(

                                                      ( packageData![index]
                                                              .noOfSession !=
                                                              null && packageData![index]
                                                              .totalBookingCount !=
                                                              null)
                                                              ? (int.parse(packageData![index].noOfSession.toString()) -
                                                          int.parse(packageData![index].totalBookingCount.toString())).toString()

                                                              : "0",

                                                      maxLines: 1,
                                                      overflow:
                                                      TextOverflow
                                                          .clip,
                                                      softWrap: false,
                                                      style: TextStyle(
                                                        color:
                                                        Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                        FontWeight
                                                            .w700,
                                                      ),
                                                      textAlign:
                                                      TextAlign.right,
                                                    )),
                                                SizedBox(
                                                  width: 10,
                                                )
                                              ]),
                                            ],
                                          )
                                              : Container(),
                                          SizedBox(height: 10),
                                        ]),
                                  ))
                            ],
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
  void successAction(MyPackageResponse it) {
    setState(() {
      packageData = it.data;
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
    presenter.callMyPackages(userId);
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
