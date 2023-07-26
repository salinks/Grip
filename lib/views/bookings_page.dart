



import 'package:flutter/material.dart';

import '../utils/gripUtils.dart';

class BookingsActivity extends StatefulWidget {
  @override
  _BookingsActivityState createState() => _BookingsActivityState();
}

class _BookingsActivityState extends State<BookingsActivity>
{
//  late ForgotPasswordPresenter presenter;  implements ForgotPasswordView

  bool shouldPop = true;

  @override
  void initState() {
    super.initState();
    //  presenter = ForgotPasswordPresenter(this);
  }



  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        onWillPop: () async {
          return shouldPop;
        },
        child: Scaffold(
            backgroundColor: GripUtils().parseColor("#f1f3f2"),
            body: Container()));
  }


}



