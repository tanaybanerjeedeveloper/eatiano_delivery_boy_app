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
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Past Orders',
          style: kAppBarTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: height * 0.9,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Past Order',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              PastOrderList(),
              SizedBox(
                height: height * 0.001,
              ),
              // TextButton(
              //   onPressed: () {},
              //   style: TextButton.styleFrom(
              //     backgroundColor: Theme.of(context).colorScheme.secondary,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(15.0),
              //     ),
              //     padding: const EdgeInsets.symmetric(
              //         vertical: 10, horizontal: 50.0),
              //   ),
              //   child: const Text(
              //     'Past Orders',
              //     style: TextStyle(
              //         fontSize: 25.0,
              //         fontWeight: FontWeight.w600,
              //         color: Colors.black),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
