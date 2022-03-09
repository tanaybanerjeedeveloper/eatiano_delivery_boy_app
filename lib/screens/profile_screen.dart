import 'package:flutter/material.dart';
import '../widgets/list_item.dart';
import '../constants.dart';

class ProfileScreen extends StatelessWidget {
  // const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(25, 29, 33, 1),
        elevation: 0,
        title: const Center(
          child: Text(
            'Executive Dashboard',
            style: kAppBarTitle,
          ),
        ),
      ),
      body: ListView(
        children: [
          // CircleAvatar(
          //   radius: 50,
          //   child: Image.asset(
          //     'assets/images/boy.jpeg',
          //   ),
          // ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 150.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset('assets/images/boy.jpeg'),
            ),
          ),
          SizedBox(height: height * 0.01),
          // InkWell(
          //   // onTap: () {
          //   //   setState(() {
          //   //     clicked = !clicked;
          //   //   });
          //   // },
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       const Icon(Icons.edit, color: Colors.red),
          //       SizedBox(width: width * 0.01),
          //       Text(
          //         'Edit Profile',
          //         textScaleFactor: textScale,
          //         style: const TextStyle(
          //           color: Colors.red,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          SizedBox(height: height * 0.002),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.0),
              child: Text(
                'Hi there Viv!',
                textScaleFactor: textScale,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: height * 0.003),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.04),
              child: InkWell(
                // onTap: () async {
                //   // var res = await Provider.of<Network>.getData('/logout');
                //   var res = await Provider.of<Network>(context, listen: false)
                //       .getData('api/auth/logout');
                //   var body = json.decode(res.body);
                //   // if (body['success']) {
                //   SharedPreferences localStorage =
                //       await SharedPreferences.getInstance();
                //   // localStorage.remove('user');
                //   localStorage.remove('token');
                //   // Navigator.push(context,
                //   //     MaterialPageRoute(builder: (context) => SignIn()));
                //   Navigator.of(context).pushReplacementNamed('/sign-in');
                // },
                child: Text(
                  'Sign Out',
                  textScaleFactor: textScale,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.09),
          // !clicked ? Details() : EditProfile()
          ListItem(imageUrl: 'assets/images/bag.jpeg', caption: 'My Orders'),
          SizedBox(height: height * 0.02),
          ListItem(
            imageUrl: 'assets/images/bell.jpeg',
            caption: 'Notifications',
          ),
        ],
      ),
    );
  }
}