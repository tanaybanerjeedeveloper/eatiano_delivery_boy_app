import 'package:flutter/material.dart';
import '../constants.dart';

class NotificationsScreen extends StatelessWidget {
  // const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(25, 29, 33, 1),
        elevation: 0,
        title: const Center(
          child: Text(
            'Notification',
            style: kAppBarTitle,
          ),
        ),
      ),
    );
  }
}
