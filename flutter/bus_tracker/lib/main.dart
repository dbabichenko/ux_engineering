import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'bus_schedule_model.dart';

void main() {
  runApp(BusScheduleApp());
}

class BusScheduleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Schedule',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BusScheduleScreen(),
    );
  }
}

class BusScheduleScreen extends StatelessWidget {
  Future<List<BusRoute>> loadBusRoutes() async {
    final String response = await rootBundle.loadString('assets/bus_schedule.json');
    final List<dynamic> data = json.decode(response)['routes'];
    return data.map((json) => BusRoute.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Schedule'),
      ),
      body: FutureBuilder<List<BusRoute>>(
        future: loadBusRoutes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          }

          final routes = snapshot.data!;
          return ListView.builder(
            itemCount: routes.length,
            itemBuilder: (context, index) {
              final route = routes[index];
              return ExpansionTile(
                title: Text(route.routeName),
                children: route.stops.map((stop) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ExpansionTile(
                      title: Text(stop.stopName),
                      children: stop.times.map((time) {
                        return ListTile(
                          title: ElevatedButton(
                            onPressed: () {
                              // Optional: add functionality here if needed
                            },
                            child: Text(time),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }).toList(),
              );
            },
          );
        },
      ),
    );
  }
}
