import 'dart:convert';

import 'package:etiano_delivery_app/map_utils.dart';
import 'package:etiano_delivery_app/screens/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../widgets/more/cart.dart';
// import '../widgets/more/notifyBell.dart';
// import '../widgets/more/listItem.dart';
import '../model/network_utils/authentication.dart';
import '../widgets/list_item.dart';
import '../constants.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(25, 29, 33, 1),
        elevation: 0,
        title: const Center(
          child: Text(
            'More',
            style: kAppBarTitle,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () {
                  MapUtils.openMap(22.571039, 88.420274);
                },
                child: const Text(
                  'Restaurant location',
                  style: TextStyle(color: Colors.black),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () {
                  MapUtils.openMap(22.623382, 88.443866);
                },
                child: const Text(
                  'Customer location',
                  style: TextStyle(color: Colors.black),
                )),
            ElevatedButton(
                onPressed: () async {
                  var res = await Provider.of<Network>(context, listen: false)
                      .getData('api/auth/logout');
                  var body = json.decode(res.body);
                  // if (body['success']) {
                  SharedPreferences localStorage =
                      await SharedPreferences.getInstance();
                  // localStorage.remove('user');
                  localStorage
                      .setString('token', '')
                      .then((_) => Navigator.of(context).pushNamed(LogIn.id));
                  localStorage.clear();
                  print('Token Value ${localStorage.getString('token')}');
                },
                child: Text('Log Out')),
          ],
        ),
      ),
    );
  }
}
