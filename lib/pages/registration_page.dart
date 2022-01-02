import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:registion_pad/models/profile.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _profile =
      Profile(firstName: "-", lastName: "-", email: "-", imageRef: "-");
  final ImagePicker _imagePicker = ImagePicker();
  File? _selectedImageFile;

  getImage() async {

    final selectedFile =
        await _imagePicker.getImage(source: ImageSource.camera);

    _selectedImageFile = File(selectedFile!.path);

    setState(() {
      _selectedImageFile = File(selectedFile.path);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ลงทะเบียน'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ชื่อ'),
                TextFormField(
                  validator: RequiredValidator(errorText: 'กรุณากรอกข้อมูล'),
                  onSaved: (firstName) {
                    _profile.firstName = firstName!;
                  },
                ),
                SizedBox(
                  height: 18,
                ),
                Text('นามสกุล'),
                TextFormField(
                  validator: RequiredValidator(errorText: 'กรุณากรอกข้อมูล'),
                  onSaved: (lastName) {
                    _profile.lastName = lastName!;
                  },
                ),
                SizedBox(
                  height: 18,
                ),
                Text('อีเมลล์'),
                TextFormField(
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'กรุณากรอก Email'),
                    EmailValidator(
                        errorText: 'กรุณากรอกข้อมูล email ที่ถูกต้อง'),
                  ]),
                  onSaved: (email) {
                    _profile.email = email!;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 18,
                ),
                Text('รูปถ่าย'),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Ink(
                    color: Colors.grey[300],
                    child: InkWell(
                        onTap: () {
                          print("OPEN CAMERA");
                          getImage();
                        },
                        child: _selectedImageFile != null
                            ? Image.file(_selectedImageFile!)
                            : Container(
                                height: 150,
                                child: Center(
                                  child: Icon(Icons.camera_alt),
                                ),
                              )),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print('ลงทะเบียน');
                      _formKey.currentState?.save();
                      print(
                          '${_profile.firstName}  ${_profile.lastName}  ${_profile.email}');
                    },
                    child: Text('ลงทะเบียน'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
