import 'package:bike_shopping/utils/constants/images.dart';
import 'package:flutter/material.dart';
import '../../../shared/appbar.dart';
import '../../../shared/tabbar.dart';
import '../../../utils/constants/colors.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _shrinkController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _positionAnimation;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();

    // Initial slide in animation
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeInOut,
    ));

    // Shrink and move animation
    _shrinkController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.7,
    ).animate(CurvedAnimation(
      parent: _shrinkController,
      curve: Curves.easeInOut,
    ));

    _positionAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, -0.1),
    ).animate(CurvedAnimation(
      parent: _shrinkController,
      curve: Curves.easeInOut,
    ));

    _slideController.forward();
  }

  @override
  void dispose() {
    _slideController.dispose();
    _shrinkController.dispose();
    super.dispose();
  }

  void _onExpandChanged(bool isExpanded) {
    setState(() {
      _isExpanded = isExpanded;
      if (isExpanded) {
        _shrinkController.forward();
      } else {
        _shrinkController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.diagonalGradient,
      ),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'PEUGEOT - LR01',
          showBack: true,
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideTransition(
                    position: _slideAnimation,
                    child: SlideTransition(
                      position: _positionAnimation,
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: Image(
                          image: AssetImage(AppImages.cycleTwo),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: TabBarWidget(
          onExpandChanged: _onExpandChanged,
        ),
      ),
    );
  }
}