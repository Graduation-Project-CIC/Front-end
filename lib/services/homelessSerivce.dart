import 'dart:convert';
import 'package:http/http.dart' as http;

class HomelessService {
  static const String baseUrl = 'https://fullcircle-srv.herokuapp.com';

  Future<bool> createHomeless(
      double longitude, double latitude, String address, String description) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://fullcircle-srv.herokuapp.com/homeless'));
    request.body = json.encode({
      "longitude": longitude,
      "latitude": latitude,
      "address": address,
      "description": description,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }
  }

  Future<List<Homeless>> getAllHomeless() async {
    final url = Uri.parse('$baseUrl/homeless');

    try {
      final response = await http.get(url);
print(response.statusCode);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as List<dynamic>;
        final homelessList =
        jsonData.map((item) => Homeless.fromJson(item)).toList();
        return homelessList;
      } else {
        print('Failed to get all homeless. Error: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      print('Failed to get all homeless. Error: $error');
      return [];
    }
  }
}

class Homeless {
  final int id;
  final double longitude;
  final double latitude;
  final String address;
  final String description;
  final int? confirmations;

  Homeless({
    required this.id,
    required this.longitude,
    required this.latitude,
    required this.address,
    required this.description,
    required this.confirmations,
  });

  factory Homeless.fromJson(Map<String, dynamic> json) {
    return Homeless(
      id: json['id'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      address: json['address'],
      description: json['description'],
      confirmations: json['confirmations'],
    );
  }
}