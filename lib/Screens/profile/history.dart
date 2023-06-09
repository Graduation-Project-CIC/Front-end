import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:full_circle/Screens/profile/profile.dart';
import '../../components/profile_donation_list.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);
  @override
  HistoryState createState() => HistoryState();
}

class HistoryState extends State<History> {
  List<String> donationListOptions = ['pending', 'done'];
  int selectedChipIndex = 0;

  @override
  void initState() {
    super.initState();
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Profile.id);
                      },
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: donationListOptions.map((String label) {
                        int index = donationListOptions.indexOf(label);
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
                  ],
                ),
                ProfileDonationsList(status: donationListOptions[selectedChipIndex]), // Pass the selected status
              ],
            ),
          ),
        ),
      ),
    );
  }
}
