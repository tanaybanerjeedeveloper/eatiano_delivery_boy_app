import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../../screens/more_screen.dart';

import '../screens/call_screen.dart';
import '../screens/home_screen.dart';
import '../screens/orders_screen.dart';
import '../screens/profile_screen.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  final bool pointer = false;
  int index = 2;
  final screens = [
    OrdersScreen(),
    CallScreen(),
    MyHomePage(),
    ProfileScreen(),
    MoreScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final items = [
      Icon(Icons.window_outlined,
          color: index == 0 ? Colors.white : Colors.grey,
          size: index == 0 ? width * 0.098 : width * 0.09),
      Image.asset('assets/images/Icon ionic-ios-call (2).png',
          width: index == 1 ? width * 0.15 : width * 0.1,
          height: index == 1 ? height * 0.04 : height * 0.2,
          color: index == 1 ? Colors.white : Colors.grey),
      Icon(Icons.home,
          color: index == 2 ? Colors.white : Colors.grey,
          size: index == 2 ? width * 0.098 : width * 0.09),
      Image.asset(
        'assets/images/Profile.png',
        width: index == 3 ? width * 0.15 : width * 0.1,
        height: index == 3 ? height * 0.04 : height * 0.2,
        color: index == 3 ? Colors.white : Colors.grey,
      ),
      Image.asset(
        'assets/images/More.png',
        width: index == 4 ? width * 0.15 : width * 0.1,
        height: index == 4 ? height * 0.04 : height * 0.2,
        color: index == 4 ? Colors.white : Colors.grey,
      )
    ];

    // TODO: implement build
    return Scaffold(
      body: screens[index],
      extendBody: true,
      bottomNavigationBar: Container(
        // padding: EdgeInsets.only(top: ),
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black,
              spreadRadius: 20,
              blurRadius: 30,
              offset: Offset(1, 2))
        ]),
        child: CurvedNavigationBar(
          items: items,
          index: index,
          height: 60,
          color: const Color.fromRGBO(103, 103, 103, 1),
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: const Color.fromRGBO(189, 186, 186, 1),
          onTap: (index) => setState(() {
            this.index = index;
            // HomeScreen(index);
            // Navigator.of(context)
            //     .pushNamed('/home-screen', arguments: this.index);
          }),
        ),
      ),
    );
  }
}
