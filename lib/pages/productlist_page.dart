import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:registion_pad/models/Product.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];

    String size = "2";
    Future<void> testGetList() async {}

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: null,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      print('hit button');
                      testGetList();
                      var headers = {
                        'Authorization': 'Bearer ImUKf1qomlWWPcaoNccBXNBHNY0',
                        'Cookie': 'JSESSIONID=8F0A27AED12373C3C0AB6261AE779094'
                      };
                      var request = http.Request(
                          'GET',
                          Uri.parse(
                              'http://192.168.1.116:8080/rest/entities/triple1_Product?limit=10&offset=1&sort=createdDate'));

                      request.headers.addAll(headers);

                      http.StreamedResponse response = await request.send();

                      if (response.statusCode == 200) {
                        var res = await response.stream.bytesToString();
                        print(res);
                        final product = productFromJson(res);
                        print(product.length);
                        size = product.toString();

                        setState(() {
                          size = product.toString();
                        });
                      } else {
                        print(response.reasonPhrase);
                      }
                    },
                    child: Text('load'),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(size)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
