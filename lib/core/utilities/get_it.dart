import 'package:bookly_app/core/utilities/api.dart';
import 'package:bookly_app/features/books_details/data/repos/books_details_repo.dart';
import 'package:bookly_app/features/books_details/data/repos/books_details_repo_imp.dart';
import 'package:bookly_app/features/fav_books/data/repos/fav_repo.dart';
import 'package:bookly_app/features/fav_books/data/repos/fav_repo_imp.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:bookly_app/features/search/data/repos/search_repo_imp.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<Api>(Api(Dio()));
  getIt.registerSingleton<HomeRepo>(HomeRepoImp(getIt<Api>()));
  getIt.registerSingleton<BooksDetailsRepo>(BooksDetailsRepoImp(getIt<Api>()));
  getIt.registerSingleton<SearchRepo>(SearchRepoImp(getIt<Api>()));
  getIt.registerSingleton<FavRepo>(FavRepoImp());
}
