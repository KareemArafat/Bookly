import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookImagesItem extends StatelessWidget {
  const BookImagesItem({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () =>
              GoRouter.of(context).push('/bookDetailsScreen', extra: bookModel),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: AspectRatio(
          aspectRatio: 3 / 5,
          child: CachedNetworkImage(
            imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
            fit: BoxFit.fill,
            errorWidget:
                (context, url, error) => Container(
                  color: Colors.grey,
                  child: Icon(Icons.image_not_supported_outlined),
                ),
          ),
        ),
      ),
    );
  }
}
