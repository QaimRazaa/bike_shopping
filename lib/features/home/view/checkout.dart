import 'package:bike_shopping/shared/appbar.dart';
import 'package:bike_shopping/utils/constants/colors.dart';
import 'package:bike_shopping/utils/constants/images.dart';
import 'package:bike_shopping/utils/helpers/app_sizes.dart';
import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Check out',showBack: true,),
      backgroundColor: AppColors.darkGrey,
      body: Padding(
        padding: AppSizes.paddingSymmetric(horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: AppSizes.height(2)),

            Stack(
              children: [
                Center(child: Image(image: AssetImage(AppImages.checkout))),

                Positioned(
                  top: AppSizes.height(2),
                  left: AppSizes.width(6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shipping',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: AppSizes.font(2.2),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: AppSizes.height(0.5)),
                      Text(
                        'Address',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: AppSizes.font(1.8),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}