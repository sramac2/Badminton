import 'package:badminton/CourtListingPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomePage> {
  static List<Widget> _widgetOptions = <Widget>[
    CourtListingPage(),
    Text(
      'Index 2: School',
     // style: optionStyle,
    ),
    Text(
      'Index 3: School',
     // style: optionStyle,
    ),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(accentColor: Colors.cyan, fontFamily: 'Roboto'),
        home: Scaffold(
          
      // appBar: AppBar(
      //   title: Text('Badminton'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.cyan,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.white,
        iconSize: 30.0,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.sports_handball,
              ),
              label: 'Courts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Events'),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money), label: 'Records'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_circle), label: 'Profile')
        ],
        onTap: _onItemTapped,
        
      ),
    ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
