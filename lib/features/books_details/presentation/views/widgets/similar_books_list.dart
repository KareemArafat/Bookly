import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/books_details/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_images_item.dart';
import 'package:bookly_app/features/books_details/presentation/views/widgets/similar_books_loading_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksList extends StatefulWidget {
  const SimilarBooksList({super.key, required this.category});
  final String category;

  @override
  State<SimilarBooksList> createState() => _SimilarBooksListState();
}

class _SimilarBooksListState extends State<SimilarBooksList> {
  late ScrollController _scrollController;
  var index = 1;
  bool isLoading = false;
  final List<BookModel> booksList = [];

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(paginationCheck);
    super.initState();
  }

  void paginationCheck() async {
    var currentIndex = _scrollController.position.pixels;
    var maxIndex = _scrollController.position.maxScrollExtent;
    if (currentIndex >= 0.7 * maxIndex) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<SimilarBooksCubit>(
          context,
        ).getSimilarBooks(category: widget.category, index: index++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: BlocConsumer<SimilarBooksCubit, SimilarBooksState>(
        listener: (context, state) {
          if (state is SimilarBooksSuccess) {
            booksList.addAll(state.books);
          }
        },
        builder: (context, state) {
          if (state is SimilarBooksSuccess ||
              state is SimilarBooksPaginationLoading ||
              state is SimilarBooksPaginationFailure) {
            return ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: booksList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: BookImagesItem(bookModel: booksList[index]),
                );
              },
            );
          } else if (state is SimilarBooksFailure) {
            return CustomErrorWidget(
              errMess: state.errMess,
              onPressed: () => BlocProvider.of<SimilarBooksCubit>(
                context,
              ).getSimilarBooks(category: widget.category),
            );
          } else {
            return SimilarBooksLoadingList();
          }
        },
      ),
    );
  }
}
