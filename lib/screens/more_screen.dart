import 'package:flutter/material.dart';
// import '../widgets/more/cart.dart';
// import '../widgets/more/notifyBell.dart';
// import '../widgets/more/listItem.dart';
import '../widgets/list_item.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text('More',
            textScaleFactor: textScale,
            style: const TextStyle(
              color: Colors.white,
            )),
        // actions: [
        //   Cart(),
        //   NotifyBell(),
        // ],
      ),
      body: Center(
          child: ListView(children: [
        // ListItem('assets/images/Path 10146.png', 'Payment Details', ''),
        // SizedBox(height: height * 0.02),
        // ListItem(
        //     'assets/images/Group 8094.png', 'My Orders', '/my-order-screen'),
        // SizedBox(height: height * 0.02),
        // ListItem('assets/images/003-bell.png', 'Notifications',
        //     '/notification-screen'),
        // SizedBox(height: height * 0.02),
        // ListItem('assets/images/Icon material-rate-review.png', 'Inbox',
        //     '/inbox-screen'),
        // SizedBox(height: height * 0.02),
        // ListItem('assets/images/Icon awesome-user-friends.png',
        //     'Refer A Friend', '/refer-screen'),
        // SizedBox(height: height * 0.02),
        // ListItem('assets/images/Icon material-rate-review.png', 'Reviews',
        //     '/reviews-screen'),
        // SizedBox(height: height * 0.02),
        // ListItem('assets/images/restaurant-membership-card-tool copy.png',
        //     'Membership', '/membership-screen'),
        // SizedBox(height: height * 0.02),
        // ListItem('assets/images/Path 14675.png', 'About Us', '/about-us')
      ])),
    );
  }
}
