import 'package:bookly_app/core/utilities/app_consts.dart';
import 'package:bookly_app/core/utilities/app_styles.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_list.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_images_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  late ScrollController _scrollController;
  int index = 1;
  bool isLoading = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(paginationCheck);
    super.initState();
  }

  Future<void> paginationCheck() async {
    var currentIndex = _scrollController.position.pixels;
    var maxIndex = _scrollController.position.maxScrollExtent;
    if (currentIndex >= 0.7 * maxIndex && initLoading == false) {
      if (isLoading) return;
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<NewestBooksCubit>(
          context,
        ).getNewestBooks(index: index++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppBar(),
              BookImagesList(),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text('Newest Books', style: AppStyles.textStyle18),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        NewestBooksList(),
      ],
    );
  }
}
