import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Buttons Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Buttons Demo'),
        ),
        body: ButtonDemo(),
      ),
    );
  }
}

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

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
            child: const Text("Elevated Button"),
          ),
          const SizedBox(height: 20),  // Spacing between buttons
          TextButton(
            onPressed: () {
              print("TextButton pressed");
            },
            child: const Text("Text Button"),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              print("OutlinedButton pressed");
            },
            child: const Text("Outlined Button"),
          ),
          const SizedBox(height: 20),
          IconButton(
            onPressed: () {
              print("IconButton pressed");
            },
            icon: const Icon(Icons.thumb_up),
            tooltip: "Like",
          ),
        ],
      ),
    );
  }
}
