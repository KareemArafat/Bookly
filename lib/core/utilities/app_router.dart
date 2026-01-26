import 'package:bookly_app/core/utilities/get_it.dart';
import 'package:bookly_app/features/books_details/data/repos/books_details_repo.dart';
import 'package:bookly_app/features/fav_books/data/repos/fav_repo.dart';
import 'package:bookly_app/features/fav_books/presentation/manager/fav_books_cubit/fav_books_cubit.dart';
import 'package:bookly_app/features/fav_books/presentation/views/fav_books_screen.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/books_details/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/books_details/presentation/views/book_details_screen.dart';
import 'package:bookly_app/features/home/presentation/views/home_screen.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:bookly_app/features/search/presentation/manger/cubit/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/search_screen.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeScreen = '/homeScreen';
  static const kBookDetailsScreen = '/bookDetailsScreen';
  static const kSearchScreen = '/searchScreen';
  static const kFavScreen = '/favScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),

      GoRoute(path: kHomeScreen, builder: (context, state) => HomeScreen()),

      GoRoute(
        path: kBookDetailsScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SimilarBooksCubit(getIt<BooksDetailsRepo>()),
            ),
            BlocProvider(create: (context) => FavBookCubit(getIt<FavRepo>())),
          ],
          child: BookDetailsScreen(bookModel: state.extra as BookModel),
        ),
      ),

      GoRoute(
        path: kSearchScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(getIt<SearchRepo>()),
          child: SearchScreen(),
        ),
      ),

      GoRoute(path: kFavScreen, builder: (context, state) => FavBooksScreen()),
    ],
  );
}
