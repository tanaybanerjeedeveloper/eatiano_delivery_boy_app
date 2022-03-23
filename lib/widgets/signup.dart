// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import './button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../model/network_utils/authentication.dart';

class SignUpForm extends StatefulWidget {
  @override
  SignUpFormState createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  final _passwordFocus = FocusNode();
  final _key = GlobalKey<FormState>();
  late var name;
  late var password;
  late var email;
  late var phoneNumber;

  @override
  void dispose() {
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    var responsive =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: height * 0.0001),
      // decoration: BoxDecoration(
      //     border: Border.all(color: const Color.fromRGBO(198, 241, 74, 1))),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Good Food Waiting For You',
              textScaleFactor: textScale,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.12, top: height * 0.04, right: width * 0.12),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  Container(
                    height: height * 0.06,
                    padding: EdgeInsets.only(left: width * 0.045),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 20,
                              spreadRadius: 10,
                              offset: Offset(2, 1))
                        ]),
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text('Name'),
                        focusedBorder: InputBorder.none,
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(_passwordFocus),
                      validator: (nameInput) {
                        if (nameInput!.isEmpty) {
                          return 'Please Enter Name';
                        } else {
                          name = nameInput;
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Container(
                    height: height * 0.06,
                    padding: EdgeInsets.only(left: width * 0.045),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 20,
                              spreadRadius: 10,
                              offset: Offset(2, 1))
                        ]),
                    child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          label: Text('Password'),
                          focusedBorder: InputBorder.none,
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (passwordInput) {
                          if (passwordInput!.isEmpty) {
                            return 'Please Enter Name';
                          } else {
                            password = passwordInput;
                            return null;
                          }
                        }),
                  ),
                  SizedBox(height: height * 0.03),
                  Container(
                    height: height * 0.06,
                    padding: EdgeInsets.only(left: width * 0.045),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 20,
                              spreadRadius: 10,
                              offset: Offset(2, 1))
                        ]),
                    child: TextFormField(
                        // obscureText: true,
                        decoration: InputDecoration(
                          label: Text('Email'),
                          focusedBorder: InputBorder.none,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: (emailInput) {
                          if (emailInput!.isEmpty) {
                            return 'Please Enter Name';
                          } else {
                            email = emailInput;
                            return null;
                          }
                        }),
                  ),
                  SizedBox(height: height * 0.03),
                  Container(
                    height: height * 0.06,
                    padding: EdgeInsets.only(left: width * 0.045),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 20,
                              spreadRadius: 10,
                              offset: Offset(2, 1))
                        ]),
                    child: TextFormField(
                        // obscureText: true,
                        decoration: InputDecoration(
                          label: Text('Phone Number'),
                          focusedBorder: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        validator: (numberInput) {
                          if (numberInput!.isEmpty) {
                            return 'Please Enter Name';
                          } else {
                            phoneNumber = numberInput;
                            return null;
                          }
                        }),
                  ),
                  SizedBox(height: height * 0.03),
                  // Container(
                  //   height: height * 0.06,
                  //   padding: EdgeInsets.only(left: width * 0.045),
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(30),
                  //       boxShadow: const [
                  //         BoxShadow(
                  //             color: Colors.black,
                  //             blurRadius: 20,
                  //             spreadRadius: 10,
                  //             offset: Offset(2, 1))
                  //       ]),
                  //   child: TextFormField(
                  //     // obscureText: true,
                  //     decoration: InputDecoration(
                  //       label: Text('Address'),
                  //       focusedBorder: InputBorder.none,
                  //     ),
                  //     keyboardType: TextInputType.streetAddress,
                  //     textInputAction: TextInputAction.next,
                  //   ),
                  // ),
                  SizedBox(height: height * 0.03),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 20,
                                spreadRadius: 10,
                                offset: Offset(2, 1))
                          ]),
                      child: InkWell(
                          // onTap: () => Navigator.of(context)
                          //     .pushReplacementNamed('/bottom-bar'),
                          onTap: () {
                            if (_key.currentState!.validate()) {
                              _signUp();
                            }
                          },
                          child: Button('Sign Up')))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _signUp() async {
    var data = {
      'email': email,
      'name': name,
      'password': password,
      'phone': phoneNumber,
    };

    var res = await Provider.of<Network>(context, listen: false)
        .authData(data, 'api/auth/signup');
    var body = json.decode(res.body);
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('token', body['access_token']);
    Navigator.of(context).pushNamed('/bottom-bar');
  }
}
