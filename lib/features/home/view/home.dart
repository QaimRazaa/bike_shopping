import 'package:bike_shopping/features/home/view/widgets/bike_card.dart';
import 'package:bike_shopping/features/home/view/widgets/category_chip.dart';
import 'package:bike_shopping/utils/constants/colors.dart';
import 'package:bike_shopping/utils/constants/images.dart';
import 'package:bike_shopping/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../navigation_bar.dart';
import '../../../shared/appbar.dart';
import '../../../utils/helpers/app_sizes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> bikeImages = [
    AppImages.bikeOne,
    AppImages.bikeTwo,
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.diagonalGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          title: 'Choose Your Bike',
          onSearchTap: () {},
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: AppSizes.height(1),),
                    Image.asset(AppImages.featureCard),
                    Image.asset(
                      AppImages.category,
                      fit: BoxFit.cover,
                      width: AppSizes.width(82),
                    ),

                    SizedBox(height: AppSizes.height(2)),

                    Padding(
                      padding: AppSizes.paddingSymmetric(horizontal: 4),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: AppSizes.width(3.5),
                          mainAxisSpacing: AppSizes.height(1.5),
                        ),
                        itemCount: bikeImages.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            bikeImages[index],
                            fit: BoxFit.contain,
                          );
                        },
                      ),

                    ),

                    SizedBox(height: AppSizes.height(2)),
                  ],
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.transparent
              ),
              child: Image.asset(
                AppImages.navbar,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
