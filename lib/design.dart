// this file will contain all needed constant decoration designs.
import 'package:flutter/material.dart';
import 'package:full_circle/Screens/signup-page.dart';
import 'Screens/donationForm.dart';
import 'Screens/home-page.dart';
import 'Screens/login-page.dart';
import 'Screens/welcome-page.dart';

//buttons text styles
//textStyle: buttonTextStyle,
const buttonTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
    );

final List<String> categories = [    "Category 1",    "Category 2",    "Category 3",  ];
final List<Widget> screens = [  HomeScreen(), DonationForm(),    WelcomeScreen(),    RegisterScreen(),    LoginScreen(),  ];

BottomNavigationBar NavBar(v,s)  {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: v,
    iconSize: 30,
    selectedFontSize: 2,
    selectedItemColor: Color(0xFF3D8361),
    onTap: s,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: '', // provide a default label text
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.fastfood_outlined),
        label: '', // provide a default label text
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.star_border_outlined),
        label: '', // provide a default label text
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.delivery_dining_outlined),
        label: '', // provide a default label text
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_outlined),
        label: '', // provide a default label text
      ),
    ],
  );
}

const textStyle =TextStyle(
  fontFamily: 'Roboto',
  fontSize: 20.0,
  fontWeight: FontWeight.w400,
  height: 1.0,
  color: Color(0xFF676666),);


var buttonStyle = ButtonStyle(
  backgroundColor:
  MaterialStateProperty.all<Color>(Color(0xFF3D8361)),
  minimumSize: MaterialStateProperty.all<Size>(Size(372, 53)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
      side: BorderSide(color: Color(0xFF3D8361)),
    ),
  ),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
    EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
  ),
  textStyle: MaterialStateProperty.all<TextStyle>(
    buttonTextStyle,
  ),
);

//white Elevated button Style
var elevatedButtonStyle = ElevatedButton.styleFrom(
  primary: Colors.white, // Set background color to white
  onPrimary: Colors.black, // Set text color to black
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4), // Set border radius to 4px
  ),
  padding: EdgeInsets.fromLTRB(16, 8, 16, 8), // Set padding to 16px left and right, 8px top and bottom
  minimumSize: Size(372, 53), // Set button size to 372px width and 53px height
);

// add a container with this decoration then add the pic as a child.
//decoration: dropShadowDecoration,
const dropShadowDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Color(0x40000000),
      blurRadius: 30,
      spreadRadius: 0,
      offset: Offset(0, 14),
    ),
  ],
);
var formBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(4),
  boxShadow: [
    BoxShadow(
      color: Color(0xFF8F95B2),
      blurRadius: 1,
      offset: Offset(0, 0),
      spreadRadius: 1,
    ),
  ],
);
const mainLogoName = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 28,
  fontWeight: FontWeight.w600,
  height: 1.5,
  color: Color(0xFF3D8361), // Color code for #3D8361
);

const lineDecoration = BoxDecoration(
  border: Border(
    bottom: BorderSide(
      color: Color(0x8E6AAB7C),
      width: 1.0,
    ),
  ),
);

//textField
// to use it write this code into your text-field
//decoration: textFieldDecoration.copyWith(hintText: ' your won hint'),
const textFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(
    color: Color(0xffD7D8DB),),

  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFC7C9CE), width: 1.0 ),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF3D8361), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),),
);

var boxDecoration =  BoxDecoration(
  color: Colors.grey[200],
  border: Border.all(
    color: Colors.grey,
  ),
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
