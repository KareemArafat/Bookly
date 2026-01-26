import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utilities/api.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImp implements HomeRepo {
  final Api api;

  HomeRepoImp(this.api);
  @override
  Future<Either<Failure, List<BookModel>>> getAllBooks({int index = 0}) async {
    try {
      var data = await api.get(
        endPoint:
            'volumes?q=trending&orderBy=relevance&startIndex=${index * 10}',
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

  @override
  Future<Either<Failure, List<BookModel>>> getNewestBooks({
    int index = 0,
  }) async {
    try {
      var data = await api.get(
        endPoint:
            'volumes?Filtering=free&Sorting=newest&q=hot&startIndex=${index * 10}',
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
