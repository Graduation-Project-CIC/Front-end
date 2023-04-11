import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationPicker extends StatefulWidget {
  final Function(LatLng) onSelect;

<<<<<<< HEAD
  LocationPicker({required this.onSelect});

  @override
=======
  // ignore: use_key_in_widget_constructors
  const LocationPicker({required this.onSelect});

  @override
  // ignore: library_private_types_in_public_api
>>>>>>> recipientSignUp
  _LocationPickerState createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  late GoogleMapController mapController;
  LatLng? selectedLocation;

<<<<<<< HEAD
  static late CameraPosition initialPosition = CameraPosition(
=======
  static CameraPosition initialPosition = const CameraPosition(
>>>>>>> recipientSignUp
    target: LatLng(40.7128, -74.0060), // default position
    zoom: 10.0, // default zoom
  );

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void _onMapTapped(LatLng location) {
    setState(() {
      selectedLocation = location;
    });
  }

  void _onSelect() {
    if (selectedLocation != null) {
      widget.onSelect(selectedLocation!);
      Navigator.pop(context);
    }
  }

  Future<void> _getCurrentLocation() async {
    final locationData = await Location().getLocation();
    setState(() {
      initialPosition = CameraPosition(
        target: LatLng(locationData.latitude!, locationData.longitude!),
        zoom: 15,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Location'),
<<<<<<< HEAD
        backgroundColor: Color(0xFF3D8361),
=======
        backgroundColor: const Color(0xFF3D8361),
>>>>>>> recipientSignUp
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        onTap: _onMapTapped,
        initialCameraPosition: initialPosition,
        markers: selectedLocation != null
<<<<<<< HEAD
            ? Set<Marker>.of([
          Marker(
            markerId: MarkerId('selectedLocation'),
=======
            // ignore: prefer_collection_literals
            ? Set<Marker>.of([Marker(
            markerId: const MarkerId('selectedLocation'),
>>>>>>> recipientSignUp
            position: selectedLocation!,
          )
        ])
            : {},
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _onSelect,
        label: const Text('Select Location'),
        icon: const Icon(Icons.check),
        backgroundColor: selectedLocation != null
            ? const Color(0xFF3D8361)
            : Colors.grey[600],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}