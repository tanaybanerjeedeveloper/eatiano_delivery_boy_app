import 'package:flutter/material.dart';
import '../constants.dart';

class NotificationsScreen extends StatelessWidget {
  // const NotificationsScreen({Key? key}) : super(key: key);
  static const id = 'notifications_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: const Color.fromRGBO(25, 29, 33, 1),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Notifications',
          style: kAppBarTitle,
        ),
      ),
      // body: SingleChildScrollView(child: ),
    );
  }
}
