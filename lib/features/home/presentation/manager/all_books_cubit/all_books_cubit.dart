import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'all_books_state.dart';

class AllBooksCubit extends Cubit<AllBooksState> {
  AllBooksCubit(this.homeRepo) : super(AllBooksInitial());

  final HomeRepo homeRepo;

  getAllBooks({int index = 0}) async {
    if (index > 0) {
      emit(AllBooksPaginationLoading());
    } else {
      emit(AllBooksLoading());
    }
    var result = await homeRepo.getAllBooks(index: index);
    result.fold(
      (failure) {
        if (index > 0) {
          emit(AllBooksPaginationFailure(errMess: failure.errMessage));
        } else {
          emit(AllBooksFailure(errMess: failure.errMessage));
        }
      },
      (books) {
        emit(AllBooksSuccess(books: books));
      },
    );
  }
}
