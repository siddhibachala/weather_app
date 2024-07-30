import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app/page/currentdata.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String? condition, country;
  double? tempInC, latitude, longitude;
  int? humidity;

  TextEditingController cityController = TextEditingController();

  Future<void> fetchData({required String city}) async {
    try {
      String secondUrl =
          "http://api.weatherapi.com/v1/current.json?key=d771530ea2c04342a4a114808240807&q=$city";
      final secondResponse = await http.get(Uri.parse(secondUrl));

      if (secondResponse.statusCode == 200) {
        var decodedData = jsonDecode(secondResponse.body);
        setState(() {
          country = decodedData["location"]["country"];
          condition = decodedData['current']['condition']['text'];
          latitude = decodedData["location"]["lat"];
          longitude = decodedData["location"]["lon"];
          tempInC = decodedData['current']['temp_c'];
          humidity = decodedData['current']['humidity'];
        });
      } else {
        // Handle the case where the response is not successful
        print("Error: ${secondResponse.statusCode}");
      }
    } catch (e) {
      print("Error: $e"); // Handle errors here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Align(
              alignment: Alignment.topLeft,
              child: const Text(
                "City Name",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: cityController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter city name',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {

                fetchData(city: cityController.text);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Currentdata(
                      latitude: latitude ?? 0.0,
                      longitude: longitude ?? 0.0,
                      temp:  tempInC  ?? 0.0,
                      humidity: humidity ?? 0,
                      city: cityController.text,
                      country: country ?? '',
                      condition: condition ?? '',

                    ),
                  ),
                );
              },
              child: const Text('Search'),
            ),

          ],
        ),
      ),
    );
  }
}
