import 'package:flutter/material.dart';
import 'package:weather_app/utils/getIcon.dart';
//import 'package:weather_forecast/functioning/get_date_for_weekly.dart';

//import 'package:weather_forecast/functioning/get_icon.dart';

class WeeklyField extends StatefulWidget {
  final String date,condition;
  final int index,humidity;
  final double avg_temp_in_c;
  const WeeklyField({super.key, required this.date,
    required this.condition, required this.index,
    required this.humidity, required this.avg_temp_in_c, });

  @override
  State<WeeklyField> createState() => _WeeklyFieldState();
}

class _WeeklyFieldState extends State<WeeklyField> {
  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          // Date on the left
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.date,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          // Icon and condition in the center
          Column(
            children: [SizedBox(child: Image.asset('assets/${get_icon(widget.condition)}'),
              width: 50,
              height: 50,),
              // Image.asset(
              //   iconPath,
              //   width: 50,
              //   height: 50,
              // ),
              const SizedBox(height: 5),
              Text(
                widget.condition,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          // Humidity and temperature on the right
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${widget.avg_temp_in_c.toString()} °C",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "${widget.humidity.toString()}%",
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );

  }
}

