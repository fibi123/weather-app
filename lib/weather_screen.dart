import 'dart:ui';
import 'package:flutter/material.dart';
import 'additional_info_item.dart';
import 'hourly_forecast_item.dart';

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
                        fontSize: 20,
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
        const SizedBox(height: 18),
        const Text('Weather Forecast',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )
        ),
        //weather forecast card
        const SizedBox(height: 12),
        const SingleChildScrollView(
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

        //Additional Information Section
        // const SizedBox(height: 12),
        const Text('Additional Information',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
        ),
        const SizedBox(height:6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, //requires multiple components
          children: [
            AdditionalInfoItem(),
            AdditionalInfoItem(),
            AdditionalInfoItem(),
          ],
        ),
      ],
    ),
  )
    );
  }
}




