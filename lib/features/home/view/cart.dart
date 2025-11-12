import 'package:bike_shopping/core/routes/routes.dart';
import 'package:bike_shopping/shared/appbar.dart';
import 'package:bike_shopping/shared/text_field.dart';
import 'package:bike_shopping/utils/constants/colors.dart';
import 'package:bike_shopping/utils/constants/images.dart';
import 'package:bike_shopping/utils/helpers/app_sizes.dart';
import 'package:flutter/material.dart';

import '../../../shared/row.dart';
import '../../../shared/slider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'My Shopping Cart', showBack: true),
      backgroundColor: AppColors.darkGrey,
      body: Column(
        children: [
          SizedBox(height: AppSizes.height(3)),
          Image(image: AssetImage(AppImages.cartItems)),
          GradientTextFieldWithButton(),
          SizedBox(height: AppSizes.height(3)),
          Text(
            'Your bag qualifies for free shipping',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: AppSizes.font(1.6),
              color: Colors.white.withOpacity(.6),
            ),
          ),
          SizedBox(height: AppSizes.height(3)),
          LabelValueRow(label: 'Subtotal', value: '\$1,999.99'),
          LabelValueRow(label: 'Delivery Fee:', value: '\$25.00'),
          LabelValueRow(label: 'Discount:', value: '\$25.00'),
          SizedBox(height: AppSizes.height(2)),
          LabelValueRow(
            label: 'Total:',
            value: '\$1,999.99',
            valueColor: AppColors.primary,
            valueWeight: FontWeight.w700,
            labelWeight: FontWeight.w700,
            fontPercent: 2,
          ),
          SizedBox(height: AppSizes.height(5)),
          SlideToCheckout(onSlideComplete: (){Navigator.pushNamed(context, AppRoutes.checkout);})


        ],
      ),
    );
  }
}
