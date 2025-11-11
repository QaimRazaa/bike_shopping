import 'package:bike_shopping/utils/constants/colors.dart';
import 'package:bike_shopping/utils/constants/images.dart';
import 'package:bike_shopping/utils/helpers/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onSearchTap;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onSearchTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AppBar(
      backgroundColor: AppColors.darkGrey,
      elevation: 0,
      centerTitle: false,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: AppSizes.responsiveFont(2.5),
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: AppSizes.width(4)),
          height: AppSizes.height(5),
          width: AppSizes.height(5),
          child: GestureDetector(
            onTap: onSearchTap,
            child: Image.asset(AppImages.cartButton, fit: BoxFit.contain),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSizes.height(7));
}
