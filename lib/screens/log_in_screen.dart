import 'package:flutter/material.dart';
import '../painters/logInOutBorderPaint.dart';
import '../widgets/signin.dart';
import 'register_screen.dart';

class LogIn extends StatefulWidget {
  static const id = 'LogIn';
  LogInState createState() => LogInState();
}

class LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var statusBarPadding = MediaQuery.of(context).padding.top;

    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Hand_drawn.png'),
                fit: BoxFit.cover)),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: (height - statusBarPadding) * 0.80,
              // padding: const EdgeInsets.fromLTRB(10, 60, 10, 10),
              padding: EdgeInsets.only(
                  left: width * 0.04,
                  top: (height - statusBarPadding) * 0.06,
                  right: width * 0.04,
                  bottom: (height - statusBarPadding) * 0.01),
              width: double.infinity,
              // color: Colors.red,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: SignInForm(),
              ),
            ),
            Container(
              height: (height - MediaQuery.of(context).padding.top) * 0.20,
              width: double.infinity,
              padding: EdgeInsets.only(
                  top: (height - statusBarPadding) * 0.01,
                  bottom: (height - statusBarPadding) * 0.01),
              // color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an Account?',
                        textScaleFactor:
                            MediaQuery.of(context).textScaleFactor * 1.2,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      const SizedBox(width: 2),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(Register.id);
                        },
                        child: Text(
                          'Sign Up',
                          textScaleFactor:
                              MediaQuery.of(context).textScaleFactor * 1.2,
                          style: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur',
                    textScaleFactor:
                        MediaQuery.of(context).textScaleFactor * 1.2,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
