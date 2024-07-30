import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app/widgets/WeeklyField.dart';

//import 'package:weather_forecast/widgets/weekly_field.dart';

Future<List<WeeklyField>> getWeeklyData(String city) async {
  try {
    String weekly_url = "http://api.weatherapi.com/v1/forecast.json?key=d771530ea2c04342a4a114808240807&q=$city&days=7";

    final response = await http.get(Uri.parse(weekly_url));
    //print(response.statusCode);

    if (response.statusCode == 200) {
      //print("Connection Success for Weekly API");
      var weekly_decodedData = jsonDecode(response.body);

      List<WeeklyField> weeklyFields = [];

      for(int i=0;i <=6;i++){
        String date= weekly_decodedData['forecast']['forecastday'][i]['date'];
        double avg_temp_in_c= weekly_decodedData['forecast']['forecastday'][i]['day']['avgtemp_c'];
        String condition = weekly_decodedData['forecast']['forecastday'][i]['day']['condition']['text'];
        int humidity= weekly_decodedData['forecast']['forecastday'][i]['day']['avghumidity'];

        weeklyFields.add(WeeklyField(
          date: date,
          avg_temp_in_c: avg_temp_in_c,
          condition: condition,
          humidity: humidity,
          index: i,
        ));


      }
      return weeklyFields;

    }
  }
  catch (e) {
    //print('Error: $e');
  }
  return [];
}