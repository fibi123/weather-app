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
      Container(
        child: Card(
          child: Column(
            children: [
              Text('300°F',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              )),
            ]
          )
        ),
      ),
      const SizedBox(height: 20),
      const Placeholder(
        fallbackHeight: 150,
      ),
      const Placeholder(
        fallbackHeight: 150,
      ),
    ],
  )
    );
  }
}

