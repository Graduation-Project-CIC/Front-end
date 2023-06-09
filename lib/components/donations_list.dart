import 'package:flutter/material.dart';
import '../components/horizontal_list.dart';
import '../design.dart';
import '../services/donation_service.dart';

class DonationsList extends StatefulWidget {
  const DonationsList({Key? key}) : super(key: key);

  @override
  _DonationsListState createState() => _DonationsListState();
}

class _DonationsListState extends State<DonationsList> {
  late List<Donation> donations = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchDonations();
  }

  Future<void> _fetchDonations() async {
    final response = await getDonations(status: 'pending');
    setState(() {
      donations = response;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return donations.isNotEmpty
        ? HorizontalList(donations: donations)
        : isLoading
        ? const Center(
        child: CircularProgressIndicator(
            valueColor:
            AlwaysStoppedAnimation<Color>(Color(0xFF3D8361))))
        : const Text(
      'No Donations Available',
      textAlign: TextAlign.center,
    );
  }
}