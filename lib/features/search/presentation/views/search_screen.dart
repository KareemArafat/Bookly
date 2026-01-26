import 'package:bookly_app/core/widgets/custom_gradient_scaffold.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_screen_body.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGradientScaffold(body: SearchScreenBody());
  }
}
