import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:registion_pad/models/AuthFromAPI.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _username = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('username'),
                TextFormField(
                  onSaved: (username) {
                    _username = username!;
                  },
                ),
                SizedBox(
                  height: 18,
                ),
                Text('password'),
                TextFormField(
                  obscureText: true,
                  onSaved: (password) {
                    _password = password!;
                  },
                ),
                SizedBox(
                  height: 18,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      print('ลงทะเบียน');
                      print('username : $_username');
                      print('password : $_password');
                      _formKey.currentState?.save();

                      var headers = {
                        'Content-Type': 'application/x-www-form-urlencoded',
                        'Authorization': 'Basic Y2xpZW50OnNlY3JldA=='
                      };
                      var request = http.Request('POST',
                          Uri.parse('http://192.168.1.116:8080/oauth/token'));
                      // request.bodyFields = {
                      //   'grant_type': 'password',
                      //   'username': 'admin',
                      //   'password': 'admin'
                      // };
                      request.bodyFields = {
                        'grant_type': 'password',
                        'username': _username,
                        'password': _password
                      };
                      request.headers.addAll(headers);

                      http.StreamedResponse response = await request.send();

                      if (response.statusCode == 200) {
                        // print(await response.stream.bytesToString());
                        var jsonString = await response.stream.bytesToString();
                        final authFromApi = authFromApiFromJson(jsonString);
                        print(authFromApi.toJson());
                        print(authFromApi.accessToken);
                      } else {
                        print(response.reasonPhrase);
                      }
                    },
                    child: Text('login'),
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
