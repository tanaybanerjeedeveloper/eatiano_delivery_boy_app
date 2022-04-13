import 'package:flutter/material.dart';
// import '../widgets/order_item.dart';
import '../widgets/order_item_list.dart';
import '../constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:etiano_delivery_app/map_utils.dart';

class OrderDeliveredDetailsScreen extends StatefulWidget {
  // const OrderDeliveredDetailsScreen({Key? key}) : super(key: key);
  String orderId;
  String restaurantName;
  String restaurantImg;
  static const id = 'order_delivered_details';

  OrderDeliveredDetailsScreen(
      {required this.orderId,
      required this.restaurantImg,
      required this.restaurantName});

  @override
  State<OrderDeliveredDetailsScreen> createState() =>
      _OrderDeliveredDetailsScreenState();
}

class _OrderDeliveredDetailsScreenState
    extends State<OrderDeliveredDetailsScreen> {
  var _isLoading = true;
  var orderItemList = [];
  double _sum = 0.0;
  late double _totalPrice;
  late String orderId = widget.orderId;

  @override
  void initState() {
    super.initState();
    _getOrderItemList();
  }

  Future _getOrderItemList() async {
    orderItemList = await _getOrderDetails(widget.orderId);
    _totalPrice = _getTotalPrice(orderItemList);
    print(_totalPrice);
  }

  double _getTotalPrice(List orderItemList) {
    for (var i = 0; i < orderItemList.length; i++) {
      _sum = _sum +
          double.parse(orderItemList[i]['product_price']!) *
              double.parse(orderItemList[i]['quantity']);
    }
    return _sum;
  }

  Future<dynamic> _getOrderDetails(String orderId) async {
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
      setState(() {
        _isLoading = false;
      });
      // print('data-one: ${jsonDecode(data)}');
      var decodedData = jsonDecode(data);
      // print('decodedData: $decodedData');
      // print('decodedData-type: ${decodedData.runtimeType}');
      // print(decodedData['status']);
      print(decodedData['data']);
      print(decodedData['data'].runtimeType);
      return decodedData['data'];

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
      body: (_isLoading == true)
          ? const Center(
              child: CircularProgressIndicator(color: Colors.red),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 14.0),
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
                          width: 50,
                          height: 50,
                          // margin: EdgeInsets.only(bottom: mediaQuery.size.height * 0.01),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.secondary,
                              width: 2.5,
                            ),
                          ),
                          child: Image.network(
                            'https://achievexsolutions.in/current_work/eatiano${widget.restaurantImg}',
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ),
                      title: Text(
                        widget.restaurantName,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
                      child: OrderItemList(orderItemList),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    buildDivider(context, height),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    buildListTile(
                        ctx: context,
                        address: orderItemList[0]['restaurant_address'],
                        addressType: 'Restaurant Address',
                        onPressed: () {
                          MapUtils.openMap(
                              double.parse(orderItemList[0]['lat']),
                              double.parse(orderItemList[0]['lng']));
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    buildListTile(
                        ctx: context,
                        address:
                            '${orderItemList[0]['area']} ${orderItemList[0]['city']} ${orderItemList[0]['state']} ${orderItemList[0]['pincode']}',
                        addressType: 'Delivery Address',
                        onPressed: () {
                          MapUtils.openMap(22.623382, 88.443866);
                        }),
                    SizedBox(
                      height: height * 0.04,
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
                                  text: _totalPrice.toStringAsFixed(1),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 19.0,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Text(
                          //   '(paid)',
                          //   style: kSubTextStyle,
                          // )
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

  Widget buildListTile({ctx, address, addressType, onPressed}) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            addressType,
            style: const TextStyle(
              color: Colors.white38,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: 300,
            child: Text(
              address,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.location_on,
          color: Theme.of(ctx).colorScheme.secondary,
        ),
      ),
    );
  }
}
