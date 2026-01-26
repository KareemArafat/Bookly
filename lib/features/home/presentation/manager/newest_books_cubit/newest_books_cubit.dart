import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;

  getNewestBooks({int index = 0}) async {
    if (index > 0) {
      emit(NewestBooksPaginationLoading());
    } else {
      emit(NewestBooksLoading());
    }

    var result = await homeRepo.getNewestBooks(index: index);
    result.fold(
      (l) =>
          index > 0
              ? emit(NewestBooksPaginationFailure(errMess: l.errMessage))
              : emit(NewestBooksFailure(errMess: l.errMessage)),
      (r) => emit(NewestBooksSuccess(books: r)),
    );
  }
}
