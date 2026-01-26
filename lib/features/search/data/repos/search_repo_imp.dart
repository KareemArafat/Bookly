import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utilities/api.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImp implements SearchRepo {
  final Api api;

  SearchRepoImp(this.api);
  @override
  Future<Either<Failure, List<BookModel>>> bookSearch({
    required String bookName,
  }) async {
    try {
      var data = await api.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=$bookName',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.from(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
