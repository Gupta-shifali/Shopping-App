import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xff573EBD),
      unselectedItemColor: Color(0xff573EBD),
      currentIndex: _currentIndex,
      onTap: _selectTab,
      selectedItemColor: Color(0xff8F75CE),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: Text("Home",
                style: TextStyle(
                  color: Colors.black,
                ))),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_outline,
              color: Colors.black,
            ),
            title: Text("Chat",
                style: TextStyle(
                  color: Colors.black,
                ))),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
            title: Text("Wish List",
                style: TextStyle(
                  color: Colors.black,
                ))),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: Colors.black,
            ),
            title: Text(
              "Profile",
              style: TextStyle(
                color: Colors.black,
              ),
            ))
//        _navigationBarItem(Icons.chat_bubble_outline, "Chat"),
//        _navigationBarItem(Icons.favorite_border, "Wish List"),
//        _navigationBarItem(Icons.person_outline, "Profile"),
      ],
    );
  }

  void _navigationBarItem(IconData icon, String label) {
    new BottomNavigationBarItem(
        backgroundColor: Color(0xff8F75CE),
        icon: Icon(icon),
        title: Text(label));
  }

  void _selectTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
