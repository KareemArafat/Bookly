import 'package:bookly_app/core/utilities/app_styles.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_result_list.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_screen_app_bar.dart';
import 'package:flutter/material.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchScreenAppBar(),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text('Search Results', style: AppStyles.textStyle18),
        ),
        SizedBox(height: 10),
        Expanded(child: SearchResultList()),
      ],
    );
  }
}
