import 'dart:async';

import 'package:flutter/material.dart';
import 'package:full_circle/Screens/recipient-signUp.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget {
  LatLng? selectedLocation;
   GoogleMapWidget({Key? key, required this.selectedLocation}) : super(key: key);

  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  final Completer<GoogleMapController> _controller = Completer();
  final CameraPosition _currentPosition = const CameraPosition(
    target: LatLng(30.0444, 31.2357),
    zoom: 15,
  );
  final Set<Marker> _markers = {};

  void _onMapTap(LatLng position) {
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: const MarkerId('selected-location'),
          position: position,
        ),
      );
    });
    widget.selectedLocation = position;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: _currentPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              onTap: _onMapTap,
              markers: _markers,
            ),
            Positioned(
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, RecipientSignUp.id);
                },
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: ElevatedButton(
                onPressed: () {
                  if (widget.selectedLocation != null) {
                    Navigator.pop(context, widget.selectedLocation);
                  } else {
                    print('location not saved');
                  }
                },
                child: const Text('Save Location'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}