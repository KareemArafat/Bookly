import 'package:bookly_app/core/utilities/app_router.dart';
import 'package:bookly_app/core/utilities/app_styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_images_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewestBookItem extends StatelessWidget {
  const NewestBookItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => GoRouter.of(
            context,
          ).push(AppRouter.kBookDetailsScreen, extra: bookModel),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        child: SizedBox(
          height: 125,
          child: Row(
            children: [
              BookImagesItem(bookModel: bookModel),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bookModel.volumeInfo.title,
                      style: AppStyles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 3),
                    Text(
                      bookModel.volumeInfo.authors?[0] ?? 'Un Known',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.textStyle16,
                    ),
                    SizedBox(height: 3),
                    Row(
                      children: [
                        Text('Free', style: AppStyles.textStyle18),
                        Spacer(),
                        BookRating(
                          rating: bookModel.volumeInfo.averageRating ?? 00,
                          count: bookModel.volumeInfo.ratingsCount ?? 00,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
