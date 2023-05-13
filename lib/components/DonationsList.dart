import 'package:full_circle/services/donationService.dart';
import 'package:flutter/material.dart';
import 'package:full_circle/Screens/horizontalList.dart';
import '../design.dart';

class DonationsList extends StatefulWidget {
  const DonationsList({Key? key}) : super(key: key);

  @override
  _DonationsListState createState() => _DonationsListState();
}
class _DonationsListState extends State<DonationsList> {
  late List<Donation> donations = [];

  @override
  void initState() {
    super.initState();
    _fetchDonations();
  }

  Future<void> _fetchDonations() async {
    final response = await getDonations();
    setState(() {
      donations = response;
      print(donations);
    });
  }

  @override
  Widget build(BuildContext context) {
    return donations.isNotEmpty
        ? HorizontalList(donations: donations)
        : const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF3D8361))));


  }
}