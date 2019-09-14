import 'package:flutter/material.dart';
import 'package:shopping_app/CircleIndicator.dart';
import 'package:shopping_app/NavigationBar.dart';
import 'package:shopping_app/ShoppingUi.dart';

void main() => runApp(ShoppingApp());

class ShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoppingAppUi(),
    );
  }
}

class ShoppingAppUi extends StatefulWidget {
  @override
  _ShoppingAppUiState createState() => _ShoppingAppUiState();
}

class _ShoppingAppUiState extends State<ShoppingAppUi> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: _buildAppTitle(),
          actions: <Widget>[
            _buildAppBarIcon(Icons.shopping_cart, Colors.black),
            _buildAppBarIcon(Icons.search, Colors.black)
          ],
          elevation: 0.0,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: Size(50, 50),
            child: Container(
              padding: const EdgeInsets.only(left: 16.0),
              alignment: Alignment.centerLeft,
              child: _createTabBar(),
            ),
          ),
        ),
        body: TabBarView(children: <Widget>[
          ShoppingUi("Bags"),
          ShoppingUi("Shoes"),
          ShoppingUi("Jackets"),
        ]),
        bottomNavigationBar: NavigationBar(),
      ),
    );
  }

  Padding _buildAppBarIcon(IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }

  Row _buildAppTitle() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 16.0, 4.0, 8.0),
          child: Text(
            "Popular",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20.0, 8.0, 8.0),
          child: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  TabBar _createTabBar() {
    return TabBar(
        unselectedLabelColor: Colors.grey,
        labelColor: Color(0xff553EBC),
        isScrollable: true,
        labelPadding: EdgeInsets.only(bottom: 8.0, right: 16.0, left: 8.0),
        indicator: CircleIndicator(color: Color(0xff553EBC), radius: 4.0),
        tabs: [
          _createTab("Bags"),
          _createTab("Shoes"),
          _createTab("Jackets"),
        ]);
  }

  Tab _createTab(String tabName) {
    return Tab(
      child: Text(
        tabName,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
