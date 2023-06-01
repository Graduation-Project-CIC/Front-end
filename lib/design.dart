// this file will contain all needed constant decoration designs.
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:full_circle/Screens/driver_welcome_page.dart';
import 'package:full_circle/Screens/instructionsScreen.dart';
import 'package:full_circle/Screens/profile/profile.dart';
import 'Screens/donation_form.dart';
import 'Screens/home_page.dart';
import 'Screens/recipient-signUp.dart';

//buttons text styles
//textStyle: buttonTextStyle,
const buttonTextStyle = TextStyle(
  fontFamily: 'Roboto',
  color: Colors.white,
  fontSize: 20.0,
  fontWeight: FontWeight.normal);

final List<String> preferencesCheckBox = ['Canned & Jarred Food',    'Pasta & Rice',    'Cooking Essentials',    'Fruits & Vegetables',    'Cheese & Dairy',    'Meat',    'Chicken & Poultry',    'Bakery',  ];
final List<String> foodCategories = ["GREENS",    "COOKED",    "GRAINS", "DAIRY", "FROZEN",  "GROCERIES"];
final List<Widget> navBarScreens = [  const HomeScreen(), DonationForm(),    const RecipientSignUp(),    const DriverWelcomePage(),    const Profile()];
final List<String> organizationType = [ "ORPHANAGE",    "HOMELESS_SHELTER 2",    "COMMUNITY_KITCHEN 3", "FAMILY_IN_NEED" ,"ANIMAL_SHELTER"];
final List<Widget> drawerScreens = [DonationForm(), const RecipientSignUp(),  const MyScreen() ];
List<String> chipLabels = ['Less than 5', 'Less than 10', 'less than 50', 'less than 100', 'more than 100'];
List<String> chipValue = ['5', '10', '50', '100'];
List<String> preferencesChipLabels = ['Ready meals', 'Groceries', 'Both'];
List<String> drawerMenuItems = ['Donating' , 'Add Organization','Instructions' ];
List<String> cairoAreas = [
  'Abbasiya',
  'Ain Shams',
  'Al Rehab',
  'Bab El Louk',
  'Dokki',
  'Downtown Cairo',
  'Garden City',
  'Gesr El Suez',
  'Heliopolis',
  'Maadi',
  'Mohandessin',
  'Nasr City',
  'New Cairo',
  'Obour',
  'October City',
  'Rod El Farag',
  'Shoubra',
  'Shorouk City',
  'Tagamo',
  'Zamalek'
];

var homeMainButton = BoxDecoration(
   borderRadius:  BorderRadius.circular(4),
   gradient: const LinearGradient(
     begin: Alignment.centerLeft,
     end: Alignment.centerRight,
     colors: [
       Color.fromRGBO(61, 131, 97, 0.54),
       Color.fromRGBO(58, 126, 93, 0.9),
     ],
     stops: [0.2178, 0.5477],
   ),
   boxShadow: [
     BoxShadow(
       color: Colors.black.withOpacity(0.25),
       offset: const Offset(0, 4),
       blurRadius: 4,
     ),
   ],
 );

BottomNavigationBar NavBar(v,s)  {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: v,
    iconSize: 30,
    selectedFontSize: 2,
    selectedItemColor: const Color(0xFF3D8361),
    onTap: s,
    items: const [
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

var selectFileButton = ButtonStyle(
  backgroundColor:
  MaterialStateProperty.all<Color>(Colors.white),
  minimumSize: MaterialStateProperty.all<Size>(const Size(21, 48)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
      side: const BorderSide(color: Colors.grey),
    ),
  ),
);

var buttonStyle = ButtonStyle(
  backgroundColor:
  MaterialStateProperty.all<Color>(const Color(0xFF3D8361)),
  minimumSize: MaterialStateProperty.all<Size>(const Size(372, 53)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2.0),
      side: const BorderSide(color: Color(0xFF3D8361)),
    ),
  ),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
    const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
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
  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8), // Set padding to 16px left and right, 8px top and bottom
  minimumSize: const Size(372, 53), // Set button size to 372px width and 53px height
);

// add a container with this decoration then add the pic as a child.
//decoration: dropShadowDecoration,
var dropShadowDecoration = BoxDecoration(
  shape: BoxShape.circle,
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.9),
      spreadRadius: 2,
      blurRadius: 5,
      offset:
      const Offset(0, 2), // changes position of shadow
    ),
  ],
);

var formBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(4),
  boxShadow: const [
    BoxShadow(
      color: Color(0xFFB9BBD3),
      blurRadius: 0.5,
      offset: Offset(0, 0),
      spreadRadius: 0.5,
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
      color: Color(0x8EB2B0B0),
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