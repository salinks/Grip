import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grip/interacters/login_activity_contract.dart';
import 'package:grip/presenter/loginPresenter.dart';
import 'package:grip/utils/gripUtils.dart';
import 'package:grip/views/forgot_password_page.dart';
import 'package:grip/views/home_page.dart';
import 'package:grip/webservice/api_constants.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginActivity extends StatefulWidget {
  @override
  _LoginActivityState createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity>
    implements LoginActivityView {
  late LoginActivityPresenter presenter;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ipController = TextEditingController();
  bool _isObscure = true;
  late ProgressDialog pr;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    super.initState();
    presenter = LoginActivityPresenter(this);
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    ipAddressValues();
  }

void doLogin(String email, String password)  {
    var netStatus = _connectionStatus.toString();
    if(netStatus=="ConnectivityResult.none"){
      warningToast("Your device not connected to internet");
    }
    else{
      if (email.isEmpty) {
        warningToast("Email address cannot be empty");
        return;
      }
      if (isEmail(email) == false) {
        warningToast("Enter a valid email address");
        return;
      }

      if (password.isEmpty) {
        warningToast("Password cannot be empty");
        return;
      }
      FocusScope.of(context).unfocus();
      pr.show();
    }

    presenter.doLoginGet(email,pr);
  }

  @override
  Widget build(BuildContext context) {

    pr = ProgressDialog(context,
        type: ProgressDialogType.normal, isDismissible: false, showLogs: false);
    pr.style(
        message: 'Please Wait...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(
          valueColor:
          AlwaysStoppedAnimation<Color>(Color.fromRGBO(213, 0, 109, 1.0)),
        ),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600));






    return Scaffold(
        backgroundColor: GripUtils().parseColor("#f1f3f2"),
        body: SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 60,
                  width: 200,
                ),

                // Login text Widget
                Center(
                  child: Container(
                    height: 150,
                    width: 400,
                    alignment: Alignment.center,
                    child: Image.asset(
                      "./assets/images/grip_logo.png",
                      width: 250.0,
                      height: 150.0,
                    ),
                  ),
                ),

                SizedBox(
                    height: 50,
                    width: 500,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Welcome Back",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                          Center(
                            child: Text(
                              "Login to your account",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ])),
                SizedBox(
                  height: 10,
                  width: 200,
                ),
                // Wrong Password text

                // Textfields for username and password fields
                Container(
                  height: 120,
                  width: 530,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onTap: () {},
                        controller: usernameController,
                        // Controller for Username
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Username",
                            contentPadding: EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10)),
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      TextFormField(
                        onTap: () {},

                        controller: passwordController,
                        textInputAction: TextInputAction.done,
                        // Controller for Password
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            contentPadding: EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            // Adding the visibility icon to toggle visibility of the password field
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            )),
                        obscureText: _isObscure,
                      ),
                    ],
                  ),
                ),

                // Submit Button
                Container(
                  width: 500,
                  height: 70,
                  padding: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      doLogin("", "");
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 0.0),
                        backgroundColor: Color.fromRGBO(213, 0, 109, 1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),

                // Register
                Container(
                    padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                    child: Center(
                        child: RichText(
                      text: TextSpan(
                        text: "",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(
                              text: " Forgot Password?",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.normal),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              ForgotPasswordActivity()),
                                    )),
                        ],
                      ),
                    ))),
                SizedBox(
                  height: 50,
                  width: 200,
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {
                    _showBottomSheet();
                  },
                  child: Text('SET HOST ADDRESS'),
                )
              ],
            )));
  }

  @override
  void finish() => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => HomePage()));



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
                SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      "Set Host Address",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      // textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    onTap: () {},
                    controller: ipController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "IP Address",
                        contentPadding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10)),

                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 200,
                ),
                Container(
                  width: 500,
                  height: 80,
                  padding: EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).pop();

                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString("ipAddress", ipController.text);
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 0.0),
                        backgroundColor: Color.fromRGBO(213, 0, 109, 1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    child: Text(
                      "UPDATE",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  width: 500,
                  height: 40,
                  padding: EdgeInsets.only(right: 20,left: 20),
                  child: ElevatedButton(
                    onPressed: ()  {
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
                  ),
                ),
                SizedBox(
                  height: 150,
                  width: 200,
                ),
              ],
            ))));
  }

  @override
  void dispose() {
    ipController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<String> getIpAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('ipAddress') ?? "");
    return token;
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;

    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {

      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }
  Future<void> ipAddressValues() async {
    var ipAddress = await getIpAddress();
    ApiConstants.hostAddress = ipAddress;
    setState(() {
      ipController.text = ApiConstants.hostAddress;
    });
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
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
  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }


}
