import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'screens/promotion_screen.dart';
import 'screens/finding_route_screen.dart';
import 'screens/basic_information_screen.dart';
import 'screens/more_screen.dart';

void main() {
  runApp(BangkokMRTApp());
}

class BangkokMRTApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bangkok MRT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    MainScreen(),
    PromotionScreen(),
    FindingRouteScreen(),
    BasicInformationScreen(),
    MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Main'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer), label: 'Promotion'),
          BottomNavigationBarItem(
              icon: Icon(Icons.map), label: 'Finding Route'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Information'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[700], // Color for the selected icon
        unselectedItemColor: Colors.grey, // Color for the unselected icons
        onTap: _onItemTapped,
      ),
    );
  }
}
