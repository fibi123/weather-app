import 'dart:ui';
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
  body: Padding(
    padding: EdgeInsets.all(16.0),
    child: Column (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //main card
        SizedBox(
          width: double.infinity,
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10,
                  sigmaY: 10,
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('300°F',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),

                      Icon(Icons.cloud,
                           size: 64
                      ),
                      const SizedBox(height: 16),
                      Text(
                          'Rain',
                          style: TextStyle(
                            fontSize: 20,
                          )
                      )
                    ]
                  ),
                ),
              ),
            ),
          ),
        ),
        //weather forecast cards
        const SizedBox(height: 20),
        const Text('Weather Forecast',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )
        ),
        //weather forecast card
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              HourlyForecastItem(),
              HourlyForecastItem(),
              HourlyForecastItem(),
              HourlyForecastItem(),
              HourlyForecastItem(),
              HourlyForecastItem(),
            ],
          ),
        ),
        const Placeholder(
          fallbackHeight: 12,
        ),
        const SizedBox(height: 20),
        const Placeholder(
          fallbackHeight: 6,
        ),
      ],
    ),
  )
    );
  }
}

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:6,
      child: Container (
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Column(
          children:[
            Text(
              '03:00',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 8),
            Icon(
              Icons.cloud,
              size: 32,
            ),
            SizedBox(height: 8),
            Text('320.12'),
          ],
        ),
      ),
    );
  }
}
