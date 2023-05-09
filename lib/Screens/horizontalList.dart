import 'package:flutter/material.dart';

import '../design.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String pickupTimeInterval;
  final String location;

  CustomListTile({
    required this.title,
    required this.pickupTimeInterval,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final paddingSize = screenWidth * 0.03;

    return Container(
      width: screenWidth * 0.5,
      margin: EdgeInsets.all(screenWidth * 0.015),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(paddingSize),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.045, // adjust font size based on screen size
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(paddingSize),
              child: Text(
                pickupTimeInterval,
                style: TextStyle(
                  fontSize: screenWidth * 0.025, // adjust font size based on screen size
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(paddingSize),
              child: Text(
                location,
                style: TextStyle(
                  fontSize: screenWidth * 0.025, // adjust font size based on screen size
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(paddingSize),
              child: ElevatedButton(
                onPressed: () {
                  // Add your code here to show more details
                },
                child: const Text('See Details   >>'),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF3D8361),
                  minimumSize: const Size(130, 30),
                  textStyle: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10, // replace with the length of your data list
        itemBuilder: (context, index) {
          return CustomListTile(
            title: 'Title $index',
            pickupTimeInterval: 'Pickup Time Interval $index',
            location: 'Location $index',
          );
        },
      ),
    );
  }
}
