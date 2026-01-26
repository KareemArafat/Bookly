import 'package:bookly_app/core/utilities/app_styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMess, this.onPressed});
  final String errMess;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            errMess,
            style: AppStyles.textStyle14,
            textAlign: TextAlign.center,
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.refresh, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
