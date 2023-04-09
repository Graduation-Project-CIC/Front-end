import 'package:flutter/material.dart';
import 'package:full_circle/Screens/welcome-page.dart';
import 'package:full_circle/design.dart';
import 'package:image_picker/image_picker.dart';
import '../design.dart';
import 'dart:io';
import 'home-page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class DonationForm extends StatefulWidget {
  DonationForm({Key? key}) : super(key: key);
  static const String id = 'donationForm_screen';
  String? selectedCategory;
  @override
  _DonationFormState createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  XFile? _imageFile1;
  XFile? _imageFile2;
  XFile? _imageFile3;

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
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

  GoogleMapController? mapController;
  CameraPosition initialPosition = CameraPosition(
    target: LatLng(40.7128, -74.0060), // default position
    zoom: 10.0, // default zoom
  );

  @override
  Widget build(BuildContext context) {
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
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tell us more about \n your donation',
                        style: mainLogoName.copyWith(color: Colors.black),
                      ),
                      SizedBox(height: 20),
                      TextField(
                          decoration: textFieldDecoration.copyWith(
                              hintText: 'Tittle : Rice with vegtables')),
                      SizedBox(height: 20),
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
                      SizedBox(height: 20),
                      Text('Upload pictures of your food',
                          style: textStyle.copyWith(color: Color(0xFF838181))),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: pickImage1,
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: boxDecoration,
                                child: _imageFile1 != null
                                    ? Image.file(File(_imageFile1!.path))
                                    : Center(
                                        child: Icon(Icons.add),
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: GestureDetector(
                              onTap: pickImage2,
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: boxDecoration,
                                child: _imageFile2 != null
                                    ? Image.file(File(_imageFile2!.path))
                                    : Center(
                                        child: Icon(Icons.add),
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: GestureDetector(
                              onTap: pickImage3,
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: boxDecoration,
                                child: _imageFile3 != null
                                    ? Image.file(File(_imageFile3!.path))
                                    : Center(
                                        child: Icon(Icons.add),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text('Choose Pick-up location',
                          style: textStyle.copyWith(color: Color(0xFF838181))),
                      SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: SizedBox(
                                height: 300,
                                child: GoogleMap(
                                  initialCameraPosition: initialPosition,
                                  onMapCreated: (controller) =>
                                      mapController = controller,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Close'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          height: 35,
                          width: 218,
                          decoration:formBoxDecoration,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 10),
                              Icon(
                                Icons.location_on,
                                color: Color(0xFF3D8361),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Choose Location',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('Pick-up date',
                          style: textStyle.copyWith(color: Color(0xFF838181))),
                      SizedBox(height: 5),
                      Container(
                        height: 35,
                        width: 218,
                        decoration: formBoxDecoration,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 10),
                            Icon(
                              Icons.calendar_month,
                              color: Color(0xFF3D8361),
                            ),
                            TextButton(
                              onPressed: () => _selectDate(context),
                              child: Text(
                                'Selected date: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('Pick-up Time',
                          style: textStyle.copyWith(color: Color(0xFF838181))),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                              height: 35,
                              width: 218,
                              decoration: formBoxDecoration,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.access_time,
                                    color: Color(0xFF3D8361),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () => _selectTime(context),
                                      child: Text(
                                        'From: ${_selectedTime.format(context)}',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              height: 35,
                              width: 218,
                              decoration: formBoxDecoration,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.access_time,
                                    color: Color(0xFF3D8361),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () => _selectTime(context),
                                      child: Text(
                                        'To: ${_selectedTime.format(context)}',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text('Expiry Date',
                          style: textStyle.copyWith(color: Color(0xFF838181))),
                      SizedBox(height: 5),
                      Container(
                        height: 35,
                        width: 218,
                        decoration: formBoxDecoration,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 10),
                            Icon(
                              Icons.calendar_month,
                              color: Color(0xFF3D8361),
                            ),
                            TextButton(
                              onPressed: () => _selectDate(context),
                              child: Text(
                                'Selected date: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('Description',
                          style: textStyle.copyWith(color: Color(0xFF838181))),
                      Text('Any additional information that would help.',
                        style : TextStyle(
                          color: Color(0xffD7D8DB),),),
                      SizedBox(height: 5),
                      TextField(
                        maxLines: null,
                          decoration: textFieldDecoration.copyWith(
                              hintText: 'Ex: the meal is enough for 2:3 people.')),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: ElevatedButton(
                    child: Text('Donate'),
                    style: buttonStyle.copyWith(
                      minimumSize:
                      MaterialStateProperty.all<Size>(Size(213, 50)),
                    ),
                    onPressed:(){},),),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
