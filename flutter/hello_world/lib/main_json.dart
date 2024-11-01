import 'package:flutter/material.dart';
import 'dart:convert'; // For JSON decoding
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Read JSON in Flutter'),
        ),
        body: JsonDemo(),
      ),
    );
  }
}

class JsonDemo extends StatefulWidget {
  @override
  _JsonDemoState createState() => _JsonDemoState();
}

class _JsonDemoState extends State<JsonDemo> {
  // Define a variable to hold JSON data
  Map<String, dynamic>? jsonData;

  @override
  void initState() {
    super.initState();
    loadJsonData(); // Load JSON when the widget initializes
  }

  // Load JSON from assets
  Future<void> loadJsonData() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response); // Parse JSON
    setState(() {
      jsonData = data; // Store parsed JSON data in jsonData variable
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: jsonData == null
          ? CircularProgressIndicator() // Show loading spinner while data is loading
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Name: ${jsonData!['name']}"),
          Text("Age: ${jsonData!['age']}"),
          Text("City: ${jsonData!['city']}"),
        ],
      ),
    );
  }
}
