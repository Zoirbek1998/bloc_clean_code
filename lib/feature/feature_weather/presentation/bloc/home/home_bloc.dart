import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_clean_code/core/params/ForecastParams.dart';
import 'package:bloc_clean_code/core/resources/data_state.dart';
import 'package:bloc_clean_code/feature/feature_weather/domain/use_cases/get_forecast_weather_usecase.dart';
import 'package:bloc_clean_code/feature/feature_weather/presentation/bloc/home/cw_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/use_cases/get_current_weather_usecase.dart';
import 'fw_status.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  final GetForecastWeatherUseCase getForecastWeatherUseCase;

  HomeBloc(this.getCurrentWeatherUseCase, this.getForecastWeatherUseCase)
      : super(HomeState(cwStatus: CwLoading(),fwStatus: FwLoading())) {

    on<LoadCwEvent>((event, emit) async {
      emit(state.copyWith(newCwStatus: CwLoading()));


      DataState dataState = await getCurrentWeatherUseCase(event.cityName);
      print("home Data ${dataState.data}");

      if(dataState is DataSuccess){
        emit(state.copyWith(newCwStatus: CwCompleted(dataState.data)));
      }

      if(dataState is DataFailed){
        emit(state.copyWith(newCwStatus: CwError(dataState.error!)));
      }
    });

    /// load 7 days Forecast weather for city Event
    on<LoadFwEvent>((event, emit) async {
      emit(state.copyWith(newFwStatus: FwLoading()));


      DataState dataState = await getForecastWeatherUseCase(event.forecastParams);
      print("home Data ${dataState.data}");

      if(dataState is DataSuccess){
        emit(state.copyWith(newFwStatus: FwCompleted(dataState.data)));
      }

      if(dataState is DataFailed){
        emit(state.copyWith(newFwStatus: FwError(dataState.error!)));
      }
    });
  }
}
