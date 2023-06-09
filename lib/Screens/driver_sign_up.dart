// ignore_for_file: library_private_types_in_public_api


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:full_circle/design.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

class DriverSignUp extends StatefulWidget {
  const DriverSignUp({Key? key}) : super(key: key);
  static const String id = 'Driver_signup';

  @override
  _DriverSignUpState createState() => _DriverSignUpState();
}

class _DriverSignUpState extends State<DriverSignUp> {
  String? _carType;
  String? _carMake;
  String? _manufactureYear;
   File? _registrationCertificateFile;
   File? _licensePlateFile;
   File? _vehiclePhotoFile;
   File? _inspectionReportFile;
   File? _driverLicenseFile;

// Method to select a file using the image_picker package
  Future<void> _selectFile(String type) async {
    final picker = ImagePicker();
    final result = await picker.pickImage(source: ImageSource.gallery);
    if (result != null) {
      setState(() {
        switch (type) {
          case 'registrationCertificate':
            _registrationCertificateFile = File(result.path);
            break;
          case 'licensePlate':
            _licensePlateFile = File(result.path);
            break;
          case 'vehiclePhoto':
            _vehiclePhotoFile = File(result.path);
            break;
          case 'inspectionReport':
            _inspectionReportFile = File(result.path);
            break;
          case 'driverLicense':
            _driverLicenseFile = File(result.path);
            break;
        }
      });
    }
  }
  Future<void> _signUp() async {
    // Save the user as a driver
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDriver', true);

    // Navigate to the home screen
    Navigator.pushReplacementNamed(context, HomeScreen.id);
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(
                  left: screenWidth* 0.05,
                  right: screenWidth * 0.05,
                ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //TOP ICON
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, HomeScreen.id);
                        },
                      )
                    ],
                  ),
                  Text(
                    'Sign Up',
                    style: mainLogoName.copyWith(color: Colors.black),
                  ),
                  SizedBox(height: screenHeight *0.01),
                  Text('Car information',
                      style: textStyle.copyWith(color: const Color(0xFF838181))),
                  SizedBox(height: screenHeight *0.05),
                  TextField(
                      decoration: textFieldDecoration.copyWith(
                          hintText: 'Car Type : Peugeot'),
                      onChanged: (value) => _carType = value),
                  SizedBox(height: screenHeight *0.04),
                  TextField(
                      decoration: textFieldDecoration.copyWith(
                          hintText: 'Car Make: France'),
                      onChanged: (value) => _carMake = value
                  ),
                  SizedBox(height: screenHeight *0.04),
                  TextField(
                      decoration: textFieldDecoration.copyWith(
                          hintText: 'Manufacture year : 2008'),
                      onChanged: (value) => _manufactureYear= value
                  ),
                  SizedBox(height: screenHeight *0.04),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: textFieldDecoration.copyWith(
                              hintText: _registrationCertificateFile == null ? 'Registration Certificate' : _registrationCertificateFile!.path.split('/').last),
                        readOnly: true,
                        ),
                        ),
                      ElevatedButton(
                        onPressed: () => _selectFile('registrationCertificate'),
                        style: selectFileButton,
                        child: Text('Select File',
                        style: textStyle.copyWith(color: Colors.grey)),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight *0.04),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: textFieldDecoration.copyWith(
                          hintText: _licensePlateFile == null ? 'License plate' : _licensePlateFile!.path.split('/').last),
                          readOnly: true,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _selectFile('licensePlate'),
                        style: selectFileButton,
                        child: Text('Select File',
                            style: textStyle.copyWith(color: Colors.grey)),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight *0.04),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: textFieldDecoration.copyWith(
                              hintText: _vehiclePhotoFile == null ? 'vehicle Photo ' : _vehiclePhotoFile!.path.split('/').last),
                          readOnly: true,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _selectFile('vehiclePhoto'),
                        style: selectFileButton,
                        child: Text('Select File',
                            style: textStyle.copyWith(color: Colors.grey)),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight *0.04),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: textFieldDecoration.copyWith(
                              hintText: _inspectionReportFile == null ?'inspection report': _inspectionReportFile?.path.split('/').last),
                          readOnly: true,

                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _selectFile('inspectionReport'),
                        style: selectFileButton,
                        child: Text('Select File',
                            style: textStyle.copyWith(color: Colors.grey)),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight *0.04),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: textFieldDecoration.copyWith(
                              hintText: _driverLicenseFile == null ? 'License File' : _driverLicenseFile?.path.split('/').last),
                          readOnly: true,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _selectFile('driverLicense');
                          },
                        style: selectFileButton,
                        child: Text('Select File',
                            style: textStyle.copyWith(color: Colors.grey)),
                      ),
                      SizedBox(height: screenHeight *0.04),
                    ],
                  ),
                  SizedBox(height: screenHeight *0.04),
                  ElevatedButton(
                    style: buttonStyle.copyWith(
                      minimumSize:
                      MaterialStateProperty.all<Size>(const Size(213, 50)),
                    ),
                      onPressed: _signUp,
                    child: const Text('Sign Up'),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
