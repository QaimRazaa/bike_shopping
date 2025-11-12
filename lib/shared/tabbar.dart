import 'package:bike_shopping/core/routes/routes.dart';
import 'package:bike_shopping/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/tabbar_provider.dart';
import '../utils/constants/colors.dart';
import '../utils/helpers/app_sizes.dart';

class TabBarWidget extends StatelessWidget {
  final ValueChanged<bool>? onExpandChanged;

  const TabBarWidget({Key? key, this.onExpandChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TabBarProvider>(
      builder: (context, provider, _) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: provider.getContainerHeight(
            AppSizes.height(50),
            AppSizes.height(14),
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.darkGrey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSizes.radius(10)),
              topRight: Radius.circular(AppSizes.radius(10)),
            ),
          ),
          child: Column(
            children: [
              _buildTabBar(context, provider),
              if (provider.isExpanded) _buildExpandedContent(provider),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabBar(BuildContext context, TabBarProvider provider) {
    return SizedBox(
      height: AppSizes.height(14),
      child: Row(
        children: [
          Expanded(
            child: _buildTab(context, provider, 'Description', 0),
          ),
          Expanded(
            child: _buildTab(context, provider, 'Specification', 1),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(
      BuildContext context,
      TabBarProvider provider,
      String title,
      int index,
      ) {
    final isSelected = provider.isTabSelected(index);

    return GestureDetector(
      onTap: () => provider.selectTab(index, onExpandChanged),
      child: AnimatedContainer(
        height: AppSizes.height(6.5),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: AppSizes.paddingAll(4.5),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff30384B) : Colors.transparent,
          borderRadius: BorderRadius.circular(AppSizes.radius(14)),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: AppSizes.width(2),
              offset: Offset(0, AppSizes.height(0.25)),
            ),
          ]
              : [],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected
                  ? AppColors.primary
                  : Colors.white.withOpacity(0.5),
              fontSize: AppSizes.font(1.9),
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedContent(TabBarProvider provider) {
    return Expanded(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: provider.getContentOpacity(),
        child: _buildDescriptionContent(),
      ),
    );
  }

  Widget _buildDescriptionContent() {
    return Stack(
      children: [
        DescriptionContent(),
        FixedBottomPrice(),
      ],
    );
  }

  Widget DescriptionContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: AppSizes.height(10)),
      child: Padding(
        padding: AppSizes.paddingOnly(left: 6, right: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PEUGEOT - LR01',
              style: TextStyle(
                color: Colors.white,
                fontSize: AppSizes.font(2.3),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppSizes.height(1)),
            Text(
              'The LR01 uses the same design as the most iconic bikes from PEUGEOT Cycles\' 130-year history and combines it with agile, dynamic performance that\'s perfectly suited to navigating today\'s cities. As well as a lugged steel frame and iconic PEUGEOT black-and-white chequer design, this city bike also features a 16-speed Shimano Claris drivetrain.',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontWeight: FontWeight.w300,
                fontSize: AppSizes.font(1.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget FixedBottomPrice() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Builder(
        builder: (context) => Container(
          height: AppSizes.height(12),
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xff262E3D),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSizes.radius(12.5)),
              topRight: Radius.circular(AppSizes.radius(12.5)),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: AppSizes.width(2.5),
                offset: Offset(0, -AppSizes.height(0.25)),
              ),
            ],
          ),
          padding: AppSizes.paddingSymmetric(horizontal: 6, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '\$ 1,999.99',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: AppSizes.font(2.5),
                  fontWeight: FontWeight.w400,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.cartScreen);
                },
                child: Image(
                  image: AssetImage(AppImages.addToCartButton),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}