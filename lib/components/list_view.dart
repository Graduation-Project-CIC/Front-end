import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:full_circle/services/donation_service.dart';

class ListPage extends StatefulWidget {
  final String status;
  ListPage({Key? key, required List<Donation> donations, required this.status}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  User? user = FirebaseAuth.instance.currentUser;
  String? userId;

  @override
  void initState() {
    super.initState();
    retrieveUserId();
  }

  void retrieveUserId() {
    if (user != null) {
      if (user!.providerData.isNotEmpty &&
          user?.providerData[0].providerId == 'google.com') {
        // User signed up with Google
        userId = user?.providerData[0].uid;
      } else {
        // User signed up with email/password or other providers
        userId = user?.uid;
      }
    } else {
      // No user signed in
      userId = null;
    }

    if (userId != null) {
      print('User ID: $userId');
    } else {
      print('User ID not found.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Donation>>(
      future: getDonations(userId: userId, status: widget.status),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF3D8361)),
            ),
          );
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text('Error occurred while fetching donations'),
          );
        }

        final donations = snapshot.data ?? [];

        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: donations.length,
              itemBuilder: (BuildContext context, int index) {
                final donation = donations[index];

                // Check if the donation status matches the selected status
                if (donation.status == widget.status) {
                  return ListItem(
                    title: donation.title,
                    area: donation.area,
                    donation: donation,
                    timeInterval:
                    'Pickup between ${DateFormat('yyyy-MM-dd HH:mm').format(donation.pickUpTimestampStart)} and ${DateFormat('yyyy-MM-dd HH:mm').format(donation.pickUpTimestampEnd)}',
                    statusText: donation.status,
                  );
                }

                // If the status doesn't match, return an empty container
                return Container();
              },
            separatorBuilder: (BuildContext context, int index) =>
            const Divider(),
          ),
        );
      },
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final String? area;
  final Donation donation;
  final String timeInterval;
  final String statusText;

  const ListItem({
    required this.title,
    required this.area,
    required this.donation,
    required this.timeInterval,
    required this.statusText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Color(0xFF3D8361),
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Text(
                    area!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF3D8361),
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Text(
                    timeInterval,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF3D8361),
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              statusText,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.grey,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
