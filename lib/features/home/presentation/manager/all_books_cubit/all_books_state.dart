part of 'all_books_cubit.dart';

@immutable
sealed class AllBooksState {}

final class AllBooksInitial extends AllBooksState {}

final class AllBooksLoading extends AllBooksState {}

final class AllBooksFailure extends AllBooksState {
  final String errMess;
  AllBooksFailure({required this.errMess});
}

final class AllBooksSuccess extends AllBooksState {
  final List<BookModel> books;
  AllBooksSuccess({required this.books});
}

final class AllBooksPaginationLoading extends AllBooksState {}


final class AllBooksPaginationFailure extends AllBooksState {
  final String errMess;
  AllBooksPaginationFailure({required this.errMess});
}

