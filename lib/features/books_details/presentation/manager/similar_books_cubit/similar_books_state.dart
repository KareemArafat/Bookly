part of 'similar_books_cubit.dart';

sealed class SimilarBooksState {}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksLoading extends SimilarBooksState {}

final class SimilarBooksFailure extends SimilarBooksState {
  final String errMess;
  SimilarBooksFailure({required this.errMess});
}

final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> books;
  SimilarBooksSuccess({required this.books});
}

final class SimilarBooksPaginationLoading extends SimilarBooksState {}

final class SimilarBooksPaginationFailure extends SimilarBooksState {
  final String errMess;
  SimilarBooksPaginationFailure({required this.errMess});
}
