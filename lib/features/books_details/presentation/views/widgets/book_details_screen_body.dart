import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/books_details/presentation/views/widgets/book_details_app_bar.dart';
import 'package:bookly_app/features/books_details/presentation/views/widgets/book_details_section.dart';
import 'package:bookly_app/features/books_details/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsScreenBody extends StatelessWidget {
  const BookDetailsScreenBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              BookDetailsAppBar(bookModel: bookModel),
              SizedBox(height: 20),
              BookDetailsSection(bookModel: bookModel),
              SizedBox(height: 40),
              Spacer(),
              SimilarBooksSection(
                category: bookModel.volumeInfo.categories?[0] ?? '',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
