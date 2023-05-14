// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:full_circle/design.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../services/donationService.dart';
import 'google_map.dart';

class DonationDetails extends StatelessWidget {
  DonationDetails({Key? key,  required this.donation} ) : super(key: key);
  final Donation donation;

     static const String id = 'donationDetails_screen';

  @override
  Widget build(BuildContext context) {


    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
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
              Expanded(
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(0, 0),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(donation.title, style: mainLogoName.copyWith(fontSize: 35)),
                        SizedBox(height: screenHeight *0.03),
                        Text('Donation Details', style: textStyle.copyWith(color: Colors.black, fontSize: 25)),
                        SizedBox(height: screenHeight *0.02),
                        Text('Category : ${donation.category}',style: textStyle),
                        SizedBox(height: screenHeight *0.02),
                        Text('Pick up start time: ${donation.pickUpTimestampStart.toString()}',style: textStyle),
                        SizedBox(height: screenHeight *0.02),
                        Text('Pick up end time ${donation.pickUpTimestampStart.toString()}',style: textStyle),
                        SizedBox(height: screenHeight *0.02),
                        Text('Expiry date: ${donation.expiryDate.toString()}',style: textStyle),
                        SizedBox(height: screenHeight *0.02),
                        Text('Area: ${donation.area}',style: textStyle),
                        SizedBox(height: screenHeight *0.02),
                        Text('Description: ${donation.description}',style: textStyle),
                        SizedBox(height: screenHeight *0.02),
                        TextButton(
                          child: Container(
                            height: screenHeight * 0.04,
                            width: screenWidth * 0.7,
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
                                  'View location on map',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    GoogleMapWidget(
                                      selectedLocation: LatLng(
                                        donation.latitude,
                                        donation.longitude,
                                      ),
                                      showMarker: true,
                                      showButton: false,
                                      onTap: false,
                                    ),
                              ),
                            );
                          },
                        ),
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: 3,
                            children: List.generate(donation.pictures.length, (index) {
                              return Center(
                                child: Image.network(donation.pictures[index].url),
                              );
                            }),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}