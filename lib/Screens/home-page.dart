// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import '../design.dart';

import '../design.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'Home_Screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) => screens[index]),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
        home: Scaffold(
        body: SafeArea(
        child: SingleChildScrollView(
        ),),
            bottomNavigationBar: NavBar(
              _selectedIndex,
              _onItemTapped),
        ),);
=======
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
          ),),
        bottomNavigationBar: NavBar(
            _selectedIndex,
            _onItemTapped),
      ),);
>>>>>>> recipientSignUp
  }
}