import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';

abstract class FavRepo {
  Future<void> addFavBook({required BookModel book});

  Future<void> delFavBook({required BookModel book});

  Future<List<BookModel>> showFavBooks();
}
