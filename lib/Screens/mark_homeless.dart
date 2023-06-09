// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:full_circle/Screens/homeless_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../services/homelessSerivce.dart';
import 'home-page.dart';

class MarkHomeless extends StatefulWidget {
  const MarkHomeless({Key? key}) : super(key: key);
  static const String id = 'mark_homeless';

  @override
  _MarkHomelessState createState() => _MarkHomelessState();
}

class _MarkHomelessState extends State<MarkHomeless> {
  final homelessService = HomelessService();
  final Completer<GoogleMapController> _controller = Completer();
  CameraPosition _currentPosition = const CameraPosition(
  target: LatLng(30.0444, 31.2357), zoom: 15);
  final Set<Marker> _markers = {};
  LatLng? _selectedLocation;
  final TextEditingController addressTextEditingController =
      TextEditingController();
  final TextEditingController descriptionTextEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  void _getUserLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      setState(() {
        _currentPosition = CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 15);
      });
    } catch (e) {}
  }

  void _addNewMarker(double latitude, double longitude, String description,
      String address) async {
    print('inside add marker');
    bool success = await homelessService.createHomeless(
      longitude,
      latitude,
      address,
      description,
    );
    success
        ? Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomelessMap()))
        : showDialog(
            context: context,
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                title: const Text('Error'),
                content: const Text('Error adding location'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
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
                markers: _markers,
                onTap: (LatLng latLng) {
                  setState(() {
                    _selectedLocation = latLng;
                  });
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Add a new marker'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: descriptionTextEditingController,
                              decoration: const InputDecoration(
                                labelText: 'Description',
                              ),
                            ),
                            TextField(
                              controller: addressTextEditingController,
                              decoration: const InputDecoration(
                                labelText: 'Address',
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              final description =
                                  descriptionTextEditingController.text;
                              final address = addressTextEditingController.text;
                              if (address.isNotEmpty) {
                                _addNewMarker(
                                    _selectedLocation!.latitude,
                                    _selectedLocation!.longitude,
                                    description,
                                    address);
                              }
                              Navigator.pop(context);
                            },
                            child: const Text('Add'),
                          ),
                        ],
                      );
                    },
                  );
                }),
            Positioned(
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, HomeScreen.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
