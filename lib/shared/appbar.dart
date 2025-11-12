import 'package:bike_shopping/utils/constants/colors.dart';
import 'package:bike_shopping/utils/constants/images.dart';
import 'package:bike_shopping/utils/helpers/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onSearchTap;
  final VoidCallback? onBackTap;

  final bool showBack;
  final bool showCart;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onSearchTap,
    this.onBackTap,
    this.showBack = false,
    this.showCart = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.darkGrey,
      elevation: 0,
      centerTitle: true,

      leading: showBack
          ? GestureDetector(
        onTap: (){Navigator.pop(context);},
        child: Padding(
          padding: EdgeInsets.only(left: AppSizes.width(3)),
          child: Image.asset(
            AppImages.backIcon,
            fit: BoxFit.contain,
            height: AppSizes.height(4),
          ),
        ),
      )
          : null,

      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: AppSizes.responsiveFont(2.5),
          fontWeight: FontWeight.w600,
        ),
      ),

      actions: showCart
          ? [
        Padding(
          padding: EdgeInsets.only(right: AppSizes.width(4)),
          child: GestureDetector(
            onTap: onSearchTap,
            child: Image.asset(
              AppImages.cartButton,
              fit: BoxFit.contain,
              height: AppSizes.height(4.5),
            ),
          ),
        ),
      ]
          : [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSizes.height(7));
}
