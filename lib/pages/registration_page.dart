import 'package:flutter/material.dart';
import 'package:registion_pad/models/profile.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  Profile? _profile = new Profile(firstName: "firstName", lastName: "lastName", email: "email", imageRef: "imageRef");

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
                  onSaved: (firstName) {
                    _profile?.firstName = firstName!;
                  },
                ),
                SizedBox(
                  height: 18,
                ),
                Text('นามสกุล'),
                TextFormField(
                  onSaved: (lastName) {
                    _profile?.lastName = lastName!;
                  },
                ),
                SizedBox(
                  height: 18,
                ),
                Text('อีเมลล์'),
                TextFormField(
                  onSaved: (email) {
                    _profile?.email = email!;
                  },
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
                      },
                      child: Container(
                        height: 150,
                        child: Center(
                          child: Icon(Icons.camera_alt),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      print('ลงทะเบียน');
                      _formKey.currentState!.save();
                      print('${_profile?.firstName}  ${_profile?.lastName}  ${_profile?.email}');
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
