import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ลงทะเบียน'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ชื่อ'),
              TextFormField(),
              SizedBox(
                height: 18,
              ),
              Text('นามสกุล'),
              TextFormField(),
              SizedBox(
                height: 18,
              ),
              Text('อีเมลล์'),
              TextFormField(),
              SizedBox(
                height: 18,
              ),
              Text('รูปถ่าย'),
              SizedBox(
                height: 18,
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('ลงทะเบียน'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
