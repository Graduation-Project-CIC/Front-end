import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _controller;
  Marker? _selectedMarker;

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  void _onMarkerTapped(MarkerId markerId) {
    setState(() {
      _selectedMarker = _markers[markerId];
    });
  }

  final Map<MarkerId, Marker> _markers = {
    MarkerId('marker_1'): Marker(
      markerId: MarkerId('marker_1'),
      position: LatLng(37.42796133580664, -122.085749655962),
      infoWindow: InfoWindow(
        title: 'Marker 1',
        snippet: 'Google Headquarters',
      ),
      onTap: () {
      },
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(37.42796133580664, -122.085749655962),
          zoom: 14,
        ),
        markers: Set<Marker>.of(_markers.values),
        onTap: (LatLng latLng) {
          setState(() {
            _selectedMarker = null;
          });
        },
      ),
      floatingActionButton: _selectedMarker == null
          ? null
          : FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Selected Marker'),
                content: Text(
                    'Lat: ${_selectedMarker?.position.latitude}, Lng: ${_selectedMarker?.position.longitude}'),
              );
            },
          );
        },
        child: Icon(Icons.location_on),
      ),
    );
  }
}
