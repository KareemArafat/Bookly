import 'package:bookly_app/features/fav_books/presentation/manager/show_fav_books_cubit/show_fav_books_cubit.dart';
import 'package:bookly_app/features/fav_books/presentation/views/widgets/fav_books_app_bar.dart';
import 'package:bookly_app/features/fav_books/presentation/views/widgets/fav_books_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavBooksScreenBody extends StatefulWidget {
  const FavBooksScreenBody({super.key});

  @override
  State<FavBooksScreenBody> createState() => _FavBooksScreenBodyState();
}

class _FavBooksScreenBodyState extends State<FavBooksScreenBody> {
  @override
  void initState() {
    context.read<ShowFavBooksCubit>().showFavBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FavBooksAppBar(),
        SizedBox(height: 20),
        Expanded(child: FavBooksList()),
      ],
    );
  }
}
