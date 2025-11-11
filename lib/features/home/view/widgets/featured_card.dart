import 'package:bike_shopping/utils/constants/images.dart';
import 'package:flutter/material.dart';

class FeaturedCard extends StatelessWidget {
  final String discountText;
  final VoidCallback onTap;

  const FeaturedCard({
    Key? key,
    required this.discountText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF2a5470),
              const Color(0xFF1e3d52),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            // Bike Icon
            Center(child: Image(image: AssetImage(AppImages.cycle))),
            // Discount Text
            Positioned(
              left: 20,
              bottom: 20,
              child: Text(
                discountText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}