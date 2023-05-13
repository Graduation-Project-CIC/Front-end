// ignore_for_file: depend_on_referenced_packages, file_names

import 'package:flutter/material.dart';
import 'package:full_circle/design.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../map.dart';
import 'home-page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DonationForm extends StatefulWidget {
  DonationForm({Key? key}) : super(key: key);
  static const String id = 'donationForm_screen';
  String? selectedCategory;
  @override
  // ignore: library_private_types_in_public_api
  _DonationFormState createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  LatLng? _selectedLocation; // variable to store selected location
  XFile? _imageFile1;
  XFile? _imageFile2;
  XFile? _imageFile3;
  int _selectedIndex = 1;

  DateTime _selectedDate = DateTime.now();
  DateTime _selectedDate2 = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  TimeOfDay _selectedTime2 = TimeOfDay.now();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) => screens[index]),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? picked2 = await showDatePicker(
        context: context,
        initialDate: _selectedDate2,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked2 != null && picked2 != _selectedDate2) {
      setState(() {
        _selectedDate2 = picked2;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (newTime != null) {
      setState(() {
        _selectedTime = newTime;
      });
    }
  }

  Future<void> _selectTime2(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime2,
    );
    if (newTime != null) {
      setState(() {
        _selectedTime2 = newTime;
      });
    }
  }

  Future<void> pickImage1() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile1 = pickedImage;
    });
  }

  Future<void> pickImage2() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile2 = pickedImage;
    });
  }

  Future<void> pickImage3() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile3 = pickedImage;
    });
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
                    right: MediaQuery.of(context).size.width > 600 ? 16.0 : 8.0,),                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tell us more about \n your donation',
                        style: mainLogoName.copyWith(color: Colors.black),
                      ),
                      SizedBox(height : screenHeight * 0.04),
                      TextField(
                          decoration: textFieldDecoration.copyWith(
                              hintText: 'Tittle : Rice with vegetables')),
                      SizedBox(height : screenHeight * 0.04),
                      DropdownButtonFormField<String>(
                        decoration: textFieldDecoration.copyWith(
                          hintText: "Choose food category",
                        ),
                        value: widget.selectedCategory,
                        onChanged: (value) {
                          setState(() {
                            widget.selectedCategory = value!;
                          });
                        },
                        items: categories.map((category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                      ),
                      SizedBox(height : screenHeight * 0.04),
                      Text('Upload pictures of your food',
                          style: textStyle.copyWith(
                              color: const Color(0xFF838181))),
                      const Text('At least 2 photos',
                        style: TextStyle(
                          color: Color(0xffD7D8DB),),),
                      SizedBox(height : screenHeight * 0.02),
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
                          SizedBox(width : screenWidth * 0.02),
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
                          SizedBox(width : screenWidth * 0.02),
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
                      SizedBox(height : screenHeight * 0.04),
                      Text('Choose Pick-up location',
                          style: textStyle.copyWith(color: const Color(0xFF838181))),

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
                                  style: TextStyle(color: Colors.black, fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () async {
                          final LatLng? selectedLocation = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LocationPicker(
                                onSelect: (LatLng location) {
                                  setState(() {
                                    _selectedLocation = location;
                                  });
                                },
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
                        style: textStyle.copyWith(color: const Color(0xFF838181)),
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
                                  'Selected date: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}',
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
                        style: textStyle.copyWith(color: const Color(0xFF838181)),
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
                                        'From: ${_selectedTime.format(context)}',
                                        style: const TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width : screenWidth * 0.01),
                          Expanded(
                            child: Container(
                              height: screenHeight *0.05,
                              decoration: formBoxDecoration,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width : screenWidth * 0.01),
                                  const Icon(
                                    Icons.access_time,
                                    color: Color(0xFF3D8361),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () => _selectTime2(context),
                                      child: Text(
                                        'To: ${_selectedTime2.format(context)}',
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
                      SizedBox(height : screenHeight * 0.04),
                      Text('Expiry Date',
                          style: textStyle.copyWith(
                              color: const Color(0xFF838181))),
                      SizedBox(height : screenHeight * 0.01),
                      Container(
                        height: screenHeight *0.05,
                        width: screenWidth * 0.7,
                        decoration: formBoxDecoration,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width : screenWidth * 0.01),
                            const Icon(
                              Icons.calendar_month,
                              color: Color(0xFF3D8361),
                            ),
                            TextButton(
                              onPressed: () => _selectDate2(context),
                              child: Text(
                                'Selected date: ${DateFormat('dd/MM/yyyy')
                                    .format(_selectedDate2)}',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height : screenHeight * 0.04),
                      Text('Description',
                          style: textStyle.copyWith(
                              color: const Color(0xFF838181))),
                      const Text('Any additional information that would help.',
                        style: TextStyle(
                          color: Color(0xffD7D8DB),),),
                      SizedBox(height : screenHeight * 0.02),
                      TextField(
                          maxLines: null,
                          decoration: textFieldDecoration.copyWith(
                              hintText: 'Ex: the meal is enough for 2:3 people.')),
                    ],
                  ),
                ),
                SizedBox(height : screenHeight * 0.04),
                ElevatedButton(
                  style: buttonStyle.copyWith(
                    minimumSize:
                    MaterialStateProperty.all<Size>(const Size(213, 50)),
                  ),
                  onPressed: () {},
                  child: const Text('Donate'),),
                SizedBox(height : screenHeight * 0.04),
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavBar(
          _selectedIndex,
          _onItemTapped,
        ),
      ),);
  }
}
