
import 'package:bloc_clean_code/core/params/ForecastParams.dart';
import 'package:bloc_clean_code/core/resources/data_state.dart';
import 'package:bloc_clean_code/feature/feature_weather/data/models/suggest_city_model.dart';
import 'package:bloc_clean_code/feature/feature_weather/domain/entities/current_city_entity.dart';
import 'package:bloc_clean_code/feature/feature_weather/domain/entities/forecase_days_entity.dart';

abstract class WeatherRepository{
 Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(String cityName);
 Future<DataState<ForecastDaysEntity>> fetchForecasWeatherData(ForecastParams params);
 Future<List<Data>> fetchSuggestData(cityName);
}