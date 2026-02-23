import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/secrets.dart';
import 'additional_info_item.dart';
import 'hourly_forecast_item.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}


class _WeatherScreenState extends State<WeatherScreen> {
  double temp = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future <Map<String, dynamic>> getCurrentWeather() async {
    try{
      String cityName = 'London';
      final res = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$openWeatherAPIKey'
        ),
      );

      final data = jsonDecode(res.body);
      if (data['cod']!=200){
        throw 'An unexpected error occurred';
      }
      return data;
      //temp = data['main']['temp'];
    } catch (e) {
      throw e.toString();
    }
  }

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
    body:FutureBuilder(
      future: getCurrentWeather(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const Center
            (child: CircularProgressIndicator.adaptive(),
          );
        }

        if(snapshot.hasError) {
          return Center(
              child: Text(
                  snapshot.error.toString()
              )
          );
        }
        // if (snapshot.hasData) { -> used to check if data is present
        //
        // }
        final data = snapshot.data;

        final currentTemp = data?['main']['temp'];
        final currentSky = data?['weather'][0]['main'];
        final currentPressure = data?['main']['pressure'];
        final currentHumidity = data?['main']['humidity'];
        final currentWindSpeed = data?['wind']['speed'];

      return Padding(
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
                        Text('$currentTemp K',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Icon(
                            currentSky == 'Clouds' || currentSky == 'Rain'
                                ? Icons.cloud
                                : Icons.sunny,
                             size: 64
                        ),
                        const SizedBox(height: 16),
                        Text(
                            currentSky,
                            style: const TextStyle(
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
                HourlyForecastItem(
                  time: '00:00',
                  icon: Icons.cloud,
                  temperature: '301.22',
                ),
                HourlyForecastItem(
                  time: '03:00',
                  icon: Icons.sunny,
                  temperature: '300.52',
                ),
                HourlyForecastItem(
                  time: '00:00',
                  icon: Icons.cloud,
                  temperature: '301.22',
                ),
                HourlyForecastItem(
                  time: '00:00',
                  icon: Icons.sunny,
                  temperature: '301.22',
                ),
                HourlyForecastItem(
                  time: '00:00',
                  icon: Icons.cloud,
                  temperature: '301.22',
                ),
                HourlyForecastItem(
                  time: '00:00',
                  icon: Icons.sunny,
                  temperature: '301.22',
                ),
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
              AdditionalInfoItem(
                icon: Icons.water_drop,
                label: 'Humidity',
                value: currentHumidity.toString()
              ),
              AdditionalInfoItem(
                icon: Icons.air,
                label: 'Wind Speed',
                value: currentWindSpeed.toString(),
              ),
              AdditionalInfoItem(
                icon: Icons.beach_access,
                label: 'Pressure',
                value: currentPressure.toString(),
              ),
            ],
          ),
        ],
      ),
        );
      },
    )
    );
  }
}




