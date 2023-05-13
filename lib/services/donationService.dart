import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path/path.dart';
import 'package:intl/intl.dart';
import 'package:async/async.dart';


final apiUrl = dotenv.env['API_URL'];

class Donation {
  final int id;
  final String title;
  final String category;
  final double latitude;
  final double longitude;
  final DateTime pickUpTimestampStart;
  final DateTime pickUpTimestampEnd;
  final DateTime expiryDate;
  final String description;
  final String userId;
  final List<Picture> pictures;

  Donation({
    required this.id,
    required this.title,
    required this.category,
    required this.latitude,
    required this.longitude,
    required this.pickUpTimestampStart,
    required this.pickUpTimestampEnd,
    required this.expiryDate,
    required this.description,
    required this.userId,
    required this.pictures,
  });

  factory Donation.fromJson(Map<String, dynamic> json) {
    final pictures = (json['pictures'] as List<dynamic>)
        .map((picture) => Picture.fromJson(picture))
        .toList();

    return Donation(
      id: json['id'] as int,
      title: json['title'] as String,
      category: json['category'] as String,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      pickUpTimestampStart:
          DateTime.parse(json['pickUpTimestampStart'] as String),
      pickUpTimestampEnd: DateTime.parse(json['pickUpTimestampEnd'] as String),
      expiryDate: DateTime.parse(json['expiryDate'] as String),
      description: json['description'] as String,
      userId: json['userId'] as String,
      pictures: pictures,
    );
  }
}

class Picture {
  final int id;
  final String url;
  final int donationId;

  Picture({required this.id, required this.url, required this.donationId});

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      id: json['id'] as int,
      url: json['url'] as String,
      donationId: json['donationId'] as int,
    );
  }
}

Future<List<Donation>> getDonations() async {
  final url = '$apiUrl/donation';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as List<dynamic>;
    final donations =
        json.map((donationJson) => Donation.fromJson(donationJson)).toList();
    return donations;
  } else {
    throw Exception('Failed to load donations');
  }
}

Future<bool> createDonation(
  String title,
  String? category,
  double? latitude,
  double? longitude,
  DateTime pickUpDate,
  DateTime expiryDate,
  TimeOfDay pickUpTimeStart,
  TimeOfDay pickUpTimeEnd,
  String description,
  String userId,
  List<File> pictures,
) async {


// Format DateTime variables
  String formattedPickUpDate = DateFormat("yyyy-MM-dd").format(pickUpDate);
  String formattedExpiryDate = DateFormat("yyyy-MM-dd").format(expiryDate);

// Format TimeOfDay variables
  String formattedPickUpTimeStart = '${pickUpTimeStart.hour.toString().padLeft(2, '0')}:${pickUpTimeStart.minute.toString().padLeft(2, '0')}:00';
  String formattedPickUpTimeEnd = '${pickUpTimeEnd.hour.toString().padLeft(2, '0')}:${pickUpTimeEnd.minute.toString().padLeft(2, '0')}:00';


// Combine date and time strings
  String pickUpTimestampStart = '$formattedPickUpDate $formattedPickUpTimeStart:00';
  String pickUpTimestampEnd = '$formattedPickUpDate $formattedPickUpTimeEnd:00';
  String expiryDateFinal = '$formattedExpiryDate $formattedPickUpTimeEnd:00';
  final apiUrl = dotenv.env['API_URL'];
  final url = '$apiUrl/donation';
  var request = http.MultipartRequest('POST', Uri.parse(url));

  request.fields.addAll({
    'title': title,
    'category': category!,
    'latitude': latitude!.toString(),
    'longitude': longitude!.toString(),
    'pickUpTimestampStart': pickUpTimestampStart.toString(),
    'pickUpTimestampEnd': pickUpTimestampEnd.toString(),
    'expiryDate': expiryDateFinal.toString(),
    'description': description,
    'userId': "ur8oukhSM8hp9KCOslimPMfhGmC3"
  });

  for (var file in pictures) {
    request.files.add(await http.MultipartFile.fromPath('pictures', file.path));
  }

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 201) {
    print(await response.stream.bytesToString());
    return true;
  }
  else {
    print(response.reasonPhrase);
    return false;
  }

}
