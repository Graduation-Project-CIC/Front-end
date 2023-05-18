import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../DoneTracking/NewTracking.dart';
import '../donorreviews.dart';

class MapScreen2 extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen2> {
  Completer<GoogleMapController> _controller = Completer();
  late Marker _originMarker;
  late Marker _destinationMarker;
  late Marker _driverMarker;
  late Polyline _polyline;
  late Timer _timer;
  bool _isDriverArrived = false;

  static const LatLng _originLatLng =
      LatLng(30.064757, 31.336913); // Cairo origin location
  static const LatLng _destinationLatLng =
      LatLng(29.964553, 31.263714); // Cairo destination location
  static LatLng _driverLatLng =
      LatLng(30.020100, 31.305739); // Cairo driver location

  @override
  void initState() {
    super.initState();
    _setMarkers();
    _setPolyline();
    // _startDriverMovement();
    _startArrivalTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _setMarkers() {
    _originMarker = Marker(
      markerId: MarkerId('origin'),
      position: _originLatLng,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );

    _destinationMarker = Marker(
      markerId: MarkerId('destination'),
      position: _destinationLatLng,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );

    _driverMarker = Marker(
      markerId: MarkerId('driver'),
      position: _driverLatLng,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    );
  }

  void _setPolyline() {
    List<LatLng> polylineCoordinates = [
      _originLatLng,
      _destinationLatLng,
    ];

    _polyline = Polyline(
      polylineId: PolylineId('route'),
      color: const Color(0xFF3D8361),
      points: polylineCoordinates,
    );
  }

  void _startArrivalTimer() {
    Timer(Duration(seconds: 5), () {
      setState(() {
        _isDriverArrived = true;
      });
    });
  }

  void _showArrivalPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Driver has delivered the donation successfully'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Tracking'),
          backgroundColor: const Color(0xFF3D8361),
        ),
        body: GoogleMap(
          markers: {
            _originMarker,
            _destinationMarker,
            _driverMarker,
          },
          polylines: {
            _polyline,
          },
          initialCameraPosition: CameraPosition(
            target: _originLatLng,
            zoom: 12.0,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        floatingActionButton: !_isDriverArrived
            ? null
            : AlertDialog(
                title: Text('Volunteer Driver has delivered the donation successfully!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DonorReviews(),
                        ),
                      );
                    },
                    child: Text('OK',
                        style: TextStyle(color: const Color(0xFF3D8361))),
                  ),
                ],
              ));
  }
}
