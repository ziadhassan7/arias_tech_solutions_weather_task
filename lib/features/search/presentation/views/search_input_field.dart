import 'package:arias_tech_solutions_weather_task/core/app_router.dart';
import 'package:arias_tech_solutions_weather_task/core/styles/box_decoration.dart';
import 'package:arias_tech_solutions_weather_task/features/app_common/text_view/custom_text.dart';
import 'package:arias_tech_solutions_weather_task/features/location/data/models/latlong_model.dart';
import 'package:arias_tech_solutions_weather_task/features/location/data/models/place_model.dart';
import 'package:arias_tech_solutions_weather_task/features/location/data/repository/place_repo.dart';
import 'package:arias_tech_solutions_weather_task/features/search/data/local/search_pref.dart';
import 'package:arias_tech_solutions_weather_task/features/search/data/remote/models/auto_complete_list_model.dart';
import 'package:arias_tech_solutions_weather_task/features/search/presentation/cubit/search_field_cubit.dart';
import 'package:arias_tech_solutions_weather_task/features/search/presentation/cubit/search_field_states.dart';
import 'package:arias_tech_solutions_weather_task/features/weather/presentation/screens/weather_info_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../app_common/input_field.dart';
import '../../../app_common/network_util.dart';

class SearchInputField extends StatelessWidget {
  const SearchInputField({super.key, this.searchFieldInWeatherPage = false});

  final bool searchFieldInWeatherPage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> SearchFieldCubit(),
      child: _SearchInputField(searchFieldInWeatherPage));
  }
}


class _SearchInputField extends StatelessWidget {
  const _SearchInputField(this.searchFieldInWeatherPage);

  final bool searchFieldInWeatherPage;
  static final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// Text Input Field
        InputField(
          controller: searchController,
          hint: 'Search by city name',
          filled: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset('assets/icons/search.svg',),
          ),

          onChanged: (inputText){
            context.read<SearchFieldCubit>()
                .listSearchSuggestions(searchInput: inputText);
          },

          onFieldSubmitted: (value){
            openWeatherForSelectedAddress(context, address: value,);
          },

          onFieldFocused: (){
            // Close suggestions list when losing focus of input field
            context.read<SearchFieldCubit>().showRecentSearches();
          },

          onFieldUnfocused: (){
            // Close suggestions list when losing focus of input field
            context.read<SearchFieldCubit>().closeList();
          },
        ),


        /// Auto Complete List (updates based on text input)
        BlocBuilder<SearchFieldCubit, SearchFieldStates>(
          builder: (context, state){
            if(state is IdleState){
              return const SizedBox.shrink();

            } else if (state is LoadingState) {
              return const SizedBox.shrink();

            // When the field is Focused => Show Recent Searches
            } else if (state is InputFieldFocusedState){
              List<String> recentSearchesDescendingOrder = state.recentSearches.reversed.take(10).toList();

              return _autoCompleteListContainer(
                  itemCount: recentSearchesDescendingOrder.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      leading: const Icon(Icons.history),
                      title: TextView(recentSearchesDescendingOrder[index]),
                      onTap: (){
                        openWeatherForSelectedAddress(
                            context,
                            address: recentSearchesDescendingOrder[index]
                        );
                      },
                    );
                  }
                );

            // When user is typing => Show Auto Complete Options
            } else if (state is InputFieldTypingState){
              List<Predictions> data = state.autoCompleteList;

              return _autoCompleteListContainer(
                  itemCount: data.length,
                  itemBuilder: (context, index){
                    String title = data[index].format?.mainText ?? data[index].description!;
                    String subtitle = data[index].format?.secondaryText ?? "";

                    return autoCompleteListTile(
                      title: title,
                      subtitle: subtitle,
                      onTap: () {
                        openWeatherForSelectedLocation(
                          context,
                          placeId: data[index].placeId!,
                          cityName: data[index].description!
                        );
                      }
                    );
                  }
                );
            }

            return const SizedBox.shrink();
          }
        )
      ],
    );
  }

  //----------------------------------------------------------------------------

  Future<void> openWeatherForSelectedLocation(
    BuildContext context, {
    required String placeId,
    required String cityName,
  }) async {
    // add search item to search history
    SearchPref.addSearchItem(cityName);

    // Open weather page
    try {
      PlaceModel place = await PlaceRepo().getLatLongByPlaceId(placeId);

      LatLong latLong = place.results!.first.geometry!.latLong!;

      if (context.mounted) {
        AppRouter.navigateTo(
          context,
          WeatherInfoPage(
            cityName: cityName,
            latLong: latLong,
          ),
          replace: searchFieldInWeatherPage,
        );
      }
    } on DioException catch (e){
      if(context.mounted) NetworkUtil.handleNetworkError(context, e);
      rethrow;
    }
  }


  Future<void> openWeatherForSelectedAddress(
    BuildContext context, {
      required String address,
    }) async {

    // add search item to search history
    SearchPref.addSearchItem(address);

    // Open weather page
    try {
      PlaceModel place = await PlaceRepo().getLatLongByAddress(address);

      LatLong latLong = place.results!.first.geometry!.latLong!;

      if (context.mounted) {
        AppRouter.navigateTo(
          context,
          WeatherInfoPage(
            cityName: place.results!.first.address!.first.longName,
            latLong: latLong,
          ),
          replace: searchFieldInWeatherPage,
        );
      }
    } on DioException catch (e){
      if(context.mounted) NetworkUtil.handleNetworkError(context, e);
      rethrow;
    }
  }


  //----------------------------------------------------------------------------

  Widget _autoCompleteListContainer({required int itemCount, required Widget? Function(BuildContext, int) itemBuilder}){
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 24),

      decoration: CustomDecoration(
        backgroundColor: Colors.white,
        radius: 24,
      ),

      child: ListView.builder(
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: itemBuilder
      )
    );
  }

  Widget autoCompleteListTile({
    required String title,
    required String subtitle,
    required void Function()? onTap
  }){

    return ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SvgPicture.asset('assets/icons/send.svg'),
        title: TextView(
          title,
          maxLines: 1,
        ),
        subtitle: TextView(
          subtitle,
          color: Colors.grey, maxLines: 1,
        ),
        onTap: onTap,

    );
  }
}
