import 'package:bookly_app/core/utilities/api.dart';
import 'package:bookly_app/features/details/data/repos/details_repo_imp.dart';
import 'package:bookly_app/features/home/data/repos/home_implement.dart';
import 'package:bookly_app/features/search/data/repos/search_implement.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<Api>(Api(Dio()));
  getIt.registerSingleton<HomeImplement>(HomeImplement(getIt.get<Api>()));
  getIt.registerSingleton<DetailsRepoImp>(DetailsRepoImp(getIt.get<Api>()));
  getIt.registerSingleton<SearchImplement>(SearchImplement(getIt.get<Api>()));
}
