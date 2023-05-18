import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

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

