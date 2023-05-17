import 'package:flutter/material.dart';
import 'package:full_circle/services/donationService.dart';
import 'package:intl/intl.dart';

import '../design.dart';
import 'donationDetails.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String? area;
  final Donation donation;
  final String timeInterval;

  const CustomListTile({
    super.key,
    required this.title,
    required this.area,
    required this.donation,
    required this.timeInterval,
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
                  fontSize: screenWidth *
                      0.045, // adjust font size based on screen size
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(paddingSize),
              child: Text(
                area!,
                style: TextStyle(
                  fontSize: screenWidth *
                      0.050, // adjust font size based on screen size
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(paddingSize),
              child: Text(
                timeInterval,
                style: TextStyle(
                  fontSize: screenWidth *
                      0.035, // adjust font size based on screen size
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(paddingSize),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DonationDetails(donation: donation),),);
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
  const HorizontalList({Key? key, required List<Donation> donations})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Donation>>(
      future: getDonations(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Color(0xFF3D8361))));
        }

        if (snapshot.hasError) {
          return const Center(
              child: Text('Error occurred while fetching donations'));
        }

        final donations = snapshot.data ?? [];

        return SizedBox(
          height: MediaQuery.of(context).size.width * 0.6,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: donations.length,
            itemBuilder: (context, index) {
              return CustomListTile(
                title: donations[index].title,
                area: donations[index].area,
                donation: donations[index],
                timeInterval:
                    'Pickup between ${DateFormat('yyyy-MM-dd HH:mm').format(donations[index].pickUpTimestampStart)} and ${DateFormat('yyyy-MM-dd HH:mm').format(donations[index].pickUpTimestampEnd)}',
              );
            },
          ),
        );
      },
    );
  }
}
