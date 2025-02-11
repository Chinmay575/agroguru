import 'dart:convert';

import 'package:agroguru/src/data/models/forecast.dart';

class Weather {
  String city;
  String condition;
  int humidity;
  String country;
  double tempratureC;
  double uvIndex;
  double windK;
  String image;
  double pressuremb;
  double gustK;
  String sunrise;
  String sunset;
  int rain;
  List<ForecastDay> forecast;
  Weather({
    required this.country,
    required this.rain,
    required this.sunrise,
    required this.sunset,
    required this.gustK,
    required this.pressuremb,
    required this.city,
    required this.condition,
    required this.humidity,
    required this.tempratureC,
    required this.uvIndex,
    required this.image,
    required this.windK,
    required this.forecast,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'city': city,
      'country': country,
      'condition': condition,
      'humidity': humidity,
      'tempratureC': tempratureC,
      'uvIndex': uvIndex,
      'windK': windK,
      'image': image,
      'pressuremb': pressuremb,
      'gustK': gustK,
      'sunrise': sunrise,
      'sunset': sunset,
      'rain': rain,
      'forecast7Day': forecast.map((x) => x.toMap()).toList(),
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    String img = map['current']['condition']['icon'];
    List<dynamic> forecast = map['forecast']['forecastday'] as List<dynamic>;
    return Weather(
      country: map['location']['country'],
      rain: forecast[0]['day']['daily_chance_of_rain'] as int,
      city: map['location']['name'],
      condition: map['current']['condition']['text'] as String,
      humidity: map['current']['humidity'] as int,
      tempratureC: map['current']['temp_c'] as double,
      uvIndex: map['current']['uv'] as double,
      windK: map['current']['wind_kph'] as double,
      pressuremb: map['current']['pressure_mb'] as double,
      gustK: map['current']['gust_kph'] as double,
      sunrise: forecast[0]['astro']['sunrise'] as String,
      sunset: forecast[0]['astro']['sunset'] as String,
      image: img.replaceFirst('//cdn.weatherapi.com', 'assets'),
      forecast: List<ForecastDay>.from(
        (map['forecast']['forecastday'] as List<dynamic>).map<ForecastDay>(
          (x) => ForecastDay.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);
}
