import 'dart:async';

import 'package:flutter/material.dart';

import 'live-map.dart';

class DonationTrackingScreen extends StatefulWidget {
  const DonationTrackingScreen({Key? key}) : super(key: key);

  @override
  State<DonationTrackingScreen> createState() => _DonationTrackingScreenState();
}

class _DonationTrackingScreenState extends State<DonationTrackingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      setState(() {
        deliveryStatus = "Matched";
      });
    });
    Timer(Duration(seconds: 2), () {
      setState(() {
        deliveryStatus = "On the way!";
      });
    });
  }

  String deliveryStatus = "Pending";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Donation Status"),
        backgroundColor: const Color(0xFF3D8361),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mix Vegetables",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "اصنع فرحة",
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Image.asset(
                  "images/vegetables.jpg",
                  width: 100.0,
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              "Delivery Volunteer Status",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Container(
              height: 40.0,
              decoration: BoxDecoration(
                color: deliveryStatus == "Pending"
                    ? Colors.grey.shade200
                    : deliveryStatus == "Matched"
                        ? Colors.green.shade200
                        : Colors.red.shade200,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  deliveryStatus,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            if (deliveryStatus != "Pending") ...[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Ahmed Mahmoud",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      Image.asset(
                        "images/driver.jpg",
                        width: 50.0,
                      ),
                      IconButton(
                        icon: Icon(Icons.phone),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              if (deliveryStatus == 'On the way!') ...[
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapScreen(),
                      ),
                    );
                  },
                  child: Text("Track Driver on Map"),
                  style: TextButton.styleFrom(
                    alignment: Alignment.center,
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                )
              ]
            ],
          ],
        ),
      ),
    );
  }
}
