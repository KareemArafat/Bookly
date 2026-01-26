import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_book_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_loading_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksList extends StatefulWidget {
  const NewestBooksList({super.key});

  @override
  State<NewestBooksList> createState() => _NewestBooksListState();
}

class _NewestBooksListState extends State<NewestBooksList> {
  final List<BookModel> booksList = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          booksList.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess ||
            state is NewestBooksPaginationLoading ||
            state is NewestBooksPaginationFailure) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return NewestBookItem(bookModel: booksList[index]);
            }, childCount: booksList.length),
          );
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 150),
              child: CustomErrorWidget(
                errMess: state.errMess,
                onPressed: () =>
                    BlocProvider.of<NewestBooksCubit>(context).getNewestBooks(),
              ),
            ),
          );
        } else {
          return NewestBooksLoadingList();
        }
      },
    );
  }
}
