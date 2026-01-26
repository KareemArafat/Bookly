part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchFailure extends SearchState {
  final String errMess;
  SearchFailure({required this.errMess});
}

final class SearchSuccess extends SearchState {
  final List<BookModel> books;
  SearchSuccess({required this.books});
}
