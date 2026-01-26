import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utilities/api.dart';
import 'package:bookly_app/features/books_details/data/repos/books_details_repo.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class BooksDetailsRepoImp implements BooksDetailsRepo {
  final Api api;
  BooksDetailsRepoImp(this.api);

  @override
  Future<Either<Failure, List<BookModel>>> getSimilarBooks({
    required String category,
    int index = 0,
  }) async {
    try {
      var data = await api.get(
        endPoint:
            'volumes?Filtering=free&Sorting=relevance&q=subject:$category&startIndex=${index * 10}',
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
