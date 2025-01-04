import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../app_common/input_field.dart';

class SearchInputField extends StatelessWidget {
  const SearchInputField({super.key});

  static final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InputField(
      controller: searchController,
      hint: 'Search by city name',
      filled: true,
      prefixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset('assets/icons/search.svg',),
      ),
    );
  }
}
