import 'package:flutter/material.dart';
import 'package:weather_app/page/weekly.dart';
import 'package:weather_app/utils/getIcon.dart';

String final_city='';

class Currentdata extends StatefulWidget {
  final String city, country, condition;
  final double latitude,longitude, temp;
  final int humidity;


  const Currentdata({super.key,
    required this.city,
    required this.country,
    required this.condition,
    required this.latitude,
    required this.longitude,
    required this.temp,
    required this.humidity});

  @override
  State<Currentdata> createState() => _CurrentdataState();
}

class _CurrentdataState extends State<Currentdata> {
  @override
  Widget build(BuildContext context) {
    final_city=widget.city;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Information'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(child: Image.asset('assets/${get_icon(widget.condition)}'),
                width: 100,
                height: 100,),
              const SizedBox(height: 10),
              Text(widget.condition, style: TextStyle(fontSize: 25),),
              _buildInfoRow('City:', widget.city, Colors.blue),
              const SizedBox(height: 10),
              _buildInfoRow('Country:', widget.country, Colors.grey),
              const SizedBox(height: 10),
              _buildInfoRow('Temperature:', '${widget.temp.toString()} °C',
                  Colors.orange),
              const SizedBox(height: 10),
              _buildInfoRow('Humidity:', '${widget.humidity} %', Colors.black),
              const SizedBox(height: 10),
              _buildInfoRow('Latitude:', '${widget.latitude}', Colors.black),
              const SizedBox(height: 10),
              _buildInfoRow('Longitude:', '${widget.longitude}', Colors.black),
              const SizedBox(height:60),
              ElevatedButton(
                onPressed: () {
                  print(get_city());
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WeeklyUpdate(),
                    ),
                  );

                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(),
                  backgroundColor: Colors.lightGreenAccent,// This removes the rounded corners
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0), // Add padding
                ),
                    child: const Text('GO'),
              ),
          ],
        ),
      ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

String get_city(){
  return final_city;
}
