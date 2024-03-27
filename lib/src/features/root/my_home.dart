import 'package:flutter/material.dart';
import 'package:flutter_dev/src/common/widgets/bottom_nav_bar.dart';
import 'package:flutter_dev/src/features/home/screens/home_screen.dart';
import 'package:flutter_dev/src/features/map/screens/map_screen.dart';
import 'package:flutter_dev/src/constants/colors.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[HomePage(), MapPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 100.0, left: 20.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            backgroundColor: TsecondaryColor,
          ),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
