import 'package:flutter/material.dart';
import 'package:grip/models/dashboard/freezing_details.dart';
import 'package:grip/models/dashboard/home_image_response.dart';
import 'package:grip/models/dashboard/my_packages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
  String? homeImageUrl;

  @override
  void initState() {
    super.initState();
    presenter = DashboardPresenter(this);
    isLoading = true;
    callHomeImages();
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
                : Column(
                      children: [
                        homeImageUrl != null && homeImageUrl!.isNotEmpty ?
                        Column(
                        children: [ Padding(padding: EdgeInsets.all(5),
                     child:   ClipRRect(
                       borderRadius: BorderRadius.circular(5),
                       child: SizedBox.fromSize(
                         child: Image.network(
                           homeImageUrl!,
                           fit: BoxFit.cover,
                         ),
                       ),
                     ), ),

                          SizedBox(
                            height: 20,
                          ),
                        ])

                        : Container(),

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





                      ],
                    ),
                  ));
  }

  @override
  void error(String error) {

    setState(() {
      isLoading = false;
    });
  }



  @override
  void successAction(HomeImageResponse it) {

    String? mUrl ;
    if(it != null && it.result != null && it.result?.statusCode =='200')
      {
        if(it.data != null && it.data!.isNotEmpty){
    var mList =      it.data?.where((element) => element.type == 'home').toList();
    if(mList != null && mList.isNotEmpty){
      mUrl = mList.first.url;
    }
        }
      }


    setState(() {
      homeImageUrl = mUrl;
      isLoading = false;
    });
  }

  Future<String> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('userId') ?? "");
    return token;
  }

  Future<void> callHomeImages() async {
    presenter.callHomeImages();
  }


}
