// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

class WeatherState {
  String? city = '';
  Weather? weather;
  WeatherState({
    this.city,
    this.weather,
  });
}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  WeatherLoadedState({required String city, required Weather weather})
      : super(city: city, weather: weather);
}

class WeatherErroredState extends WeatherState {}
