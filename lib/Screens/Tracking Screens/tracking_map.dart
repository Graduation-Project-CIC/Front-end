import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class TrackingMap extends StatefulWidget {
  const TrackingMap({Key? key}) : super(key: key);

  @override
  State<TrackingMap> createState() => TrackingMapState();
}

class TrackingMapState extends State<TrackingMap> {
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng sourceLocation = LatLng(30.0443, 31.2362);
  static const LatLng destination = LatLng(30.0439, 31.2383);
  final googleApiKey = dotenv.env['googleApiKey'];
  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;
  Location location = Location();
  bool isLoading = true;

  StreamSubscription<LocationData>? locationSubscription;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  void dispose() {
    locationSubscription?.cancel();
    super.dispose();
  }
  void getCurrentLocation() async {
    try {
      currentLocation = await location.getLocation();
      print('Current Location: $currentLocation');
      setState(() {
        isLoading = false;
      });
      polyPoints();
      locationSubscription = location.onLocationChanged.listen(
            (newLoc) async {
          print('Location changed: $newLoc');
          setState(() {
            currentLocation = newLoc;
          });

          if (currentLocation != null) {
            final GoogleMapController googleMapController = await _controller.future;
            googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  zoom: 20.5,
                  target: LatLng(newLoc.latitude!, newLoc.longitude!),
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      print('Error getting current location: $e');
      // Handle location retrieval error gracefully
    }

    location.onLocationChanged.listen(
          (newLoc) async {
        print('Location changed: $newLoc');
        setState(() {
          currentLocation = newLoc;
        });

        if (currentLocation != null) {
          final GoogleMapController googleMapController = await _controller.future ;
          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                zoom: 17.5,
                target: LatLng(newLoc.latitude!, newLoc.longitude!),
              ),
            ),
          );
        }
      },
    );
  }

  void polyPoints() async {
    try {
      PolylinePoints polylinePoints = PolylinePoints();

      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey!,
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(destination.latitude, destination.longitude),
      );

      if (result.points.isNotEmpty) {
        result.points.forEach(
              (PointLatLng point) => polylineCoordinates.add(
            LatLng(point.latitude, point.longitude),
          ),
        );
        setState(() {});
      }
    } catch (e) {
      print('Error calculating polyline: $e');
      // Handle polyline calculation error gracefully
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            currentLocation!.latitude!,
            currentLocation!.longitude!,
          ),
          zoom: 17.5,
        ),
        polylines: {
          Polyline(
            polylineId: PolylineId("route"),
            points: polylineCoordinates,
            color: Colors.blueAccent,
            width: 3,
          ),
        },
        markers: {
          Marker(
            markerId: MarkerId("currentLocation"),
            position: LatLng(
              currentLocation!.latitude!,
              currentLocation!.longitude!,
            ),
          ),
          const Marker(
            markerId: MarkerId("source"),
            position: sourceLocation,
          ),
          const Marker(
            markerId: MarkerId("destination"),
            position: destination,
          ),
        },
        onMapCreated: (mapController) {
          _controller.complete(mapController);
        },
      ),
    );
  }
}

