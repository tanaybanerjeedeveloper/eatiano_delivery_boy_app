import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'log_in_screen.dart';
import '../widgets/signup.dart';
import 'dart:io';
import '../constants.dart';
import 'package:open_file/open_file.dart';
import 'package:file_picker/file_picker.dart';
import '../widgets/button.dart';
import '../services/networking_service.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  static const id = 'Register';
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  final _passwordFocus = FocusNode();
  File? image;
  String? name;
  String? phone;
  String? country;
  String? aadharNo;
  String? address;
  FilePickerResult? result;
  PlatformFile? file;

  @override
  void initState() {
    super.initState();
    // var result = _getUserDetails();
    // print('result: $result');
    _getUserDetails();
  }

  Future<void> _getUserDetails() async {
    NetworkingService networkingService = NetworkingService(
        'https://achievexsolutions.in/current_work/eatiano/api/auth/me');
    var result = await networkingService.getData();
    print('result: $result');
    setState(() {
      name = result['name'];
      phone = result['phone'];
      country = result['country'];
    });
  }

  _submit(filePath) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String fileName = basename(filePath.path);
    var formData = FormData.fromMap({
      "photo": await MultipartFile.fromFile(image!.path),
      "idprof": await MultipartFile.fromFile(filePath.path, filename: fileName),
      "name": name,
      "phone": phone,
      "country": country,
      "address": address,
      "adhar": aadharNo
    });

    var response = await Dio().post(
        'https://achievexsolutions.in/current_work/eatiano/api/delivery/edit_delivery',
        data: formData,
        options: Options(headers: {
          'Authorization': 'Bearer ${localStorage.getString('token')}',
          'Accept': 'application/json'
        }));
    print('upload response: $response');
  }

  Future pickImage() async {
    print('image selected');
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (img == null) return;
      final imgTemporary = File(img.path);
      setState(() {
        this.image = imgTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> pickFiles() async {
    result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    file = result!.files.first;
    viewFile(file!);
  }

  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var statusBarPadding = MediaQuery.of(context).padding.top;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(25, 29, 33, 1),
        //backgroundColor: Colors.amber,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Executive Dashboard',
          style: kAppBarTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: ClipOval(
                        child: image != null
                            ? Image.file(
                                image!,
                                width: 130,
                                height: 130,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                'assets/images/profile.webp',
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
                        onPressed: () => pickImage(),
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
                  decoration: InputDecoration(
                    // label: Text('Name'),
                    hintText: name,
                    focusedBorder: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onChanged: (name) => name = name,
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
                  decoration: InputDecoration(
                    hintText: phone,
                    focusedBorder: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
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
                  decoration: InputDecoration(
                    hintText: country,
                    focusedBorder: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
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
                  decoration: InputDecoration(
                    label: Text('Aadhar Number'),
                    focusedBorder: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) => setState(() {
                    aadharNo = value;
                  }),
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
                  decoration: InputDecoration(
                    label: Text('Address'),
                    focusedBorder: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) => setState(() {
                    address = value;
                  }),
                ),
              ),
              SizedBox(height: height * 0.03),
              ElevatedButton(
                  onPressed: pickFiles,
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.attach_file_rounded),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Pick File'),
                    ],
                  )),
              SizedBox(height: height * 0.03),
              InkWell(
                onTap: () {
                  _submit(file);
                },
                child: Button('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
