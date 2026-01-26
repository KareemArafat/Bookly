import 'package:bookly_app/features/fav_books/presentation/manager/show_fav_books_cubit/show_fav_books_cubit.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavBooksList extends StatelessWidget {
  const FavBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowFavBooksCubit, ShowFavBooksState>(
      builder: (context, state) {
        List<BookModel> books =
            BlocProvider.of<ShowFavBooksCubit>(context).books;
        return ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            return NewestBookItem(bookModel: books[index]);
          },
        );
      },
    );
  }
}
