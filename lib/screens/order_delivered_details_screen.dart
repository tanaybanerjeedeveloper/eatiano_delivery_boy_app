import 'package:flutter/material.dart';
import '../widgets/order_item.dart';
import '../constants.dart';

class OrderDeliveredDetailsScreen extends StatelessWidget {
  // const OrderDeliveredDetailsScreen({Key? key}) : super(key: key);
  static const id = 'order_delivered_details';

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
          'Order deliver details',
          style: kAppBarTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              ListTile(
                // isThreeLine: true,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    // margin: EdgeInsets.only(bottom: mediaQuery.size.height * 0.01),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 2.0,
                      ),
                    ),
                    child: Image.asset('assets/images/food.jpeg'),
                  ),
                ),
                title: Text(
                  'King Burgers Restro',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  children: [
                    SizedBox(
                      height: width * 0.02,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(
                          '4.9',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        const SizedBox(
                          width: 3.0,
                        ),
                        Text(
                          '(124 ratings)',
                          style: kSubTextStyle,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
              ),
              Text('data'),
              Text('data'),
              Text('data'),
            ],
          ),
        ),
      ),
    );
  }
}
