import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;


class Recipient {
  final int id;
  final String logo;
  final String name;
  final double latitude;
  final double longitude;
  final String type;
  final String amountOfPeople;
  final String bio;
  final String userId;

  Recipient({
    required this.id,
    required this.logo,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.type,
    required this.amountOfPeople,
    required this.bio,
    required this.userId,
  });

  factory Recipient.fromJson(Map<String, dynamic> json) {
    return Recipient(
      id: json['id'] as int,
      logo: json['logo'] as String,
      name: json['name'] as String,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      type: json['type'] as String,
      amountOfPeople: json['amountOfPeople'] as String,
      bio: json['bio'] as String,
      userId: json['userId'] as String,
    );
  }
}

Future<List<Recipient>> getAllRecipients() async {
  final apiUrl = dotenv.env['API_URL'];
  final response = await http.get(Uri.parse('$apiUrl/recipients'));

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as List<dynamic>;
    final recipients = json.map((recipientJson) => Recipient.fromJson(recipientJson)).toList();
    return recipients;
  } else {
    throw Exception('Failed to load recipients');
  }
}

Future<String?> createRecipient(
    String name,
    String type,
    String amountOfPeople,
    String bio,
    String userId,
    List<File> pictures,
    File logo,
    double? longitude,
    double? latitude,
    ) async {
  final apiUrl = dotenv.env['API_URL'];
  final url = '$apiUrl/recipient';
  print('amountOfPeople: $amountOfPeople');
  var request = http.MultipartRequest('POST', Uri.parse(url));

  request.fields.addAll({
    'name': name,
    'type': type,
    'amountOfPeople': amountOfPeople,
    'bio': bio,
    'userId': userId,
    'longitude': longitude.toString(),
    'latitude': latitude.toString()
  });

  if (pictures.isNotEmpty) {
    for (var i = 0; i < pictures.length; i++) {
      var file = pictures[i];
      var stream = http.ByteStream(Stream.castFrom(file.openRead()));
      var length = await file.length();

      var multipartFile = http.MultipartFile('pictures', stream, length,
          filename: file.path.split('/').last);

      request.files.add(multipartFile);
    }
  }

  if (logo != null) {
    var stream = http.ByteStream(Stream.castFrom(logo.openRead()));
    var length = await logo.length();

    var multipartFile = http.MultipartFile('logo', stream, length,
        filename: logo.path.split('/').last);

    request.files.add(multipartFile);
  }

  var response = await request.send();
  var stringResponse = await response.stream.bytesToString();
  var jsonResponse = jsonDecode(stringResponse);
  var id = jsonResponse['id'].toString();

  if (response.statusCode == 200 && id.isNotEmpty) {
    print('Recipient created successfully');
    return id;
  } else {
    print('Error creating recipient ${await response.stream.bytesToString()}');
    return null;
  }
}

Future<bool> addPreferences(String mealType, List<String> preferences, String id) async {
  final headers = {'Content-Type': 'application/json'};
  final apiUrl = dotenv.env['API_URL'];
  final url = '$apiUrl/recipient/$id/preferences';

  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: json.encode({
      "mealType": mealType,
      "preferences": preferences,
    }),
  );

  if (response.statusCode == 200) {
    print('response body: ${response.body}');
    return true; // Indicate success
  } else {
    print(response.reasonPhrase);
    return false; // Indicate failure
  }
}