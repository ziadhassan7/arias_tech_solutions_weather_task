import 'package:arias_tech_solutions_weather_task/core/app_router.dart';
import 'package:arias_tech_solutions_weather_task/core/styles/box_decoration.dart';
import 'package:arias_tech_solutions_weather_task/features/app_common/text_view/custom_text.dart';
import 'package:arias_tech_solutions_weather_task/features/location/data/models/latlong_model.dart';
import 'package:arias_tech_solutions_weather_task/features/location/data/models/place_model.dart';
import 'package:arias_tech_solutions_weather_task/features/location/data/place_repo.dart';
import 'package:arias_tech_solutions_weather_task/features/search/data/remote/auto_complete_list_model.dart';
import 'package:arias_tech_solutions_weather_task/features/search/presentation/cubit/search_field_cubit.dart';
import 'package:arias_tech_solutions_weather_task/features/search/presentation/cubit/search_field_states.dart';
import 'package:arias_tech_solutions_weather_task/features/weather/presentation/screens/weather_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../app_common/input_field.dart';

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
        ),

        BlocBuilder<SearchFieldCubit, SearchFieldStates>(
          builder: (context, state){
            if(state is IdleState){
              return const SizedBox.shrink();

            } else if (state is LoadingState) {
              return const SizedBox.shrink();

            } else if (state is InputFieldFocusedState){
              return Container(
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                padding: const EdgeInsets.symmetric(horizontal: 24),

                decoration: CustomDecoration(
                  backgroundColor: Colors.white,
                  radius: 24,
                ),

                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.recentSearches.length,
                  itemBuilder: (context, index){
                    return Row(
                      children: [
                        TextView(state.recentSearches[index]),
                      ],
                    );
                  }
                ),
              );

            } else if (state is InputFieldTypingState){
              List<Predictions> data = state.autoCompleteList;

              return Container(
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                padding: const EdgeInsets.symmetric(horizontal: 24),

                decoration: CustomDecoration(
                  backgroundColor: Colors.white,
                  radius: 24,
                ),

                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: SvgPicture.asset('assets/icons/send.svg'),
                      title: TextView(
                        data[index].format?.mainText ?? data[index].description!,
                        maxLines: 1,
                      ),
                      subtitle: TextView(
                        data[index].format?.secondaryText ?? "",
                        color: Colors.grey, maxLines: 1,
                      ),
                      onTap: () async {

                        PlaceModel place = await PlaceRepo().getLatLongByPlaceId(data[index].placeId!);

                        LatLong latLong = place.results!.first.geometry!.latLong!;

                        if(context.mounted){
                          AppRouter.navigateTo(context,
                              WeatherInfoPage(
                                cityName: data[index].description!,
                                latLong: latLong,
                                //cityName: data[index].format?.mainText,
                              ),

                            replace: searchFieldInWeatherPage,
                          );
                        }

                      }

                    );
                  }
                ),
              );
            }

            return const SizedBox.shrink();
          }
        )
      ],
    );
  }
}
