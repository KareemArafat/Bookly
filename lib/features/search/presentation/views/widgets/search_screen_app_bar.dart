import 'package:bookly_app/features/search/presentation/views/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchScreenAppBar extends StatelessWidget {
  const SearchScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        Expanded(child: SearchField()),
      ],
    );
  }
}
