part of 'show_fav_books_cubit.dart';

sealed class ShowFavBooksState {}

final class ShowFavBooksInitial extends ShowFavBooksState {}

final class ShowFavBooksSuccess extends ShowFavBooksState {
  final List<BookModel> books;
  ShowFavBooksSuccess({required this.books});
}
