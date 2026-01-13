import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          )
        ]
    ),
  body: Column (
    children: [
      //main card
      const Placeholder(
        fallbackHeight: 250,
        // child: const Text ('Main Cart')
      ),
      const SizedBox(height: 10),
      const Placeholder(
        fallbackHeight: 150,
      ),
    ],
  )
    );
  }
}

