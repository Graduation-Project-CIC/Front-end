import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../Screens/Safety check/Safety Check.dart';
import '../Screens/google_map.dart';
import '../design.dart';

class VolunteerButton extends StatefulWidget {
  @override
  _VolunteerButtonState createState() => _VolunteerButtonState();
}

class _VolunteerButtonState extends State<VolunteerButton> {
  bool _isVolunteering = false;
  bool _isStarted = false;
  bool _hasArrived = false;

  @override
  Widget build(BuildContext context) {

    if (_isStarted) {
      if (_hasArrived) {
        return Column(
          children: [
            ElevatedButton(
              onPressed: _navigateToSafetyCheck,
              style: buttonStyle.copyWith(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFF3D8361)),
              ),
              child: const Text('Go to Safety Check'),
            ),
            const SizedBox(height: 16), // Adjust the spacing as needed
            ElevatedButton(
              onPressed:
                  null, // Disable the original button when _isStarted is true
              style: buttonStyle.copyWith(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFF3D8361)),
              ),
              child: const Text('STARTED'),
            ),
          ],
        );
      } else {
        return Column(
          children: [
            ElevatedButton(
              onPressed: _handleArrival,
              style: buttonStyle.copyWith(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFF3D8361)),
              ),
              child: const Text('Did you arrive?'),
            ),
            const SizedBox(height: 16), // Adjust the spacing as needed
            ElevatedButton(
              onPressed:
                  null, // Disable the original button when _isStarted is true
              style: buttonStyle.copyWith(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFF3D8361)),
              ),
              child: const Text('STARTED'),
            ),
          ],
        );
      }
    }

    return ElevatedButton(
      onPressed: _isStarted ? null : _showConfirmationDialog,
      style: buttonStyle.copyWith(
        backgroundColor: MaterialStateProperty.all(const Color(0xFF3D8361)),
      ),
      child: _isVolunteering
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : const Text('VOLUNTEER TO DELIVER'),
    );
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Are you sure?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _startProgress();
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  void _startProgress() {
    setState(() {
      _isVolunteering = true;
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isVolunteering = false;
        _isStarted = true;
      });
    });
  }

  void _handleArrival() {
    setState(() {
      _hasArrived = true;
    });
  }

  void _navigateToSafetyCheck() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SafetyCheck1()));
  }
}
