import 'dart:async';

import 'package:flutter/material.dart';
import 'package:full_circle/Screens/recipient-signUp.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget {
  LatLng? selectedLocation;
  final bool showMarker;
  final bool showButton;
  final bool onTap;

  GoogleMapWidget(
      {Key? key,
      this.selectedLocation,
      this.showMarker = false,
      this.showButton = true, this.onTap = true})
      : super(key: key);

  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  final Completer<GoogleMapController> _controller = Completer();
  late CameraPosition _currentPosition = const CameraPosition(
    target: LatLng(30.0444, 31.2357),
    zoom: 15,
  );
  final Set<Marker> _markers = {};

  void _getUserLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      setState(() {
        _currentPosition = CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 15);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    if (widget.showMarker && widget.selectedLocation != null) {
      setState(() {
        _markers.add(
          Marker(
            markerId: const MarkerId('selected-location'),
            position: widget.selectedLocation!,
          ),
        );
      });
    }
  }

  void _onMapTap(LatLng position) {
    if (widget.onTap) {
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
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: _currentPosition,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              onTap: _onMapTap ,
              markers: _markers,
            ),
            Positioned(
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            widget.showButton
                ? Positioned(
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
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
