import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/gripUtils.dart';
import 'custom_app_bar.dart';

class ChangePasswordActivity extends StatefulWidget {
  @override
  _ChangePasswordActivityState createState() => _ChangePasswordActivityState();
}

class _ChangePasswordActivityState extends State<ChangePasswordActivity> {
  bool shouldPop = true;
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
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
                  CustomAppBar(
                      height: 80,
                      child: Padding(
                          padding: EdgeInsets.only(left: 5, top: 20),
                          child: Row(children: [
                            IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            Expanded(
                                child: Text("Change Password",
                                    style: TextStyle(
                                        color: Color.fromRGBO(65, 64, 66, 1.0),
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600)))
                          ]))),
                  SizedBox(height: 50),
                 Padding(

                   padding: EdgeInsets.only(left: 15,right: 15),
                   child: Column(
                     children: <Widget>[
                       Text(
                         "Create your new password",
                         style: TextStyle(
                           color: Colors.black,
                           fontSize: 17,
                           fontWeight: FontWeight.w600
                         ),
                         textAlign: TextAlign.center,
                       ),
                       SizedBox(height: 30),

                       Container(
                           height: 50,
                           decoration: BoxDecoration(
                               borderRadius:
                               BorderRadius.all(Radius.circular(5)),
                               color: Colors.white),
                           child: Column(children: <Widget>[
                             TextFormField(
                               onTap: () {},
                               textInputAction: TextInputAction.done,
                               // Controller for Password
                               decoration: InputDecoration(
                                   border: InputBorder.none,
                                   hintText: "Current Password",
                                   contentPadding: EdgeInsets.only(
                                       left: 20, right: 20, top: 15, bottom: 10),
                                   suffixIcon: IconButton(
                                       icon: Icon(_isObscure
                                           ? Icons.visibility_off
                                           : Icons.visibility),
                                       onPressed: () {
                                         setState(() {
                                           _isObscure = !_isObscure;
                                         });
                                       }
                                   )),
                               obscureText: _isObscure,
                             )
                           ])),
                       SizedBox(height: 8),
                       Container(
                           height: 50,
                           decoration: BoxDecoration(
                               borderRadius:
                               BorderRadius.all(Radius.circular(5)),
                               color: Colors.white),
                           child: Column(children: <Widget>[
                             TextFormField(
                               onTap: () {},
                               textInputAction: TextInputAction.done,
                               // Controller for Password
                               decoration: InputDecoration(
                                   border: InputBorder.none,
                                   hintText: "New Password",
                                   contentPadding: EdgeInsets.only(
                                       left: 20, right: 20, top: 15, bottom: 10),
                                   suffixIcon: IconButton(
                                       icon: Icon(_isObscure
                                           ? Icons.visibility_off
                                           : Icons.visibility),
                                       onPressed: () {
                                         setState(() {
                                           _isObscure = !_isObscure;
                                         });
                                       }
                                   )),
                               obscureText: _isObscure,
                             )
                           ])),
                       SizedBox(height: 8),
                       Container(
                           height: 50,
                           decoration: BoxDecoration(
                               borderRadius:
                               BorderRadius.all(Radius.circular(5)),
                               color: Colors.white),
                           child: Column(children: <Widget>[
                             TextFormField(
                               onTap: () {},
                               textInputAction: TextInputAction.done,
                               // Controller for Password
                               decoration: InputDecoration(
                                   border: InputBorder.none,
                                   hintText: "Confirm Password",
                                   contentPadding: EdgeInsets.only(
                                       left: 20, right: 20, top: 15, bottom: 10),
                                   suffixIcon: IconButton(
                                       icon: Icon(_isObscure
                                           ? Icons.visibility_off
                                           : Icons.visibility),
                                       onPressed: () {
                                         setState(() {
                                           _isObscure = !_isObscure;
                                         });
                                       }
                                   )),
                               obscureText: _isObscure,
                             )
                           ])),
                       SizedBox(height: 30),
                       SizedBox(
                         width: double.infinity,
                         child: ElevatedButton(
                           onPressed: () {

                           },
                           style: ElevatedButton.styleFrom(
                               padding: EdgeInsets.symmetric(
                                   horizontal: 0.0, vertical: 0.0),
                               backgroundColor: Color.fromRGBO(213, 0, 109, 1.0),
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(10.0))),
                           child: Text(
                             "UPDATE PASSWORD",
                             style: TextStyle(color: Colors.white, fontSize: 15),
                           ),
                         ),
                       )

                     ]
                   )
                 )

                ]))));
  }

  Future<String> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('userId') ?? "");
    return token;
  }

  Future<void> callActivePackages() async {
    var userId = await getUserId();
  }
}
