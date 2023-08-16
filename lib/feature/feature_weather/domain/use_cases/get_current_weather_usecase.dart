import 'package:bloc_clean_code/core/resources/data_state.dart';
import 'package:bloc_clean_code/core/use_case/use_case.dart';
import 'package:bloc_clean_code/feature/feature_weather/domain/entities/current_city_entity.dart';
import 'package:bloc_clean_code/feature/feature_weather/domain/repository/weather_repository.dart';

class GetCurrentWeatherUseCase extends UseCase<DataState<CurrentCityEntity>, String>{
  final WeatherRepository weatherRepository;
  GetCurrentWeatherUseCase(this.weatherRepository);

  @override
  Future<DataState<CurrentCityEntity>> call(String param) {
    return weatherRepository.fetchCurrentWeatherData(param);
  }

}