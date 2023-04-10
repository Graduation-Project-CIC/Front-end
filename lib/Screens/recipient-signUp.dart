import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../design.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../map.dart';

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
  String? selectedType;
  LatLng? _selectedLocation; // variable to store selected location
  int selectedChipIndex = 0; // index of initially selected chip

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

  Future<void> pickImage4() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile4 = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14.0, right: 11.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign up your organization',
                        style: mainLogoName.copyWith(color: Colors.black),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: pickImage1,
                              child: Container(
                                height: 70,
                                decoration: boxDecoration,
                                child: _imageFile1 != null
                                    ? Image.file(File(_imageFile1!.path))
                                    : Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(Icons.add),
                                            Text('LOGO'),],
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            flex: 4,
                            child: TextField(
                              decoration: textFieldDecoration.copyWith(
                                hintText: 'Organization name',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
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
                      const SizedBox(height: 30),
                      Text('Upload pictures of your place',
                          style: textStyle.copyWith(color: const Color(0xFF838181))),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: pickImage2,
                              child: Container(
                                width: 100,
                                height: 100,
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
                                width: 100,
                                height: 100,
                                decoration: boxDecoration,
                                child: _imageFile3 != null
                                    ? Image.file(File(_imageFile3!.path))
                                    : const Center(
                                        child: Icon(Icons.add), ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: GestureDetector(
                              onTap: pickImage4,
                              child: Container(
                                width: 100,
                                height: 100,
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
                      const SizedBox(height: 30),
                      Text('Choose Pick-up location',
                          style: textStyle.copyWith(color: const Color(0xFF838181))),
                      const SizedBox(height: 5),
                      TextButton(
                        child: Container(
                          height: 35,
                          width: 218,
                          decoration: formBoxDecoration,
                          child: Row(
                            children: const [
                              SizedBox(width: 10),
                              Icon(
                                Icons.location_on,
                                color: Color(0xFF3D8361),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Choose Location',
                                style: TextStyle(color: Colors.black, fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () async {
                          final LatLng? selectedLocation = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LocationPicker(onSelect: (LatLng location) {
                              setState(() {
                                _selectedLocation = location; // store selected location in variable
                              });
                            },)),
                          );
                          if (selectedLocation != null) {
                            setState(() {
                              _selectedLocation = selectedLocation; // store selected location in variable
                            });
                          }
                        },
                      ),
                      if (_selectedLocation != null) // show selected location text if location is selected
                        Text('Selected location: ${_selectedLocation!.latitude}'),
                      const SizedBox(height: 30),
                      Text(
                          'How many people are you responsible for feeding daily?',
                          style: textStyle.copyWith(color: const Color(0xFF838181))),
                      const SizedBox(height: 5),
                      Wrap(
                        children: chipLabels.map((String label) {
                          int index = chipLabels.indexOf(label);
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
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
                      const SizedBox(height: 30),
                      TextField(
                          maxLines: null,
                          decoration: textFieldDecoration.copyWith(hintText: 'Description')),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  style: buttonStyle.copyWith(
                    minimumSize:
                    MaterialStateProperty.all<Size>(const Size(213, 50)),
                  ),
                  onPressed:(){},
                  child: const Text('Sign Up'),),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
