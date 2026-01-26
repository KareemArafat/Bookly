import 'package:bookly_app/features/books_details/data/repos/books_details_repo.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this._detailsRepo) : super(SimilarBooksInitial());
  final BooksDetailsRepo _detailsRepo;

  Future<void> getSimilarBooks({
    required String category,
    int index = 0,
  }) async {
    if (index > 0) {
      emit(SimilarBooksPaginationLoading());
    } else {
      emit(SimilarBooksLoading());
    }

    var result = await _detailsRepo.getSimilarBooks(
      category: category,
      index: index,
    );
    if (!isClosed) {
      result.fold(
        (l) => index > 0
            ? emit(SimilarBooksPaginationFailure(errMess: l.errMessage))
            : emit(SimilarBooksFailure(errMess: l.errMessage)),
        (r) => emit(SimilarBooksSuccess(books: r)),
      );
    }
  }
}
