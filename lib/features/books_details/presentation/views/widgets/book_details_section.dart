import 'package:bookly_app/core/utilities/app_styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/books_details/presentation/views/widgets/buy_button.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_images_item.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .25,
            ),
            child: BookImagesItem(bookModel: bookModel, clickable: false),
          ),
          SizedBox(height: 30),
          Text(
            bookModel.volumeInfo.title,
            style: AppStyles.textStyle25,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            bookModel.volumeInfo.authors?[0] ?? 'Un Known',
            style: AppStyles.textStyle20,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          BookRating(
            rating: bookModel.volumeInfo.averageRating ?? 00,
            count: bookModel.volumeInfo.ratingsCount ?? 00,
          ),
          SizedBox(height: 20),
          BuyButton(bookModel: bookModel),
        ],
      ),
    );
  }
}
