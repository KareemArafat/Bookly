import 'package:bookly_app/features/fav_books/data/repos/fav_repo.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'show_fav_books_state.dart';

class ShowFavBooksCubit extends Cubit<ShowFavBooksState> {
  ShowFavBooksCubit(this._favRepo) : super(ShowFavBooksInitial());

  final FavRepo _favRepo;

  List<BookModel> books = [];

  void showFavBooks() async {
    books = await _favRepo.showFavBooks();
    emit(ShowFavBooksSuccess(books: books));
  }
}
