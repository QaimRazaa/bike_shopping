import 'package:bike_shopping/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/slide_provider.dart';
import '../utils/helpers/app_sizes.dart';

class SlideToCheckout extends StatelessWidget {
  final VoidCallback onSlideComplete;
  final String text;
  final Color backgroundColor;

  const SlideToCheckout({
    Key? key,
    required this.onSlideComplete,
    this.text = 'Checkout',
    this.backgroundColor = const Color(0xFF2a2d3e),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sliderWidth = AppSizes.width(65);
    final double sliderHeight = AppSizes.height(6);
    final double thumbSize = AppSizes.height(6);
    final double maxDrag = sliderWidth - thumbSize - AppSizes.width(2);
    final double padding = AppSizes.width(1);

    return ChangeNotifierProvider(
      create: (_) => SliderProvider(),
      child: Consumer<SliderProvider>(
        builder: (context, provider, _) {
          return Container(
            width: sliderWidth,
            height: sliderHeight,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: AppSizes.borderRadius(4),
            ),
            child: Stack(
              children: [
                _buildCenterText(provider, maxDrag),
                _buildDraggableThumb(
                  context,
                  provider,
                  padding,
                  sliderHeight,
                  thumbSize,
                  maxDrag,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCenterText(SliderProvider provider, double maxDrag) {
    return Center(
      child: Opacity(
        opacity: provider.getOpacity(maxDrag),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white70,
            fontSize: AppSizes.font(1.7),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildDraggableThumb(
      BuildContext context,
      SliderProvider provider,
      double padding,
      double sliderHeight,
      double thumbSize,
      double maxDrag,
      ) {
    return Positioned(
      left: padding + provider.dragPosition,
      top: (sliderHeight - thumbSize) / 2,
      child: GestureDetector(
        onHorizontalDragStart: (_) => provider.startDragging(),
        onHorizontalDragUpdate: (details) {
          provider.updateDragPosition(details.delta.dx, maxDrag);
        },
        onHorizontalDragEnd: (_) {
          provider.endDragging(maxDrag, onSlideComplete);
        },
        child: AnimatedContainer(
          duration: provider.isDragging
              ? Duration.zero
              : const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          width: thumbSize,
          height: thumbSize,
          decoration: BoxDecoration(
            gradient: AppColors.applyGradient,
            borderRadius: AppSizes.borderRadius(4),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF3b82f6).withOpacity(0.4),
                blurRadius: AppSizes.width(3),
                offset: Offset(0, AppSizes.height(0.5)),
              ),
            ],
          ),
          child: Icon(
            Icons.chevron_right,
            color: Colors.white,
            size: AppSizes.icon(3.5),
          ),
        ),
      ),
    );
  }
}