import 'package:equatable/equatable.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/domain/models/daily_weather.dart';
import 'package:weather_app/src/domain/models/hourlyWeather.dart';
import 'package:weather_app/src/features/home_page/weather_part/weather_mode.dart';

class WeatherPartState extends Equatable {
  WeatherPartState({
    required this.coordinates,
    required this.loading,
    this.weatherMode = WeatherMode.daily,
    this.dailyWeather,
    this.error,
    this.hourlyWeather,
  });

  final Coordinates coordinates;
  final WeatherMode weatherMode;
  final List<DailyWeather>? dailyWeather;
  final List<HourlyWeather>? hourlyWeather;
  final bool loading;
  final String? error;

  @override
  List<Object?> get props => [
        coordinates,
        dailyWeather,
        error,
        hourlyWeather,
        loading,
        weatherMode,
      ];

  WeatherPartState copyWith({
    Coordinates? coordinates,
    WeatherMode? weatherMode,
    List<DailyWeather>? dailyWeather,
    List<HourlyWeather>? hourlyWeather,
    required bool loading,
    String? error,
  }) {
    return new WeatherPartState(
      coordinates: coordinates ?? this.coordinates,
      weatherMode: weatherMode ?? this.weatherMode,
      dailyWeather: dailyWeather ?? this.dailyWeather,
      hourlyWeather:hourlyWeather??this.hourlyWeather,
      loading: loading,
      error: error,
    );
  }
}
