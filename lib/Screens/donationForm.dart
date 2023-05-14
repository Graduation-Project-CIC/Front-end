// ignore_for_file: depend_on_referenced_packages, file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:full_circle/design.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'google_map.dart';
import 'home-page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:full_circle/services/donationService.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class DonationForm extends StatefulWidget {
  DonationForm({Key? key}) : super(key: key);
  static const String id = 'donationForm_screen';
  @override
  // ignore: library_private_types_in_public_api
  _DonationFormState createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  String title = '';
  String? selectedCategory;
  String? selectedArea;
  LatLng? _selectedLocation; // variable to store selected location
  XFile? _imageFile1;
  XFile? _imageFile2;
  XFile? _imageFile3;
  int _selectedIndex = 1;
  String description = '';
  List<File> images = [];

  DateTime _pickUpDate = DateTime.now();
  DateTime _expiryDate = DateTime.now();
  TimeOfDay _pickUpTimeStart = TimeOfDay.now();
  TimeOfDay _pickUpTimeEnd = TimeOfDay.now();
  String userId = '';
  @override
  void initState() {
    super.initState();
    _getUserId();
  }

  Future<void> _getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId') ?? '';
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screens[index]),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _pickUpDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _pickUpDate) {
      setState(() {
        _pickUpDate = picked;
      });
    }
  }

  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? picked2 = await showDatePicker(
        context: context,
        initialDate: _expiryDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked2 != null && picked2 != _expiryDate) {
      setState(() {
        _expiryDate = picked2;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _pickUpTimeStart,
    );
    if (newTime != null) {
      setState(() {
        _pickUpTimeStart = newTime;
      });
    }
  }

  Future<void> _selectTime2(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _pickUpTimeEnd,
    );
    if (newTime != null) {
      setState(() {
        _pickUpTimeEnd = newTime;
      });
    }
  }

  Future<void> pickImage1() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final imageFile = File(pickedImage.path);
      setState(() {
        _imageFile1 = pickedImage;
        images.add(imageFile);
      });
    }
  }

  Future<void> pickImage2() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final imageFile = File(pickedImage.path);
      setState(() {
        _imageFile2 = pickedImage;
        images.add(imageFile);
      });
    }
  }

  Future<void> pickImage3() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final imageFile = File(pickedImage.path);
      setState(() {
        _imageFile3 = pickedImage;
        images.add(imageFile);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //TOP ICON
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, HomeScreen.id);
                      },
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width > 600 ? 16.0 : 8.0,
                    right: MediaQuery.of(context).size.width > 600 ? 16.0 : 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tell us more about \n your donation',
                        style: mainLogoName.copyWith(color: Colors.black),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      TextField(
                        decoration: textFieldDecoration.copyWith(
                            hintText: 'Title : Rice with vegetables'),
                        onChanged: (value) {
                          setState(() {
                            title = value;
                          });
                        },
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      DropdownButtonFormField<String>(
                        decoration: textFieldDecoration.copyWith(
                          hintText: "Choose food category",
                        ),
                        value: selectedCategory,
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value!;
                          });
                        },
                        items: categories.map((category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      Text('Upload pictures of your food',
                          style: textStyle.copyWith(
                              color: const Color(0xFF838181))),
                      const Text(
                        'At least 2 photos',
                        style: TextStyle(
                          color: Color(0xffD7D8DB),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: pickImage1,
                              child: Container(
                                width: screenWidth * 0.13,
                                height: screenHeight * 0.13,
                                decoration: boxDecoration,
                                child: _imageFile1 != null
                                    ? Image.file(File(_imageFile1!.path))
                                    : const Center(
                                        child: Icon(Icons.add),
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Expanded(
                            child: GestureDetector(
                              onTap: pickImage2,
                              child: Container(
                                width: screenWidth * 0.13,
                                height: screenHeight * 0.13,
                                decoration: boxDecoration,
                                child: _imageFile2 != null
                                    ? Image.file(File(_imageFile2!.path))
                                    : const Center(
                                        child: Icon(Icons.add),
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Expanded(
                            child: GestureDetector(
                              onTap: pickImage3,
                              child: Container(
                                width: screenWidth * 0.13,
                                height: screenHeight * 0.13,
                                decoration: boxDecoration,
                                child: _imageFile3 != null
                                    ? Image.file(File(_imageFile3!.path))
                                    : const Center(
                                        child: Icon(Icons.add),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      DropdownButtonFormField<String>(
                        decoration: textFieldDecoration.copyWith(
                          hintText: "Choose Area",
                        ),
                        value: selectedArea,
                        onChanged: (value) {
                          setState(() {
                            selectedArea = value!;
                          });
                        },
                        items: cairoAreas.map((category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      Text('Choose Pick-up location',
                          style: textStyle.copyWith(
                              color: const Color(0xFF838181))),
                      SizedBox(height: screenHeight * 0.02),
                      TextButton(
                        child: Container(
                          height: screenHeight * 0.05,
                          width: screenWidth * 0.69,
                          decoration: formBoxDecoration,
                          child: Row(
                            children: [
                              SizedBox(width: screenWidth * 0.01),
                              const Icon(
                                Icons.location_on,
                                color: Color(0xFF3D8361),
                              ),
                              SizedBox(width: screenWidth * 0.01),
                              const Expanded(
                                child: Text(
                                  'Choose Location',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () async {
                          final LatLng? selectedLocation = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  GoogleMapWidget(
                                    selectedLocation: _selectedLocation,
                                  ),
                            ),
                          );
                          if (selectedLocation != null) {
                            setState(() {
                              _selectedLocation = selectedLocation;
                            });
                          }
                        },
                      ),
                      if (_selectedLocation != null)
                        Text(
                          'Selected location: ${_selectedLocation!.latitude}, ${_selectedLocation!.longitude}',
                        ),
                      SizedBox(height: screenHeight * 0.04),
                      Text(
                        'Pick-up date',
                        style:
                            textStyle.copyWith(color: const Color(0xFF838181)),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Container(
                        height: screenHeight * 0.05,
                        width: screenWidth * 0.7,
                        decoration: formBoxDecoration,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: screenWidth * 0.01),
                            const Icon(
                              Icons.calendar_month,
                              color: Color(0xFF3D8361),
                            ),
                            SizedBox(width: screenWidth * 0.01),
                            Expanded(
                              child: TextButton(
                                onPressed: () => _selectDate(context),
                                child: Text(
                                  'Selected date: ${DateFormat('dd/MM/yyyy').format(_pickUpDate)}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      Text(
                        'Pick-up Time',
                        style:
                            textStyle.copyWith(color: const Color(0xFF838181)),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                              height: screenHeight * 0.05,
                              decoration: formBoxDecoration,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: screenWidth * 0.01),
                                  const Icon(
                                    Icons.access_time,
                                    color: Color(0xFF3D8361),
                                  ),
                                  SizedBox(width: screenWidth * 0.01),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () => _selectTime(context),
                                      child: Text(
                                        'From: ${_pickUpTimeStart.format(context)}',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          Expanded(
                            child: Container(
                              height: screenHeight * 0.05,
                              decoration: formBoxDecoration,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: screenWidth * 0.01),
                                  const Icon(
                                    Icons.access_time,
                                    color: Color(0xFF3D8361),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () => _selectTime2(context),
                                      child: Text(
                                        'To: ${_pickUpTimeEnd.format(context)}',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      Text('Expiry Date',
                          style: textStyle.copyWith(
                              color: const Color(0xFF838181))),
                      SizedBox(height: screenHeight * 0.01),
                      Container(
                        height: screenHeight * 0.05,
                        width: screenWidth * 0.7,
                        decoration: formBoxDecoration,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: screenWidth * 0.01),
                            const Icon(
                              Icons.calendar_month,
                              color: Color(0xFF3D8361),
                            ),
                            TextButton(
                              onPressed: () => _selectDate2(context),
                              child: Text(
                                'Selected date: ${DateFormat('dd/MM/yyyy').format(_expiryDate)}',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      Text('Description',
                          style: textStyle.copyWith(
                              color: const Color(0xFF838181))),
                      const Text(
                        'Any additional information that would help.',
                        style: TextStyle(
                          color: Color(0xffD7D8DB),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      TextField(
                        maxLines: null,
                        decoration: textFieldDecoration.copyWith(
                            hintText: 'Ex: the meal is enough for 2:3 people.'),
                        onChanged: (value) {
                          setState(() {
                            description = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                ElevatedButton(
                  style: buttonStyle.copyWith(
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(213, 50)),
                  ),
                  onPressed: () async {
                    bool success = await createDonation(
                        title,
                        selectedCategory,
                        _selectedLocation!.latitude,
                        _selectedLocation!.longitude,
                        _pickUpDate,
                        _expiryDate,
                        _pickUpTimeStart,
                        _pickUpTimeEnd,
                        description,
                        userId,
                        images,
                        selectedArea);
                    success
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()))
                        : showDialog(
                            context: context,
                            builder: (BuildContext dialogContext) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text('Error creating donation'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(dialogContext).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                  },
                  child: const Text('Donate'),
                ),
                SizedBox(height: screenHeight * 0.04),
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavBar(
          _selectedIndex,
          _onItemTapped,
        ),
      ),
    );
  }
}
