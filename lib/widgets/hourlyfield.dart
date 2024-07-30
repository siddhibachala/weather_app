
import 'package:flutter/material.dart';
import 'package:weather_app/utils/getIcon.dart';
// import 'package:weather_forecast/functioning/get_formatted_text.dart';
// import 'package:weather_forecast/functioning/get_icon.dart';

class HourlyField extends StatefulWidget {
  final String date;
  final String condition;
  final double avg_temp_in_c;

  const HourlyField({
    Key? key,
    required this.date,
    required this.condition,
    required this.avg_temp_in_c,
  }) : super(key: key);

  @override
  State<HourlyField> createState() => _HourlyFieldState();
}

class _HourlyFieldState extends State<HourlyField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.avg_temp_in_c.toString()}°C",
                style: TextStyle(
                  color: Colors.lightGreenAccent.shade400,
                  fontSize: 24,
                  fontFamily: 'Crimson',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.condition.replaceAll('shower', ''),
                style: TextStyle(
                  color: Colors.blueAccent.shade700,
                  fontSize: 18,
                  fontFamily: 'Crimson',
                ),
              ),
              Text(
                widget.date.substring(widget.date.length - 5),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontFamily: 'Crimson',
                ),
              ),
            ],
          ),
          SizedBox(
            width: 80,
            height: 80,
            child: Image.asset(
              'assets/${get_icon(widget.condition)}',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
