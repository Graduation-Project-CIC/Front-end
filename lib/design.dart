// this file will contain all needed constant decoration designs.
import 'package:flutter/material.dart';

//buttons text styles
//decoration: buttonTextStyle,
const buttonTextStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12.0,
);


//textField
// to use it write this code into your textfield
//decoration:
//  textFieldDecoration.copyWith(hintText: ' your won hint'),
const textFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(
    color: Color(0xffD7D8DB),),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFC7C9CE), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF3D8361), width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),),
);


//checkBox design
//https://api.flutter.dev/flutter/material/Checkbox-class.html

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.green;
  }
  return Colors.green;
}
