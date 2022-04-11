import 'dart:convert';

import 'package:etiano_delivery_app/user_preferences.dart';
import 'package:etiano_delivery_app/widgets/textfield_widget.dart';
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
import '../model/user.dart';
import '../widgets/profile_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class ProfileScreenNeo extends StatefulWidget {
  ProfileScreenNeo({Key? key}) : super(key: key);
  static const id = 'ProfileScreenNeo';
  @override
  State<ProfileScreenNeo> createState() => _ProfileScreenNeoState();
}

class _ProfileScreenNeoState extends State<ProfileScreenNeo> {
  File? image;
  String? name;
  String? phone;
  String? country;
  String? aadharNo;
  String? address;
  FilePickerResult? result;
  PlatformFile? file;
  late User user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = UserPreferences.getUser();
  }

  Future<dynamic> _submit(filePath) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String fileName = basename(filePath.path);
    print('fileName: $fileName');
    var formData = FormData.fromMap({
      "photo": await MultipartFile.fromFile(image!.path),
      "idprof": await MultipartFile.fromFile(filePath.path, filename: fileName),
      "name": name,
      "phone": phone,
      "country": country,
      "address": address,
      "adhar": aadharNo
    });
    print('formData: $formData');

    var response = await Dio().post(
        'https://achievexsolutions.in/current_work/eatiano/api/delivery/edit_delivery',
        data: formData,
        options: Options(headers: {
          'Authorization': 'Bearer ${localStorage.getString('token')}',
          'Accept': 'application/json'
        }));
    UserPreferences.setUser(user);
    print('upload response: $response');
    return response;
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
              ProfileWidget(
                imagePath: user.imagePath,
                isEdit: true,
                onClicked: () async {
                  print('image selected');
                  try {
                    final img = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (img == null) return;
                    final imgTemporary = File(img.path);
                    setState(() {
                      this.image = imgTemporary;
                      user = user.copy(imagePath: imgTemporary.path);
                    });
                  } on PlatformException catch (e) {
                    print('Failed to pick image: $e');
                  }
                },
              ),
              SizedBox(height: height * 0.03),
              TextFieldWidget(
                  label: 'Full Name',
                  text: user.name,
                  onChanged: (name) {
                    user = user.copy(name: name);
                    setState(() {
                      name = name;
                    });
                  }),
              SizedBox(height: height * 0.03),
              TextFieldWidget(
                  label: 'Phone Number',
                  text: user.phoneNumber,
                  onChanged: (phoneNumber) {
                    user = user.copy(phoneNumber: phoneNumber);
                    setState(() {
                      phone = phoneNumber;
                    });
                  }),
              SizedBox(height: height * 0.03),
              TextFieldWidget(
                  label: 'Country',
                  text: user.country,
                  onChanged: (country) {
                    user = user.copy(country: country);
                    setState(() {
                      country = country;
                    });
                  }),
              SizedBox(height: height * 0.03),
              TextFieldWidget(
                  label: 'Aadhar Number',
                  text: user.aadharNumber,
                  onChanged: (aadharNumber) {
                    user = user.copy(aadharNumber: aadharNumber);
                    setState(() {
                      aadharNo = aadharNumber;
                    });
                  }),
              SizedBox(height: height * 0.03),
              TextFieldWidget(
                  label: 'Address',
                  text: user.address,
                  onChanged: (address) {
                    user = user.copy(address: address);
                    setState(() {
                      address = address;
                    });
                  }),
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
                onTap: () async {
                  var response = await _submit(file);
                  print('from onTap: $response');
                  print('response.data: ${response.data}');
                  print(response.data['status']);
                  if (response.data['status'] == 'success') {
                    final text = 'Profile updated successfully';
                    var snackBar = SnackBar(
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(bottom: 50.0),
                      content: Text(
                        text,
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.green,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Button('Submit'),
              ),
              SizedBox(height: height * 0.2),
            ],
          ),
        ),
      ),
    );
  }
}
