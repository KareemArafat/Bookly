import 'package:bookly_app/features/fav/data/repos/fav_repo.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fav_book_state.dart';

class FavBookCubit extends Cubit<FavBookState> {
  FavBookCubit(this._favRepo) : super(FavBookInitial());

  final FavRepo _favRepo;

  void addFavBook({required BookModel book}) {
    _favRepo.addFavBook(book: book);
    emit(AddFavBookSuccess());
  }

  delFavBook({required BookModel book}) {
    _favRepo.delFavBook(book: book);
    emit(DelFavBookSuccess());
  }

}
