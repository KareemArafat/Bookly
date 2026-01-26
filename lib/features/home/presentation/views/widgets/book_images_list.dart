import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/manager/all_books_cubit/all_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_images_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_images_loading_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookImagesList extends StatefulWidget {
  const BookImagesList({super.key});

  @override
  State<BookImagesList> createState() => _BookImagesListState();
}

class _BookImagesListState extends State<BookImagesList> {
  late ScrollController _scrollController;
  var index = 1;
  bool isLoading = false;
  List<BookModel> booksList = [];

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
        await BlocProvider.of<AllBooksCubit>(
          context,
        ).getAllBooks(index: index++);
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
      height: MediaQuery.of(context).size.height * .25,
      child: BlocConsumer<AllBooksCubit, AllBooksState>(
        listener: (context, state) {
          if (state is AllBooksSuccess) {
            booksList.addAll(state.books);
          }
        },
        builder: (context, state) {
          if (state is AllBooksSuccess ||
              state is AllBooksPaginationLoading ||
              state is AllBooksPaginationFailure) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: booksList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: BookImagesItem(bookModel: booksList[index]),
                );
              },
            );
          } else if (state is AllBooksFailure) {
            return CustomErrorWidget(
              errMess: state.errMess,
              onPressed: () =>
                  BlocProvider.of<AllBooksCubit>(context).getAllBooks(),
            );
          } else {
            return BookImagesLoadingList();
          }
        },
      ),
    );
  }
}
