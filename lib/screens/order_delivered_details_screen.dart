import 'package:flutter/material.dart';
// import '../widgets/order_item.dart';
import '../widgets/order_item_list.dart';
import '../constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OrderDeliveredDetailsScreen extends StatefulWidget {
  // const OrderDeliveredDetailsScreen({Key? key}) : super(key: key);
  String orderId;
  static const id = 'order_delivered_details';

  OrderDeliveredDetailsScreen(this.orderId);

  @override
  State<OrderDeliveredDetailsScreen> createState() =>
      _OrderDeliveredDetailsScreenState();
}

class _OrderDeliveredDetailsScreenState
    extends State<OrderDeliveredDetailsScreen> {
  var _isLoading = true;
  late String orderId = widget.orderId;

  @override
  void initState() {
    super.initState();
    _getOrderDetails(widget.orderId);
  }

  Future<void> _getOrderDetails(String orderId) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var response = await http.get(
        Uri.parse(
            'https://achievexsolutions.in/current_work/eatiano/api/delivery/delivery/$orderId'),
        headers: {
          'Authorization': 'Bearer ${localStorage.getString('token')}',
          'Accept': 'application/json'
        });
    if (response.statusCode == 200) {
      var data = response.body;
      print('data-one: ${jsonDecode(data)}');
      // return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

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
                  color: Colors.white,
                ),
                child: OrderItemList(),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              buildDivider(context, height),
              SizedBox(
                height: height * 0.01,
              ),
              buildListTile(
                context,
                '125/1 Ripon street',
                'Restaurant Address',
                '700041',
              ),
              buildListTile(
                context,
                '489, Banerjee para road',
                'Delivery Address',
                '700041',
              ),
              SizedBox(
                height: height * 0.02,
              ),
              buildDivider(context, height),
              SizedBox(
                height: height * 0.001,
              ),
              ListTile(
                leading: const Text(
                  'Total',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: '₹ ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.white),
                          ),
                          TextSpan(
                            text: '1139',
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 19.0,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '(paid)',
                      style: kSubTextStyle,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDivider(ctx, height) {
    return Divider(
      color: Theme.of(ctx).colorScheme.secondary,
      thickness: 1.0,
      height: height * 0.005,
    );
  }

  Widget buildListTile(ctx, address, addressType, pincode) {
    return ListTile(
      leading: Text(
        addressType,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      trailing: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              width: 130.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    pincode,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
