import 'package:bike_shopping/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../../utils/helpers/app_sizes.dart';

class GradientTextFieldWithButton extends StatelessWidget {
  const GradientTextFieldWithButton({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: AppSizes.paddingAll(3),
      child: Container(
        height: AppSizes.height(6),
        decoration: BoxDecoration(
          color: const Color(0xFF222939),
          borderRadius: AppSizes.borderRadius(3.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: AppSizes.width(2),
              offset: Offset(0, AppSizes.height(0.3)),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: AppSizes.paddingSymmetric(horizontal: 4),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppSizes.font(2.2),
                  ),
                  decoration: InputDecoration(
                    hintText: 'Enter voucher',
                    hintStyle: TextStyle(
                      color: Colors.white54,
                      fontSize: AppSizes.font(1.5),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              height: double.infinity,
              width: AppSizes.width(32),
              decoration: BoxDecoration(
                gradient: AppColors.applyGradient,
                borderRadius: AppSizes.borderRadius(3.5),
              ),
              child: Center(
                child: Text(
                  "Apply",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: AppSizes.font(2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
