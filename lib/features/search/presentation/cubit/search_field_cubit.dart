import 'package:arias_tech_solutions_weather_task/features/search/data/local/search_pref.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/remote/auto_complete_list_model.dart';
import '../../data/remote/auto_complete_repo.dart';
import 'search_field_states.dart';


class SearchFieldCubit extends Cubit<SearchFieldStates>{
  SearchFieldCubit() : super(IdleState());


  showRecentSearches(){
    List<String>? recentSearchItems = SearchPref.getAllSearchHistory();

    if(recentSearchItems != null && recentSearchItems.isNotEmpty){
      emit(InputFieldFocusedState(recentSearches: recentSearchItems));
    }
  }


  listSearchSuggestions({required String searchInput,}) async {

    //Start Loading
    emit(LoadingState());

    try {

      AutoCompleteListModel data = await SearchRepo().getAutoCompleteList(
        searchInput,
      );

      if(data.predictions != null && data.predictions!.isNotEmpty){
        emit(InputFieldTypingState(autoCompleteList: data.predictions!));

      } else {
        emit(IdleState());
      }

    } on DioException catch (e) {
      emit(ErrorState(error: e));
    }
  }

}
