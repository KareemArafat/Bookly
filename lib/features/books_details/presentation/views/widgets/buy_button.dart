import 'package:bookly_app/core/utilities/assets.dart';
import 'package:bookly_app/core/utilities/functions.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BuyButton extends StatelessWidget {
  const BuyButton({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          tap: () => openUrl(bookUrl: bookModel.volumeInfo.infoLink!),
          backGroundColor: Colors.white,
          icon: Image.asset(Assets.googlePlayIcon, height: 20),
          text: ' DownLoad',
          textColor: Colors.black,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        CustomButton(
          tap: () => openUrl(bookUrl: bookModel.volumeInfo.previewLink!),
          backGroundColor: Colors.green,
          text: 'Free Preview',
          textColor: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
      ],
    );
  }
}
