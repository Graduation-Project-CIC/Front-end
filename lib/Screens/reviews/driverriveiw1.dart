import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:full_circle/Screens/home-page.dart';
import '../../design.dart';

class DriverReview1 extends StatefulWidget {
  const DriverReview1({Key? key}) : super(key: key);

  static const String id = 'DriverReview1';

  @override
  _DriverReview1 createState() => _DriverReview1();
}

class _DriverReview1 extends State<DriverReview1> {
  double _rating = 0;
  double _pickupConvenience = 0;
  double _donorDestination = 0;
  double _packaging = 0;
  String _additionalNotes = '';
  bool _correctAddress = true;
  bool isChecked = false;
  //bool isChecked = false;


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.2;
    final buttonHeight = screenHeight * 0.04;
    //final fieldWidth = screenWidth * 0.6;
    //final fieldHeight = screenHeight * 0.4;
    final pointSize = screenHeight / 40;
    final fontSize = screenHeight / 35;
    final fontSize2 = screenHeight / 40;
    final padding = EdgeInsets.all(screenHeight * 0.01);
    final buttonpadding = EdgeInsets.all(screenHeight * 0.05);
    final double sizedBoxHeight = screenHeight * 0.1;
    final double sizedBoxHeight1 = screenHeight * 0.04;
    final buttonfont = screenHeight / 50;
    //final double boxWidth = constraints.maxWidth * 0.8;
    //double boxHeight = constraints.maxHeight * 0.2;

    return Scaffold(
      body: Padding(
        padding: padding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: sizedBoxHeight),
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  //Navigator.pushReplacementNamed(context, HomeScreen.id);
                },
              ),
              Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.circle,
                        color: Color(0xff3D8361),
                        size: pointSize,
                      ),
                    ),
                    TextSpan(
                      text: 'Your experience with the ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: fontSize,
                      ),
                    ),
                    TextSpan(
                      text: 'donor',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: sizedBoxHeight1),
              Text(
                'How convenient was the pickup time for you?',
                style: TextStyle(fontSize: fontSize2),
              ),
              SizedBox(height: sizedBoxHeight1),
              RatingBar(
                initialRating: _rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                ratingWidget: RatingWidget(
                  full: const Icon(Icons.star, color: Colors.amber),
                  half: const Icon(Icons.star_half, color: Colors.amber),
                  empty: const Icon(Icons.star_border, color: Colors.amber),
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _pickupConvenience = rating;
                  });
                },
              ),
              SizedBox(height: sizedBoxHeight1),
          Text(
                'How appropriate was the destination of the donor to you?',
                style: TextStyle(fontSize: fontSize2),
              ),SizedBox(height: sizedBoxHeight1),
              RatingBar(
                initialRating: _rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                ratingWidget: RatingWidget(
                  full: const Icon(Icons.star, color: Colors.amber),
                  half: const Icon(Icons.star_half, color: Colors.amber),
                  empty: const Icon(Icons.star_border, color: Colors.amber),
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _donorDestination = rating;
                  });
                },
              ),SizedBox(height: sizedBoxHeight1),
              Text(
                'How well did the donor package the food?',
                style: TextStyle(fontSize: fontSize2),
              ),SizedBox(height: sizedBoxHeight1),
              RatingBar(
                initialRating: _rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                ratingWidget: RatingWidget(
                  full: const Icon(Icons.star, color: Colors.amber),
                  half: const Icon(Icons.star_half, color: Colors.amber),
                  empty: const Icon(Icons.star_border, color: Colors.amber),
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _packaging = rating;
                  });
                },
              ),
              SizedBox(height: sizedBoxHeight1),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Additional Notes',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:  Color(0xff3D8361),
                    ),
                  ),
                  hintStyle: TextStyle(fontSize: fontSize2),
                ),
                onChanged: (value) {
                  setState(() {
                    _additionalNotes = value;
                  });
                },
              ),
              SizedBox(height: sizedBoxHeight1),
              Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.circle,
                        color: Color(0xff3D8361),
                        size: pointSize,
                      ),
                    ),
                    TextSpan(
                      text: 'Your experience with the ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: fontSize,
                      ),
                    ),
                    TextSpan(
                      text: ' recipient',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: sizedBoxHeight1),
              Text(
                'Was the recipient address correct? ',
                style: TextStyle(fontSize: fontSize2),
              ),SizedBox(height: sizedBoxHeight1),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: buttonStyle.copyWith(backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xff3D8361)),
                        minimumSize: MaterialStateProperty.all<Size>(const Size(150, 40)),
                      ),
                      onPressed: () {
                        setState(() {
                           _correctAddress = true;
                                   });
                                    },
                            child: Text('Yes'),
                             ),

                  ElevatedButton(
                    style: buttonStyle.copyWith(backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.red),
                      minimumSize: MaterialStateProperty.all<Size>(const Size(150, 40)),),
                    onPressed: () {
                      setState(() {
                        _correctAddress = false;
                      });
                    },
                    child: Text('No'),
                  ),
        ],
                ),
              ),
              SizedBox(height: sizedBoxHeight1),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? newValue) {
                      setState(() {
                        isChecked = newValue ?? false;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                Text(
                  'I can confirm the place I delivered to \nis what was written in the \ndescription of the organization',
                  style: TextStyle(fontSize: fontSize2),
                ),

                ],
              ),
              SizedBox(height: sizedBoxHeight1),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Additional Notes',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:  Color(0xff3D8361),
                    ),
                  ),
                  hintStyle: TextStyle(fontSize: fontSize2),
                ),
                onChanged: (value) {
                  setState(() {
                    _additionalNotes = value;
                  });
                },
              ),
              Padding(
                padding: buttonpadding,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: SizedBox(
                          width: buttonWidth,
                          height: buttonHeight,
                          child: Center(
                            child: Text(
                              'Skip',
                              style: TextStyle(color: Colors.black, fontSize: buttonfont),
                            ),
                          ),
                        ),
                        onPressed: () {
                          //Navigator.pushNamed(context, DriversInstructions.id);
                        },
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color(0xff3D8361),
                        ),
                        child: SizedBox(
                          width: buttonWidth,
                          height: buttonHeight,
                          child: Center(
                            child: Text(
                              'Save',
                              style: TextStyle(color: Colors.white, fontSize: buttonfont),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, HomeScreen.id);
                        },
                      ),
                    ],
              ),),),
            ],
          ),
        ),
      ),
    );
  }
}
