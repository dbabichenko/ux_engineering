import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Buttons Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Buttons Demo'),
        ),
        body: ButtonDemo(),
      ),
    );
  }
}

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              print("ElevatedButton pressed");
            },
            child: Text("Elevated Button"),
          ),
          SizedBox(height: 20),  // Spacing between buttons
          TextButton(
            onPressed: () {
              print("TextButton pressed");
            },
            child: Text("Text Button"),
          ),
          SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              print("OutlinedButton pressed");
            },
            child: Text("Outlined Button"),
          ),
          SizedBox(height: 20),
          IconButton(
            onPressed: () {
              print("IconButton pressed");
            },
            icon: Icon(Icons.thumb_up),
            tooltip: "Like",
          ),
        ],
      ),
    );
  }
}
