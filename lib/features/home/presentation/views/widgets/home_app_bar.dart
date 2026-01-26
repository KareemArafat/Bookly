import 'package:bookly_app/core/utilities/app_router.dart';
import 'package:bookly_app/core/utilities/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 12),
      child: Row(
        children: [
          Image.asset(Assets.logo, height: 30),
          Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kSearchScreen);
            },
            icon: Icon(FontAwesomeIcons.magnifyingGlass),
          ),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kFavScreen);
            },
            icon: Icon(Icons.favorite, size: 30),
          ),
        ],
      ),
    );
  }
}
