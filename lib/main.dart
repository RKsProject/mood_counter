import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MoodCounterApp());
}

class MoodCounterApp extends StatelessWidget {
  const MoodCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MoodCounter(),
    );
  }
}

class MoodCounter extends StatefulWidget {
  const MoodCounter({super.key});

  @override
  State<MoodCounter> createState() => _MoodCounterState();
}

class _MoodCounterState extends State<MoodCounter> {
  int counter = 0;
  Color bgColor = Colors.white;
  double fontSize = 32;

  final List<String> emojis = ["😐", "🙂", "😄", "🤩", "🔥"];

  // Function to generate random color
  Color getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  // Function to get emoji based on counter
  String getEmoji(int value) {
    if (value < 3) return emojis[0]; // 😐
    if (value < 6) return emojis[1]; // 🙂
    if (value < 9) return emojis[2]; // 😄
    if (value < 12) return emojis[3]; // 🤩
    return emojis[4]; // 🔥
  }

  void incrementCounter() {
    setState(() {
      counter++;
      bgColor = getRandomColor();
      fontSize = 32 + counter.toDouble(); // font grows each tap
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text("Mood Counter"),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getEmoji(counter),
              style: TextStyle(fontSize: fontSize),
            ),
            const SizedBox(height: 20),
            Text(
              "Count: $counter",
              style: TextStyle(fontSize: fontSize / 2, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: incrementCounter,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              child: const Text("Tap Me!"),
            ),
          ],
        ),
      ),
    );
  }
}
