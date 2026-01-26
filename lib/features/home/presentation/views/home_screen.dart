import 'package:bookly_app/core/widgets/custom_gradient_scaffold.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/home_screen_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGradientScaffold(body: SafeArea(child: HomeScreenBody()));
  }
}
