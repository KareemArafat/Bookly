import 'package:bookly_app/core/utilities/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backGroundColor,
    required this.text,
    this.borderRadius,
    this.size,
    this.textColor,
    this.tap,
    this.icon,
  });

  final Color backGroundColor;
  final String text;
  final BorderRadius? borderRadius;
  final double? size;
  final Color? textColor;
  final void Function()? tap;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextButton(
        onPressed: tap,
        style: TextButton.styleFrom(
          backgroundColor: backGroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
          ),
        ),
        child: Row(
          children: [
            icon ?? SizedBox(),
            Text(
              text,
              style: AppStyles.textStyle16.copyWith(
                color: textColor,
                fontWeight: FontWeight.w900,
                fontSize: size,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
