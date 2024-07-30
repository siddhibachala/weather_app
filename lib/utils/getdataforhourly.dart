import 'package:http/http.dart' as http;
import 'package:weather_app/page/currentdata.dart';
// import 'package:weather_forecast/pages/page1.dart';
import 'dart:convert';

import 'package:weather_app/widgets/hourlyfield.dart';

// import 'package:weather_forecast/widgets/hourly_field.dart';


Future<List<HourlyField>> getdata() async {
  try {


    String weekly_url = "http://api.weatherapi.com/v1/forecast.json?key=d771530ea2c04342a4a114808240807&q=${get_city()}&days=7";
    final response = await http.get(Uri.parse(weekly_url));

    if (response.statusCode == 200) {
      print("Connection Success for Hourly API");
      var hourly_decodedData = jsonDecode(response.body);

      List<HourlyField> hourlyFields = [];

      for (int i = 0; i < 24; i++) {
        String hour = hourly_decodedData['forecast']['forecastday'][0]['hour'][i]['time'];
        double temp_in_c = hourly_decodedData['forecast']['forecastday'][0]['hour'][i]['temp_c'];
        String main_condition = hourly_decodedData['forecast']['forecastday'][0]['hour'][i]['condition']['text'];


        hourlyFields.add(
            HourlyField(date: hour,
              condition: main_condition,
              avg_temp_in_c: temp_in_c,));
      }
      return hourlyFields;
    }
  }
  catch (e) {
    //print('Error: $e');
  }
  return [];
}
