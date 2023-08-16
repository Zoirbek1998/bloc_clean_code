import 'package:bloc_clean_code/feature/feature_bookmark/data/data_source/local/database.dart';
import 'package:bloc_clean_code/feature/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:bloc_clean_code/feature/feature_weather/data/repository/weather_repositoryImpl.dart';
import 'package:bloc_clean_code/feature/feature_weather/domain/repository/weather_repository.dart';
import 'package:bloc_clean_code/feature/feature_weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:bloc_clean_code/feature/feature_weather/presentation/bloc/home/home_bloc.dart';
import 'package:get_it/get_it.dart';

import 'feature/feature_bookmark/data/repository/city_repository_impl.dart';
import 'feature/feature_bookmark/domain/repository/city_repository.dart';
import 'feature/feature_bookmark/domain/use_cases/delete_city_usecase.dart';
import 'feature/feature_bookmark/domain/use_cases/get_all_city_usecase.dart';
import 'feature/feature_bookmark/domain/use_cases/get_city_usecase.dart';
import 'feature/feature_bookmark/domain/use_cases/save_city_usecase.dart';
import 'feature/feature_bookmark/presentation/bloc/bookmark_bloc.dart';
import 'feature/feature_weather/domain/use_cases/get_forecast_weather_usecase.dart';

GetIt locator = GetIt.instance;

setUp() async {
  locator.registerSingleton<ApiProvider>(ApiProvider());

  final database =
      await $FloorAppDatabase.databaseBuilder("app_database.db").build();
  locator.registerSingleton<AppDatabase>(database);

  ///repositories
  locator
      .registerSingleton<WeatherRepository>(WeatherRepositoryImpl(locator()));
  locator
      .registerSingleton<CityRepository>(CityRepositoryImpl(database.cityDao));

  /// use case
  locator.registerSingleton<GetCurrentWeatherUseCase>(
      GetCurrentWeatherUseCase(locator()));
  locator.registerSingleton<GetForecastWeatherUseCase>(
      GetForecastWeatherUseCase(locator()));
  locator.registerSingleton<GetCityUseCase>(GetCityUseCase(locator()));
  locator.registerSingleton<SaveCityUseCase>(SaveCityUseCase(locator()));
  locator.registerSingleton<GetAllCityUseCase>(GetAllCityUseCase(locator()));
  locator.registerSingleton<DeleteCityUseCase>(DeleteCityUseCase(locator()));

  /// Bloc
  locator.registerSingleton<HomeBloc>(HomeBloc(locator(), locator()));
  locator.registerSingleton<BookmarkBloc>(BookmarkBloc(
    locator(),
    locator(),
    locator(),
    locator(),
  ));
}
