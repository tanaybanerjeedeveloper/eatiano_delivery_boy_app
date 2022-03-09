import 'package:flutter/material.dart';
import '../widgets/order_list.dart';
import '../widgets/past_order_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: mediaQuery.size.height * 1,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Hand drawn.png'),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 2,
              horizontal: 10.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: mediaQuery.size.height * 0.05,
                ),
                const Text(
                  'Welcome,Kevin',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: mediaQuery.size.height * 0.02,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0, horizontal: 100.0),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Text(
                      'Active',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaQuery.size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order List',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Row(
                      children: const [
                        Text(
                          'View all',
                          style: TextStyle(color: Colors.amber),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.amber,
                          size: 11.0,
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 2.0,
                ),
                OrderList(),
                SizedBox(
                  height: mediaQuery.size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Past Order',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Row(
                      children: const [
                        Text(
                          'View all',
                          style: TextStyle(color: Colors.amber),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.amber,
                          size: 11.0,
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 2.0,
                ),
                PastOrderList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
