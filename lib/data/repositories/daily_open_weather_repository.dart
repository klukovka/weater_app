import 'package:weather_app/data/data_source/open_weather_api.dart';
import 'package:weather_app/data/repositories/json_parser.dart';
import 'package:weather_app/domain/models/daily_weather.dart';
import 'package:weather_app/domain/models/coordinates.dart';
import 'package:weather_app/domain/repositories/daily_weather_repository.dart';

class DailyOpenWeatherRepository implements DailyWeatherRepository {
  final openWeatherApi = OpenWeatherApi();

  @override
  Future<List<DailyWeather>> getDailyWeather(Coordinates coordinates) async {
    final dailyWeather =
        await openWeatherApi.fetchWeather('hourly', coordinates);
    return dailyWeather.map(
      (daily) => JsonParser.parseJsonToDailyWeather(daily),
    );
  }
}
