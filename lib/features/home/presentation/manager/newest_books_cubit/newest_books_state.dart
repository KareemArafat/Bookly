part of 'newest_books_cubit.dart';

@immutable
sealed class NewestBooksState {}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBooksLoading extends NewestBooksState {}

final class NewestBooksFailure extends NewestBooksState {
  final String errMess;
  NewestBooksFailure({required this.errMess});
}

final class NewestBooksSuccess extends NewestBooksState {
  final List<BookModel> books;
  NewestBooksSuccess({required this.books});
}

final class NewestBooksPaginationLoading extends NewestBooksState {}

final class NewestBooksPaginationFailure extends NewestBooksState {
  final String errMess;
  NewestBooksPaginationFailure({required this.errMess});
}
