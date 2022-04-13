import 'dart:io';

import 'package:etiano_delivery_app/model/location/location.dart';
import 'package:etiano_delivery_app/user_preferences.dart';
import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/notifications_screen.dart';
import './screens/order_delivered_details_screen.dart';
import './widgets/bottom_navigation.dart';
import './screens/log_in_screen.dart';
import './screens/register_screen.dart';
import 'package:provider/provider.dart';
import './model/network_utils/authentication.dart';
import './model/order/order_provider.dart';
import './utils/user_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserSharedPreferences.init();

  await UserPreferences.init();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  var isAuth = false;

  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    print(token);
    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = MyHttpOverrides();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Network()),
        ChangeNotifierProvider(create: (context) => OrderProvider()),
        ChangeNotifierProvider(create: (context) => LocationProvider())
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Eatiano Delivery app',
          theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromRGBO(25, 29, 33, 1),
            primaryColor: const Color.fromRGBO(252, 17, 17, 1),
            // accentColor: const Color.fromRGBO(191, 241, 104, 1),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: const Color.fromRGBO(191, 241, 104, 1),
            ),
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
          ),
          home: isAuth ? BottomNavigation() : LogIn(),
          //initialRoute: isAuth ? BottomNavigation.id : LogIn.id,
          routes: {
            NotificationsScreen.id: (context) => NotificationsScreen(),
            // OrderDeliveredDetailsScreen.id: (context) =>
            //     OrderDeliveredDetailsScreen(),
            BottomNavigation.id: (context) => BottomNavigation(),
            LogIn.id: (context) => LogIn(),
            Register.id: (context) => Register(),
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
