// ignore_for_file: file_names, use_build_context_synchronously
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:full_circle/Screens/home-page.dart';
import 'package:full_circle/Screens/recipientPreferences.dart';
import 'package:full_circle/services/recipientService.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../design.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../map.dart';
import 'google_map.dart';

class RecipientSignUp extends StatefulWidget {
  const RecipientSignUp({Key? key}) : super(key: key);
  static const String id = 'recipient_SignUp';

  @override
  // ignore: library_private_types_in_public_api
  _RecipientSignUpState createState() => _RecipientSignUpState();
}

class _RecipientSignUpState extends State<RecipientSignUp> {
  XFile? _imageFile1;
  XFile? _imageFile2;
  XFile? _imageFile3;
  XFile? _imageFile4;
  String? selectedType ;
  LatLng? _selectedLocation; // variable to store selected location
  int selectedChipIndex = 0;
  String name = '';
  String bio = '';
  List<File> placeImages = [];
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
    if (pickedImage != null) {
      final imageFile = File(pickedImage.path);
      setState(() {
        _imageFile2 = pickedImage;
        placeImages.add(imageFile);
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
        placeImages.add(imageFile);
      });
    }
  }

  Future<void> pickImage4() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final imageFile = File(pickedImage.path);
      setState(() {
        _imageFile4 = pickedImage;
        placeImages.add(imageFile);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth > 600 ? 20 : 10),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // TOP ICON
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.id);
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.03,
                    right: screenWidth * 0.03,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign up your organization',
                        style: mainLogoName.copyWith(color: Colors.black),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: pickImage1,
                              child: Container(
                                height: screenHeight * 0.08,
                                decoration: boxDecoration,
                                child: _imageFile1 != null
                                    ? Image.file(File(_imageFile1!.path))
                                    : Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(Icons.add),
                                            Text('LOGO'),
                                          ],
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Expanded(
                            flex: 4,
                            child: TextField(
                              decoration: textFieldDecoration.copyWith(
                                hintText: 'Organization name',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  name = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      DropdownButtonFormField<String>(
                        decoration: textFieldDecoration.copyWith(
                          hintText: "Choose Organization type",
                        ),
                        value: selectedType,
                        onChanged: (value) {
                          setState(() {
                            selectedType = value!;
                          });
                        },
                        items: organizationType.map((type) {
                          return DropdownMenuItem<String>(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      Text('Upload pictures of your place',
                          style: textStyle.copyWith(
                              color: const Color(0xFF838181))),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        children: [
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
                          const SizedBox(width: 5),
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
                          const SizedBox(width: 5),
                          Expanded(
                            child: GestureDetector(
                              onTap: pickImage4,
                              child: Container(
                                width: screenWidth * 0.13,
                                height: screenHeight * 0.13,
                                decoration: boxDecoration,
                                child: _imageFile4 != null
                                    ? Image.file(File(_imageFile4!.path))
                                    : const Center(
                                        child: Icon(Icons.add),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      Text('Choose Pick-up location',
                          style: textStyle.copyWith(
                              color: const Color(0xFF838181))),
                      TextButton(
                        child: Container(
                          height: screenHeight * 0.04,
                          width: screenWidth * 0.49,
                          decoration: formBoxDecoration,
                          child: Row(
                            children: [
                              SizedBox(width: screenWidth * 0.02),
                              const Icon(
                                Icons.location_on,
                                color: Color(0xFF3D8361),
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              const Text(
                                'Choose Location',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
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
                      SizedBox(height: screenHeight * 0.04),
                      Text(
                          'How many people are you responsible for feeding daily?',
                          style: textStyle.copyWith(
                              color: const Color(0xFF838181))),
                      Wrap(
                        children: chipLabels.map((String label) {
                          int index = chipLabels.indexOf(label);
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth > 600 ? 20 : 10),
                            child: ChoiceChip(
                              label: Text(
                                label,
                                style: TextStyle(
                                  color: selectedChipIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              selected: selectedChipIndex == index,
                              onSelected: (bool selected) {
                                setState(() {
                                  selectedChipIndex =
                                      (selected ? index : null)!;
                                });
                              },
                              selectedColor: const Color(0xFF3D8361),
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      TextField(
                        maxLines: null,
                        decoration:
                            textFieldDecoration.copyWith(hintText: 'Bio'),
                        onChanged: (value) {
                          setState(() {
                            bio = value;
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
                      bool success = await createRecipient(
                          name,
                          selectedType!,
                          chipLabels[selectedChipIndex],
                          bio,
                          userId,
                          placeImages,
                          File(_imageFile1!.path),
                          _selectedLocation!.longitude,
                          _selectedLocation!.latitude);
                      success
                          ? Navigator.pushNamed(
                              context, RecipientPreferences.id)
                          : showDialog(
                              context: context,
                              builder: (BuildContext dialogContext) {
                                return AlertDialog(
                                  title: const Text('Error'),
                                  content: const Text('Error adding organization'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(dialogContext).pop();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                    },
                    child: const Text('Next')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
