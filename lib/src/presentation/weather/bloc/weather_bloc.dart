import 'package:agroguru/src/data/models/weather.dart';
import 'package:agroguru/src/domain/repository/location_repository.dart';
import 'package:agroguru/src/domain/repository/weather_repository.dart';
import 'package:bloc/bloc.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitialState()) {
    on<WeatherInitialEvent>((event, emit) async {
      emit(WeatherLoadingState());
      try {
        String city = await LocationRepository.getCurrentCity();
        Map<String, dynamic> info =
            await WeatherRepository.getCurrentWeather(city: city);
        Weather w = Weather.fromMap(info);
        // print(info);
        emit(WeatherLoadedState(city: city, weather: w));
      } catch (e) {
        print(e);
        emit(WeatherErroredState());
      }
    });
  }
}
