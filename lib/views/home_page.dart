

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/gripUtils.dart';
import 'custom_app_bar.dart';
import 'dashboard_page.dart';

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
    const Page2(),
    const Page3(),
    const Page4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      appBar: CustomAppBar(
        height: 80,
        child: Padding(
          padding: EdgeInsets.only(left: 15,top: 20),
          child: Row(
              children: [
                Expanded(
                  child:  Text(
                    pageName,
                    style: TextStyle(
                      color: Color.fromRGBO(65, 64, 66, 1.0),
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 15,top: 8),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset('./assets/images/grip_logo.png',
                        width: 100,
                      )),
                ),
              ]
          ),
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
                  ?  Icon(
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
                  pageName = "Bookings";
                });
              },
              icon: pageIndex == 1
                  ?  Icon(
                Icons.checklist_outlined ,
                color: GripUtils().parseColor("#6bdad4"),
                size: 35,
              )
                  : const Icon(
                Icons.checklist_outlined ,
                color: Colors.white,

                size: 25,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                  pageName = "Membership";
                });
              },
              icon: pageIndex == 2
                  ?  Icon(
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
                  pageIndex = 3;
                  pageName = "My Account";
                });
              },
              icon: pageIndex == 3
                  ?  Icon(
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





class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(240, 240, 240, 1.0),
      child: Center(
        child: Text(
          "Page Number 1",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 2",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 3",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 4",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}