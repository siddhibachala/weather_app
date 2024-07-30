import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  final String date;

  WeatherWidget({required this.date});

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('EEEE, MMMM d').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          formatDate(date),
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}

