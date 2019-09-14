import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_app/ShoppingUiItem.dart';

class ShoppingUi extends StatefulWidget {
  final String page;

  ShoppingUi(this.page);

  @override
  _ShoppingUiState createState() => _ShoppingUiState();
}

class _ShoppingUiState extends State<ShoppingUi> {
  List data;

  Future<String> _getJsonFile() async {
    var jsonFile;
    if (widget.page == "Bags") {
      jsonFile = "assets/json/bags.json";
    } else if (widget.page == "Shoes") {
      jsonFile = "assets/json/shoes.json";
    } else {
      jsonFile = "assets/json/jackets.json";
    }
    return jsonFile;
  }

  Future<String> getJsonData() async {
    var jsonFile = await _getJsonFile();
    var response = await rootBundle.loadString(jsonFile);
//    debugPrint(response.toString());
    setState(() {
      data = jsonDecode(response.toString());
    });
    return response.toString();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getJsonData(),
      builder: (context, snapShot) {
        if (snapShot.hasData == null) {
          return _noDataFound();
        }
        return Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: GridView.builder(
              itemCount: data == null ? 0 : data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height * 0.825)),
              itemBuilder: (BuildContext context, int index) {
                return ShoppingUiItem(data, index);
              }),
        );
      },
    );
  }

  Column _noDataFound() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              "No Item Found!!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ))
      ],
    );
  }
}
