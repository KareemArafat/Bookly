import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class BooksDetailsRepo {
  Future<Either<Failure, List<BookModel>>> getSimilarBooks({
    required String category,
    int index = 0,
  });
}
