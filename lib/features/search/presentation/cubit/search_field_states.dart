import 'package:arias_tech_solutions_weather_task/features/search/data/remote/models/auto_complete_list_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';


abstract class SearchFieldStates extends Equatable {
  const SearchFieldStates();
}

// Idle
class IdleState extends SearchFieldStates {

  @override
  List<Object> get props => [];
}

// Loading
class LoadingState extends SearchFieldStates {

  @override
  List<Object> get props => [];
}

// Recent Searches
class InputFieldFocusedState extends SearchFieldStates {
  final List<String> recentSearches;

  const InputFieldFocusedState({required this.recentSearches});

  @override
  List<Object?> get props => [recentSearches];
}

// Auto-complete List
class InputFieldTypingState extends SearchFieldStates {
  final List<Predictions> autoCompleteList;

  const InputFieldTypingState({required this.autoCompleteList});

  @override
  List<Object> get props => [autoCompleteList];
}

// Error
class ErrorState extends SearchFieldStates {

  final DioException error;

  const ErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
