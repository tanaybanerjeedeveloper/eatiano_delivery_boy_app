import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/notifications_screen.dart';
import './screens/order_delivered_details_screen.dart';
import './widgets/bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
      initialRoute: BottomNavigation.id,
      routes: {
        NotificationsScreen.id: (context) => NotificationsScreen(),
        OrderDeliveredDetailsScreen.id: (context) =>
            OrderDeliveredDetailsScreen(),
        BottomNavigation.id: (context) => BottomNavigation(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
