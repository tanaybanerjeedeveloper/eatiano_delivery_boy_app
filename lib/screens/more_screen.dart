import 'package:flutter/material.dart';
// import '../widgets/more/cart.dart';
// import '../widgets/more/notifyBell.dart';
// import '../widgets/more/listItem.dart';
import '../widgets/list_item.dart';
import '../constants.dart';

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
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: height * 0.05,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 155.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset('assets/images/boy.jpeg'),
          ),
        ),
        SizedBox(height: height * 0.01),

        // SizedBox(height: height * 0.2),
        Center(
          child: Padding(
            padding: EdgeInsets.only(left: width * 0.0),
            child: Text(
              'Alex Carter',
              textScaleFactor: textScale,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0),
            ),
          ),
        ),
        SizedBox(height: height * 0.003),
        Center(
          child: Padding(
            padding: EdgeInsets.only(left: width * 0.0),
            child: Text(
              'alex@gmail.com',
              style: kSubTextStyle,
            ),
          ),
        ),
        SizedBox(height: height * 0.008),
        Center(
          child: Padding(
            padding: EdgeInsets.only(left: width * 0.0),
            child: InkWell(
              child: Text(
                'Edit',
                textScaleFactor: textScale,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ),
        ),

        SizedBox(height: height * 0.09),
        // !clicked ? Details() : EditProfile()
      ]),
    );
  }
}
