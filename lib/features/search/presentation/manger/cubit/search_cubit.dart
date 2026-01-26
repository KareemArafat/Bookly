import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;

  bookSearch({required String bookName}) async {
    emit(SearchLoading());
    var result = await searchRepo.bookSearch(bookName: bookName);
    result.fold(
      (failure) {
        emit(SearchFailure(errMess: failure.errMessage));
      },
      (books) {
        emit(SearchSuccess(books: books));
      },
    );
  }
}
