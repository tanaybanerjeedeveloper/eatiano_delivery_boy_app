import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/networking_service.dart';
import '../widgets/order_list.dart';
import 'past_orders_screen.dart';
import '../constants.dart';
import 'package:provider/provider.dart';
import '../model/order/order_provider.dart';

class OrdersScreen extends StatefulWidget {
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  NetworkingService networkingService = NetworkingService(
      'https://achievexsolutions.in/current_work/eatiano/api/delivery/delivery_status');
  var isApproved;
  var status;
  bool isLoading = true;

  // const OrdersScreen({Key? key}) : super(key: key);
  @override
  void initState() {
    _checkIfApproved();
    super.initState();
  }

  Future<void> _checkIfApproved() async {
    print('object');
    SharedPreferences statusPreference = await SharedPreferences.getInstance();
    print('2');
    var response = await networkingService.getData();
    print('response-is-approved: $response');
    // print('response: ${response['data'][0]['status']}');

    setState(() {
      isApproved = response['data'][0]['status'];
      isLoading = false;
    });

    // isApproved = response['data'][0]['status'];
    // statusPreference.setString('statusData', isApproved);
  }

  @override
  Widget build(BuildContext context) {
    print('isApproved: $isApproved');
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final oreders = Provider.of<OrderProvider>(context).getOrders;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(25, 29, 33, 1),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Orders',
            style: kAppBarTitle,
          ),
        ),
        body: isApproved != 'Approved'
            ? Center(
                child: Text(
                  'You not approved by admin',
                  style: TextStyle(color: Colors.white),
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: height * 0.05,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Order List',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        height: height * 0.6,
                        child: OrderList(),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  PastOrdersScreen(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 40.0),
                        ),
                        child: const Text(
                          'Delivered Orders',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
