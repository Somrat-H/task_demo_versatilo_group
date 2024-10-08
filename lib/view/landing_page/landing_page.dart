import 'package:flutter/material.dart';
import 'package:task_demo_versatilo_group/view/home_page/home_page.dart';
import 'package:task_demo_versatilo_group/view/notification_page/notification_page.dart';
import 'package:task_demo_versatilo_group/view/profile_page/profile_page.dart';
import 'package:task_demo_versatilo_group/view/search_page/search_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int pagesIndex = 0;

  List<Widget> pages = [
    HomePage(),
    SearchPage(),
    NotificationPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff222221),
        title: Text(
          "Task Demo Versatilo Group",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: pages[pagesIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: Color(0xff222221)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    pagesIndex = 0;
                  });
                },
                icon: Icon(Icons.home)),
            IconButton(
                onPressed: () {
                  setState(() {
                    pagesIndex = 1;
                  });
                },
                icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  setState(() {
                    pagesIndex = 2;
                  });
                },
                icon: Icon(Icons.notifications)),
            IconButton(
                onPressed: () {
                  setState(() {
                    pagesIndex = 3;
                  });
                },
                icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}
