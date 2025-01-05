import 'package:arias_tech_solutions_weather_task/features/weather/data/weather_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';


abstract class WeatherInfoStates extends Equatable {
  const WeatherInfoStates();
}

// Idle
class IdleState extends WeatherInfoStates {

  @override
  List<Object> get props => [];
}

// Loading
class LoadingState extends WeatherInfoStates {

  @override
  List<Object> get props => [];
}

// Recent Searches
class SuccessState extends WeatherInfoStates {
  final WeatherModel data;

  const SuccessState({required this.data});

  @override
  List<Object?> get props => [data];
}

// Error
class ErrorState extends WeatherInfoStates {

  final DioException error;

  const ErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
