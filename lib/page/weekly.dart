import 'package:flutter/material.dart';
import 'package:weather_app/page/currentdata.dart';
import 'package:weather_app/utils/getdataforhourly.dart';
import 'package:weather_app/utils/getdataforweekly.dart';
import 'package:weather_app/widgets/WeeklyField.dart';
import 'package:weather_app/widgets/hourlyfield.dart';
class WeeklyUpdate extends StatefulWidget {
  const WeeklyUpdate({super.key});

  @override
  State<WeeklyUpdate> createState() => _WeeklyUpdateState();
}

class _WeeklyUpdateState extends State<WeeklyUpdate> {
  late Future<List<WeeklyField>> weeklyDataFuture;
  late Future<List<HourlyField>> hourlyDataFuture;
  @override
  void initState(){
    super.initState();
    weeklyDataFuture = getWeeklyData(get_city());
    hourlyDataFuture = getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder<List<HourlyField>>(
            future: hourlyDataFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No data available'));
              } else {
                return SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return snapshot.data![index];
                    },
                  ),
                );
              }
            },
          ),
          FutureBuilder<List<WeeklyField>>(
            future: weeklyDataFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No data available'));
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return snapshot.data![index];
                    },
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
