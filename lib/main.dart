import 'package:etiano_delivery_app/model/location/location.dart';
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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Network()),
        ChangeNotifierProvider(create: (context) => OrderProvider()),
        ChangeNotifierProvider(create: (context) => LocationProvider())
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
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
          // home: BottomNavigation(),
          initialRoute: LogIn.id,
          routes: {
            NotificationsScreen.id: (context) => NotificationsScreen(),
            OrderDeliveredDetailsScreen.id: (context) =>
                OrderDeliveredDetailsScreen(),
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
