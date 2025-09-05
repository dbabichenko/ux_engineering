import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  // Initial location: New York City
  final LatLng _initialPosition = const LatLng(40.7128, -74.0060);

  // Marker example
  final Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId('nyc'),
      position: LatLng(40.7128, -74.0060),
      infoWindow: InfoWindow(
        title: 'New York City',
        snippet: 'An interesting city!',
      ),
    ),
  };

  // Callback for when the map is created
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps Example'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 10.0,
        ),
        markers: _markers,
        mapType: MapType.normal, // Options: normal, satellite, terrain, hybrid
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Move to another position
          mapController.animateCamera(
            CameraUpdate.newLatLng(const LatLng(34.0522, -118.2437)), // Los Angeles
          );
        },
        child: const Icon(Icons.location_city),
      ),
    );
  }
}
