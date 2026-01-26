import 'package:bookly_app/core/utilities/app_router.dart';
import 'package:bookly_app/core/utilities/cubit_observer.dart';
import 'package:bookly_app/core/utilities/functions.dart';
import 'package:bookly_app/core/utilities/get_it.dart';
import 'package:bookly_app/features/fav_books/data/repos/fav_repo.dart';
import 'package:bookly_app/features/fav_books/presentation/manager/show_fav_books_cubit/show_fav_books_cubit.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:bookly_app/features/home/presentation/manager/all_books_cubit/all_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  setupGetIt();
  await setUpHive();
  Bloc.observer = CubitObserver();
  runApp(BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllBooksCubit(getIt<HomeRepo>())..getAllBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt<HomeRepo>())..getNewestBooks(),
        ),
        BlocProvider(create: (context) => ShowFavBooksCubit(getIt<FavRepo>())),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme.apply(bodyColor: Colors.white),
          ),
          colorScheme: ColorScheme.dark(),
        ),
      ),
    );
  }
}
