import 'package:flutter/material.dart';
import 'package:full_circle/services/donationService.dart';

import '../design.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String pickupTimeInterval;
  final String description;

  const CustomListTile({super.key,
    required this.title,
    required this.pickupTimeInterval,
    required this.description,
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
                description,
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
  const HorizontalList({Key? key, required List<Donation> donations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Donation>>(
      future: getDonations(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF3D8361))));
        }

        if (snapshot.hasError) {
          return const Center(child: Text('Error occurred while fetching donations'));
        }

        final donations = snapshot.data ?? [];

        return SizedBox(
          height: MediaQuery.of(context).size.width * 0.5,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: donations.length,
            itemBuilder: (context, index) {
              return CustomListTile(
                title: donations[index].title,
                pickupTimeInterval:
                '${donations[index].pickUpTimestampStart} - ${donations[index].pickUpTimestampEnd}',
                description: donations[index].description,
              );
            },
          ),
        );
      },
    );
  }
}

