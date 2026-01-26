import 'package:bookly_app/core/widgets/custom_gradient_scaffold.dart';
import 'package:bookly_app/features/fav_books/presentation/views/widgets/fav_books_screen_body.dart';
import 'package:flutter/material.dart';

class FavBooksScreen extends StatelessWidget {
  const FavBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGradientScaffold(body: FavBooksScreenBody());
  }
}
