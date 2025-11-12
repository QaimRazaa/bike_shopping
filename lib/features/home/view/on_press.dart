import 'package:bike_shopping/features/home/view/product_page.dart';
import 'package:bike_shopping/shared/appbar.dart';
import 'package:bike_shopping/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class OnPressScreen extends StatefulWidget {
  const OnPressScreen({super.key});

  @override
  State<OnPressScreen> createState() => _OnPressScreenState();
}

class _OnPressScreenState extends State<OnPressScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            const ProductPage(),
            transitionDuration: const Duration(seconds: 1),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              var curvedAnimation = CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              );

              return FadeTransition(
                opacity: curvedAnimation,
                child: child,
              );
            },
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'PEUGEOT - LR01',
        showBack: true,
      ),
      backgroundColor: AppColors.darkGrey,
    );
  }
}