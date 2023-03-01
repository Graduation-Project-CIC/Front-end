import 'package:flutter/material.dart';
import 'package:full_circle/design.dart';
void main() {
  runApp(const MyApp());
}
String _selectedOption = 'Option 1';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Container(child: Center(),
      ),
    ),);
  }
}
