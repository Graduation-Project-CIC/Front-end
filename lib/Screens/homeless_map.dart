import 'dart:async';
import 'package:flutter/material.dart';
import 'package:full_circle/Screens/mark_homeless.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../design.dart';

class HomelessMap extends StatefulWidget {
  const HomelessMap({Key? key}) : super(key: key);
  static const String id = 'homeless';

  @override
  _HomelessMapState createState() => _HomelessMapState();
}

class _HomelessMapState extends State<HomelessMap> {
  final Completer<GoogleMapController> _controller = Completer();
  CameraPosition? _currentPosition;
  Positioned? _userLocation;
  int _selectedIndex = 0;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    _addFixedMarkers();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screens[index]),
    );
  }

  void _getUserLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      setState(() {
        _currentPosition = CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 15);
      });
    } catch (e) {print(e);}
  }

  void _addFixedMarkers() {
    _markers.add(const Marker(
      markerId: MarkerId('1'),
      position: LatLng(30.16216216216216, 31.592760026293444),
      infoWindow: InfoWindow(title: 'Marker 1'),
    ));
    _markers.add(const Marker(
      markerId: MarkerId('2'),
      position: LatLng(30.17216216216216, 31.592760026293444),
      infoWindow: InfoWindow(title: 'Marker 2'),
    ));
    _markers.add(const Marker(
      markerId: MarkerId('3'),
      position: LatLng(30.19216216216216, 31.592760026293444),
      infoWindow: InfoWindow(title: 'Marker 3'),
    ));
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
              myLocationButtonEnabled: false,
              markers: _markers,
            ),
            if (_userLocation != null) _userLocation!,
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, MarkHomeless.id);
          },
          backgroundColor: const Color(0xFF3D8361),
          child: const Icon(Icons.add_location_alt),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        bottomNavigationBar: NavBar(_selectedIndex, _onItemTapped),
      ),
    );
  }
}