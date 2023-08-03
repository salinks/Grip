import 'package:flutter/material.dart';
import 'package:grip/models/dashboard/freezing_details.dart';
import 'package:grip/models/dashboard/my_packages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../interacters/dashboard_contract.dart';
import '../presenter/dashboard_presenter.dart';
import '../utils/gripUtils.dart';
import 'book_now_page.dart';

class DashboardActivity extends StatefulWidget {
  @override
  _DashboardActivityState createState() => _DashboardActivityState();
}

class _DashboardActivityState extends State<DashboardActivity>
    implements DashboardView {
  late DashboardPresenter presenter;
  bool isLoading = false;
  List<PackageData>? packageData;

  @override
  void initState() {
    super.initState();
    presenter = DashboardPresenter(this);
    isLoading = true;
    callActivePackages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GripUtils().parseColor("#f0f0f0"),
        body: Container(
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
                : Expanded(
                    child:  Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(0, 0, 0, 0.8),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.2),
                                  BlendMode.dstATop),
                              image: AssetImage(
                                './assets/images/dash_heder.png',
                              ),
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            margin: EdgeInsets.only(top: 20),
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "SCHEDULE YOUR CLASSES / SESSIONS"
                                        .toUpperCase(),
                                    style: TextStyle(
                                      letterSpacing: 2.5,
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    width: 100,
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 130,
                                    height: 40,
                                    child: ElevatedButton(
                                      onPressed: ()  {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BookNowActivity()),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0.0, vertical: 0.0),
                                          backgroundColor:
                                              Color.fromRGBO(213, 0, 109, 1.0),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0))),
                                      child: Text(
                                        "BOOK NOW",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        packageData != null && packageData!.isNotEmpty
                            ? Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  "Active Packages".toUpperCase(),
                                  style: TextStyle(
                                    letterSpacing: 2,
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.left,
                                ))
                            : Container(),
                        packageData != null && packageData!.isNotEmpty
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
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
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left),
                                                    Text(
                                                        "${packageData![index].pACKAGENAME}",
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
                                                    SizedBox(height: 5),
                                                    Row(children: <Widget>[
                                                      Expanded(
                                                          flex: 5,
                                                          child: Text(
                                                            "Package Validity",
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
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 10),
                                                          child: Text(
                                                            "Package Expired By",
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
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 10),
                                                          child: Text(
                                                            GripUtils().dateOneFormat2Another(
                                                                packageData![
                                                                        index]
                                                                    .endDate
                                                                    .toString(),
                                                                "yyyy-MM-dd'T'HH:mm:ss",
                                                                "dd MMM yyyy"),
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
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 10),
                                                          child: Text(
                                                            "Amount Paid",
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
                                                                            .packageAmount !=
                                                                        null
                                                                    ? packageData![
                                                                            index]
                                                                        .packageAmount
                                                                        .toString()
                                                                    : "0",
                                                                true),
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
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 10),
                                                          child: Text(
                                                            GripUtils().currencyFormatter(
                                                                packageData![index]
                                                                            .paidAmount !=
                                                                        null
                                                                    ? packageData![
                                                                            index]
                                                                        .paidAmount
                                                                        .toString()
                                                                    : "0",
                                                                true),
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
                                                          ),
                                                        ),
                                                      )
                                                    ]),
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
                                "",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.left,
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )));
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


}
