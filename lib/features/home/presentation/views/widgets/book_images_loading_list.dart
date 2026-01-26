import 'package:bookly_app/core/utilities/app_consts.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BookImagesLoadingList extends StatelessWidget {
  const BookImagesLoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: const ShimmerEffect(
        baseColor: kLoading,
        highlightColor: Colors.grey,
      ),
      ignorePointers: false,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: dummyBookImage(),
          );
        },
      ),
    );
  }
}

Widget dummyBookImage() {
  return Skeleton.leaf(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: AspectRatio(
        aspectRatio: 3 / 5,
        child: Container(color: Colors.white),
      ),
    ),
  );
}
