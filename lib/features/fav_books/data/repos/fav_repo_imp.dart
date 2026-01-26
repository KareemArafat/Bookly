import 'package:bookly_app/core/utilities/app_consts.dart';
import 'package:bookly_app/features/fav_books/data/repos/fav_repo.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavRepoImp implements FavRepo {
  @override
  Future<void> addFavBook({required BookModel book}) async {
    var box = Hive.box<BookModel>(kFavBooks);
    await box.put(book.id, book);
  }

  @override
  Future<void> delFavBook({required BookModel book}) async {
    var box = await Hive.openBox<BookModel>(kFavBooks);
    await box.delete(book.id);
  }

  @override
  Future<List<BookModel>> showFavBooks() async {
    var box = await Hive.openBox<BookModel>(kFavBooks);
    List<BookModel> booksList = box.values.toList();
    return booksList;
  }
}
