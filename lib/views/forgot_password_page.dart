import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grip/interacters/forgot_password_contract.dart';
import 'package:grip/presenter/forgotPasswordPresenter.dart';
import 'package:grip/utils/gripUtils.dart';
import 'package:grip/views/home_page.dart';
import 'package:grip/views/login_page.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ForgotPasswordActivity extends StatefulWidget {
  @override
  _ForgotPasswordActivityState createState() => _ForgotPasswordActivityState();
}

class _ForgotPasswordActivityState extends State<ForgotPasswordActivity>
    implements ForgotPasswordView {
  late ForgotPasswordPresenter presenter;
  TextEditingController usernameController = TextEditingController();
  bool _isObscure = true;
  late ProgressDialog pr;
  bool shouldPop = true;

  @override
  void initState() {
    super.initState();
    presenter = ForgotPasswordPresenter(this);
  }

  void doResetPassword(String email) {
    if (email.isEmpty) {
      warningToast("Email address cannot be empty");
      return;
    }
    if (isEmail(email) == false) {
      warningToast("Enter a valid email address");
      return;
    }
    FocusScope.of(context).unfocus();
    pr.show();
    presenter.doResetPassword(email, pr);
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
    return WillPopScope(
        onWillPop: () async {
          return shouldPop;
        },
        child: Scaffold(
            backgroundColor: GripUtils().parseColor("#f1f3f2"),
            body: SingleChildScrollView(
                reverse: true,
                padding:
                    EdgeInsets.only(bottom: 20, top: 20, right: 20, left: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 10, width: double.infinity),
                    SizedBox(
                      height: 120,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ),

                    // Login text Widget
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              height: 120,
                              width: 400,
                              alignment: Alignment.center,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        "Forgot Password?",

                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        // textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                      width: 200,
                                    ),
                                    Center(
                                      child: Text(
                                        "Don't worry! It occurs, Please enter the email address linked with your account",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),

                          Container(
                            height: 50,
                            width: 530,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.white),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  onTap: () {},
                                  controller: usernameController,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email Address",
                                      contentPadding: EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 10,
                                          bottom: 10)),
                                  onEditingComplete: () =>
                                      FocusScope.of(context).nextFocus(),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            width: 500,
                            height: 70,
                            padding: EdgeInsets.only(top: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                doResetPassword(usernameController.text.trim());
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
                                "SEND LOGIN KEY",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),

                          // Register
                          Container(
                              padding:
                                  EdgeInsets.only(top: 40, left: 20, right: 20),
                              child: Center(
                                  child: RichText(
                                text: TextSpan(
                                  text: "Back to",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: " Login",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                213, 0, 109, 1.0),
                                            fontWeight: FontWeight.normal),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => Navigator.of(context)
                                                  .pushReplacement(
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        LoginActivity()),
                                              )),
                                  ],
                                ),
                              )))
                        ],
                      ),
                    )
                  ],
                ))));
  }

  @override
  void finish() => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => HomePage()));

  @override
  void errorToast(String? message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: message.toString(),
      ),
    );
  }

  @override
  void successToast(String? message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: message.toString(),
      ),
    );
  }

  @override
  void warningToast(String? message) {
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

  @override
  void successAction() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => LoginActivity()),
    );
  }
}
