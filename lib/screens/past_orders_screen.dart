import 'package:flutter/material.dart';
import '../widgets/past_order_list.dart';
import '../constants.dart';

class PastOrdersScreen extends StatelessWidget {
  // const PastOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
        //backgroundColor: Colors.amber,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Delivered Orders',
          style: kAppBarTitle,
        ),
      ),
      body: Container(
        //padding: const EdgeInsets.all(10.0),
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        height: height * 0.89,
        width: double.infinity,
        child: PastOrderList(),
      ),
    );
  }
}
