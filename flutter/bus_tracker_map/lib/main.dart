import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
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

class BusScheduleScreen extends StatefulWidget {
  @override
  _BusScheduleScreenState createState() => _BusScheduleScreenState();
}

class _BusScheduleScreenState extends State<BusScheduleScreen> {
  late GoogleMapController mapController;
  final LatLng _initialPosition = LatLng(40.4406, -79.9959); // Pittsburgh coordinates

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
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: _initialPosition,
                zoom: 12,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('Downtown'),
                  position: LatLng(40.4417, -80.0000),
                  infoWindow: InfoWindow(title: 'Downtown'),
                ),
                // Add more markers if needed for each bus stop
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: FutureBuilder<List<BusRoute>>(
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
                                    // Optional: add functionality to navigate to specific location on the map
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
          ),
        ],
      ),
    );
  }
}
