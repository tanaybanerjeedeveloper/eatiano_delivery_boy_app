import 'package:flutter/material.dart';
import '../widgets/order_list.dart';
import '../widgets/past_order_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _status = false;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Container(
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: mediaQuery.size.height * 0.05,
            ),
            const Center(
              child: Text(
                'Welcome,Kevin!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.02,
            ),
            buildSwitch(context),
            SizedBox(
              height: mediaQuery.size.height * 0.03,
            ),
            _status == true
                ? Center(
                    child: Text(
                      'Active',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : const Center(
                    child: Text(
                      'Inactive',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget buildSwitch(ctx) {
    return Transform.scale(
      scale: 2,
      child: Switch.adaptive(
        activeColor: Theme.of(context).colorScheme.secondary,
        activeTrackColor: Color(0xffd8f3dc),
        inactiveThumbColor: Colors.red,
        inactiveTrackColor: Color(0xfffbb1bd),
        value: _status,
        onChanged: (value) => setState(() => _status = !_status),
      ),
    );
  }
}
