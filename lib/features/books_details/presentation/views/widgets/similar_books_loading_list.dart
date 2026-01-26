import 'package:bookly_app/core/utilities/app_consts.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_images_loading_list.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SimilarBooksLoadingList extends StatelessWidget {
  const SimilarBooksLoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: const ShimmerEffect(
        baseColor: kLoading,
        highlightColor: Colors.grey,
      ),
      ignorePointers: false,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: dummyBookImage(),
          );
        },
      ),
    );
  }
}
