import 'package:flutter/material.dart';

class HourlyTemperature {
  final String time;
  final double temperature;

  HourlyTemperature({required this.time, required this.temperature});

  factory HourlyTemperature.fromJson(Map<String, dynamic> json) {
    return HourlyTemperature(
      time: json['time'],
      temperature: json['temp_c'],
    );
  }
}

class DailyTemperature {
  final String day;
  final double temperature;

  DailyTemperature({required this.day, required this.temperature});

  factory DailyTemperature.fromJson(Map<String, dynamic> json) {
    return DailyTemperature(
      day: json['date'],
      temperature: json['day']['avgtemp_c'],
    );
  }
}

class Currentdata extends StatelessWidget {
  final String city, country, condition;
  final double latitude, longitude, temp;
  final int humidity;
  final List<HourlyTemperature> hourlyData;
  final List<DailyTemperature> weeklyData;

  const Currentdata({
    super.key,
    required this.city,
    required this.country,
    required this.condition,
    required this.latitude,
    required this.longitude,
    required this.temp,
    required this.humidity,
    required this.hourlyData,
    required this.weeklyData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Current Weather Data')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('$city, $country', style: TextStyle(fontSize: 20)),
            Text('Condition: $condition'),
            Text('Temperature: $temp °C'),
            Text('Humidity: $humidity %'),
            SizedBox(height: 20),
            const Text('Hourly Temperatures', style: TextStyle(fontSize: 24)),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hourlyData.length,
                itemBuilder: (context, index) {
                  final hour = hourlyData[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(hour.time),
                          Text('${hour.temperature} °C'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text('Weekly Temperatures', style: TextStyle(fontSize: 24)),
            Expanded(
              child: ListView.builder(
                itemCount: weeklyData.length,
                itemBuilder: (context, index) {
                  final day = weeklyData[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(day.day),
                          Text('${day.temperature} °C'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
