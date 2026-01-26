part of 'fav_books_cubit.dart';

sealed class FavBookState {}

final class FavBookInitial extends FavBookState {}

final class AddFavBookSuccess extends FavBookState {}

final class DelFavBookSuccess extends FavBookState {}


// bool isFav(BookModel bookModel) {
//   final box = Hive.box<BookModel>(kFavBooks);
//   if (box.containsKey(bookModel.id)) {
//     return true;
//   } else {
//     return false;
//   }
// }
