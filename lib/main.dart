import 'HomeScreen.dart';
import 'MakeScreen.dart';
import 'SettingScreen.dart';
import 'package:flutter/material.dart';
import 'MyScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'ALL STUDY';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ALL STUDY'),
      ),
      body: ifText(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            activeIcon: Icon(Icons.edit),
            label: 'play',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            activeIcon: Icon(Icons.supervised_user_circle),
            label: 'My',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.red,
          ),
        ],
        type: BottomNavigationBarType.shifting,
        enableFeedback: true,
        selectedIconTheme: const IconThemeData(size: 30, color: Colors.green),
        selectedLabelStyle: const TextStyle(color: Colors.red),
        selectedItemColor: Colors.black,
        unselectedIconTheme: const IconThemeData(size: 25, color: Colors.white),
        unselectedItemColor: Colors.red,
        unselectedLabelStyle: const TextStyle(color: Colors.purple),
      ),
    );
  }

  Widget ifText(int value) {
    if (value == 0) {
      return Scaffold(body: HomeScreen());
    } else if (value == 1) {
      return Scaffold(body: MakeScreen());
    } else if (value == 2) {
      return Scaffold(body: MyScreen());
    } else if (value == 3) {
      return Scaffold(
        body: SettingScreen(),
      );
    } else {
      return Container();
    }
  }
}
