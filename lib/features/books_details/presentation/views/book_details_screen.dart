import 'package:bookly_app/core/widgets/custom_gradient_scaffold.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/books_details/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/books_details/presentation/views/widgets/book_details_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).getSimilarBooks(
      category: widget.bookModel.volumeInfo.categories?[0] ?? '',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomGradientScaffold(
      body: BookDetailsScreenBody(bookModel: widget.bookModel),
    );
  }
}
