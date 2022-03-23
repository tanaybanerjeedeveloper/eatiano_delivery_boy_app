import 'package:flutter/material.dart';
//import '../painters/logInOutBorderPaint.dart';
import 'log_in_screen.dart';
import '../widgets/signup.dart';

class Register extends StatefulWidget {
  static const id = 'Register';
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
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
            SizedBox(
              height: height * 0.05,
            ),
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg',
                        width: 130,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 5,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: (height - statusBarPadding) * 0.80,
              // padding: const EdgeInsets.fromLTRB(10, 60, 10, 10),
              padding: EdgeInsets.only(
                  left: width * 0.04,
                  top: (height - statusBarPadding) * 0.03,
                  right: width * 0.04,
                  bottom: (height - statusBarPadding) * 0.01),
              width: double.infinity,
              // color: Colors.red,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: SignUpForm(),
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
                        'Already have an Account?',
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
                          Navigator.of(context).pushReplacementNamed(LogIn.id);
                        },
                        child: Text(
                          'Log In',
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
