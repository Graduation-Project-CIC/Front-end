import 'dart:async';
import 'package:flutter/material.dart';
import 'package:full_circle/Screens/mark_homeless.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../design.dart';
import '../services/donationService.dart';
import '../services/homelessSerivce.dart';

class HomelessMap extends StatefulWidget {
  const HomelessMap({Key? key}) : super(key: key);
  static const String id = 'homeless';

  @override
  _HomelessMapState createState() => _HomelessMapState();
}

class _HomelessMapState extends State<HomelessMap> {
  final homelessService = HomelessService();
  final Completer<GoogleMapController> _controller = Completer();
  late CameraPosition _currentPosition =  CameraPosition(
      target: LatLng(30.0444, 31.2357), zoom: 15);
  Positioned? _userLocation;
  int _selectedIndex = 0;
  List<Homeless> homeless = [];
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    _fetchHomeless();
  }

  Future<void> _fetchHomeless() async {
    final response = await homelessService.getAllHomeless();
    _addMarkers(response);
    print(response);
    setState(() {
      homeless = response;
      print(homeless);
    });
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
    } catch (e) {print('failed to fetch user location $e');}
  }

  void _addMarkers(List<Homeless> homelessList) {
    for (final homeless in homelessList) {
      final marker = Marker(
        markerId: MarkerId(homeless.id.toString()),
        position: LatLng(homeless.latitude, homeless.longitude),
        infoWindow: InfoWindow(title: homeless.description, snippet: homeless.address),
      );
      _markers.add(marker);
    }
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
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        bottomNavigationBar: NavBar(_selectedIndex, _onItemTapped),
      ),
    );
  }
}