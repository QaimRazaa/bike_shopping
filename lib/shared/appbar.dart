import 'package:bike_shopping/utils/constants/colors.dart';
import 'package:bike_shopping/utils/constants/images.dart';
import 'package:bike_shopping/utils/helpers/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tabbar_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onSearchTap;
  final VoidCallback? onBackTap;
  final bool showBack;
  final bool showCart;
  final bool useTabBarProvider; // New parameter
  final ValueChanged<bool>? onExpandChanged; // New parameter

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onSearchTap,
    this.onBackTap,
    this.showBack = false,
    this.showCart = false,
    this.useTabBarProvider = false,
    this.onExpandChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.darkGrey,
      elevation: 0,
      centerTitle: true,
      leading: _buildLeading(context),
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

  Widget? _buildLeading(BuildContext context) {
    if (!showBack) return null;

    // If using TabBarProvider, show dynamic icon based on expansion state
    if (useTabBarProvider) {
      return Consumer<TabBarProvider>(
        builder: (context, provider, _) {
          return GestureDetector(
            onTap: () {
              if (provider.isExpanded) {
                // Close the tab bar
                provider.collapseTabBar(onExpandChanged);
              } else {
                // Normal back navigation
                if (onBackTap != null) {
                  onBackTap!();
                } else {
                  Navigator.pop(context);
                }
              }
            },
            child: Padding(
              padding: EdgeInsets.only(left: AppSizes.width(3)),
              child: Image.asset(
                provider.isExpanded ? AppImages.downIcon : AppImages.backIcon,
                fit: BoxFit.contain,
                height: AppSizes.height(4),
              ),
            ),
          );
        },
      );
    }

    // Default back button
    return GestureDetector(
      onTap: () {
        if (onBackTap != null) {
          onBackTap!();
        } else {
          Navigator.pop(context);
        }
      },
      child: Padding(
        padding: EdgeInsets.only(left: AppSizes.width(3)),
        child: Image.asset(
          AppImages.backIcon,
          fit: BoxFit.contain,
          height: AppSizes.height(4),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSizes.height(7));
}