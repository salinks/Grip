import 'package:flutter/material.dart';
import 'package:grip/interacters/profile_contract.dart';
import 'package:grip/models/dashboard/my_profile_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../presenter/my_profile_presenter.dart';
import '../utils/gripUtils.dart';
import 'change_password_page.dart';
import 'forgot_password_page.dart';
import 'freezing_details_page.dart';
import 'login_page.dart';

class ProfileActivity extends StatefulWidget {
  @override
  _ProfileActivityState createState() => _ProfileActivityState();
}

class _ProfileActivityState extends State<ProfileActivity>
    implements MyProfileView {
  late MyProfilePresenter presenter;
  bool isLoading = false;
  late ProfileData profileData;

  @override
  void initState() {
    super.initState();
    profileData =ProfileData();
    presenter = MyProfilePresenter(this);
    isLoading = true;
    callApis();
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
                :  Container(
                      color: GripUtils().parseColor("#f0f0f0"),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: 120,
                                    width: 120,
                                    child: profileData!.memberPhoto == null ||
                                            profileData!.memberPhoto
                                                    .toString() ==
                                                ""
                                        ? Image.asset(
                                            './assets/images/user_avatar.png',
                                          )
                                        : CircleAvatar(
                                            maxRadius: 65,
                                            backgroundImage: NetworkImage(
                                                profileData!.memberPhoto
                                                    .toString()))),
                              ]),
                          const SizedBox(height: 15),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    "${(profileData.firstName != null && profileData.firstName.toString().isNotEmpty) ? profileData.firstName.toString() :""}  ${(profileData.surname != null && profileData.surname.toString().isNotEmpty) ? profileData.surname.toString() :""}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 26))
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    profileData.email != null
                                        ? profileData.email!.toString()
                                        : "",
                                    style: TextStyle(
                                       color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15))
                              ]),
                          const SizedBox(height: 15),
                          const SizedBox(height: 15),
                          Container(
                            child: Expanded(
                                child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChangePasswordActivity()),
                                    )
                                  },
                                  child: Card(
                                    margin: const EdgeInsets.only(
                                        left: 35, right: 35, bottom: 10),
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const ListTile(
                                      leading: Icon(
                                        Icons.password_outlined,
                                        color: Color.fromRGBO(213, 0, 109, 1.0),
                                      ),
                                      title: Text(
                                        'Change Password',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                GestureDetector(
                                    onTap: () => {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FreezingDetailsActivity()),
                                          )
                                        },
                                    child: Card(
                                      margin: const EdgeInsets.only(
                                          left: 35, right: 35, bottom: 10),
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: const ListTile(
                                        leading: Icon(
                                          Icons.pause_circle_outline,
                                          color:
                                              Color.fromRGBO(213, 0, 109, 1.0),
                                        ),
                                        title: Text(
                                          'Freezing Details',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )),
                                const SizedBox(
                                  height: 7,
                                ),
                                GestureDetector(
                                    onTap: () => {_showBottomSheet()},
                                    child: Card(
                                      color: Colors.white,
                                      margin: const EdgeInsets.only(
                                          left: 35, right: 35, bottom: 10),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: const ListTile(
                                        leading: Icon(
                                          Icons.logout,
                                          color:
                                              Color.fromRGBO(213, 0, 109, 1.0),
                                        ),
                                        title: Text(
                                          'Logout',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )),
                              ],
                            )),
                          )
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

  @override
  void successAction(MyProfileResponse it) {
    if (it.result!.statusCode == "200") {
      setState(() {
        if (it.data != null && it.data!.isNotEmpty) {
          profileData = it.data!.first;
          isLoading = false;
        }
      });
    }
  }

  Future<void> callApis() async {
    var userId = await getUserId();
    presenter.callMyProfile(userId);
  }

  Future<String> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('userId') ?? "");
    return token;
  }

  @override
  void warningToast(String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        backgroundColor: Colors.orange,
        message: message.toString(),
      ),
    );
  }

  Future<void> _showBottomSheet() async {
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
                      "Alert",
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
                    "Are you sure want to logout ?",
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
                              SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                              await prefs.setString("userId", "");
                             gotoLogin();
                            },
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0.0, vertical: 0.0),
                                backgroundColor: Color.fromRGBO(213, 0, 109, 1.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                            child: Text(
                              "LOGOUT",
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

  void gotoLogin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) =>
          LoginActivity()),
    );
  }
}


