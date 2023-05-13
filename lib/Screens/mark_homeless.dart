import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'home-page.dart';

class MarkHomeless extends StatefulWidget {
  const MarkHomeless({Key? key}) : super(key: key);
  static const String id = 'mark_homeless';

  @override
  _MarkHomelessState createState() => _MarkHomelessState();
}

class _MarkHomelessState extends State<MarkHomeless> {
  final Completer<GoogleMapController> _controller = Completer();
  CameraPosition? _currentPosition;
  final Set<Marker> _markers = {};

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

  void _addNewMarker(double latitude, double longitude, String description) {
    final newMarker = Marker(
      markerId: MarkerId(_markers.length.toString()),
      position: LatLng(latitude, longitude),
      infoWindow: InfoWindow(title: description),
    );
    setState(() {
      _markers.add(newMarker);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
                initialCameraPosition: _currentPosition!,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                markers: _markers,
                onTap:(LatLng latLng) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      final latitude = latLng.latitude;
                      final longitude = latLng.longitude;
                      final TextEditingController textEditingController =
                      TextEditingController();
                      return AlertDialog(
                        title: const Text('Add a new marker'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: textEditingController,
                              decoration: const InputDecoration(
                                labelText: 'Description',
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
                                  textEditingController.text;
                              if (description.isNotEmpty) {
                                _addNewMarker(
                                    latitude, longitude, description);
                              }
                              Navigator.pop(context);
                            },
                            child: const Text('Add'),
                          ),
                        ],
                      );
                    },
                  );
                }
            ),
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
