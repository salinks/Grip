import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grip/views/my_profile.dart';

import '../utils/gripUtils.dart';
import 'active_packages_page.dart';
import 'custom_app_bar.dart';
import 'dashboard_page.dart';
import 'my_bookings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  String pageName = "Dashboard";

  final pages = [
    DashboardActivity(),
    ActivePackagesActivity(),
    MyBookingsActivity(),
    ProfileActivity(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        height: 80,
        child: Padding(
          padding: EdgeInsets.only(left: 15, top: 20),
          child: Row(children: [
            Expanded(
              child: Text(
                pageName,
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
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      color: GripUtils().parseColor("#f1f3f2"),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Color.fromRGBO(213, 0, 109, 1.0),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                  pageName = "Dashboard";
                });
              },
              icon: pageIndex == 0
                  ? Icon(
                      Icons.dashboard_outlined,
                      color: GripUtils().parseColor("#6bdad4"),
                      size: 35,
                    )
                  : const Icon(
                      Icons.dashboard_outlined,
                      color: Colors.white,
                      size: 25,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                  pageName = "Active Packages";
                });
              },
              icon: pageIndex == 1
                  ? Icon(
                      Icons.card_membership_outlined,
                      color: GripUtils().parseColor("#6bdad4"),
                      size: 35,
                    )
                  : const Icon(
                      Icons.card_membership_outlined,
                      color: Colors.white,
                      size: 25,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                  pageName = "My Bookings";
                });
              },
              icon: pageIndex == 2
                  ? Icon(
                      Icons.checklist_outlined,
                      color: GripUtils().parseColor("#6bdad4"),
                      size: 35,
                    )
                  : const Icon(
                      Icons.checklist_outlined,
                      color: Colors.white,
                      size: 25,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                  pageName = "My Account";
                });
              },
              icon: pageIndex == 3
                  ? Icon(
                      Icons.person_outline,
                      color: GripUtils().parseColor("#6bdad4"),
                      size: 35,
                    )
                  : const Icon(
                      Icons.person_outline,
                      color: Colors.white,
                      size: 25,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
