import 'package:firebase_auth/firebase_auth.dart';
import 'package:full_circle/components/list_view.dart';
import 'package:full_circle/services/donation_service.dart';
import 'package:flutter/material.dart';

class ProfileDonationsList extends StatefulWidget {
  final String status; // Add the status parameter

  const ProfileDonationsList({Key? key, required this.status}) : super(key: key);


  @override
  _ProfileDonationsListState createState() => _ProfileDonationsListState();
}

class _ProfileDonationsListState extends State<ProfileDonationsList> {
  late List<Donation> donations = [];

  @override
  void initState() {
    super.initState();
    _fetchDonations();
  }

  Future<void> _fetchDonations() async {
    User? user = FirebaseAuth.instance.currentUser;
    String? userId = user?.uid;

    final response = await getDonations(userId: userId);

    // Filter donations based on the status
    List<Donation> filteredDonations = response.where((donation) {
      return donation.status == widget.status; // Access widget.status
    }).toList();

    setState(() {
      donations = filteredDonations;
      print(donations);
    });
  }


  @override
  Widget build(BuildContext context) {
    return donations.isNotEmpty
        ? ListPage(donations: donations, status: widget.status)
        : const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF3D8361)),
      ),
    );
  }
}
