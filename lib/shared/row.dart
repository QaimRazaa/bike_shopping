import 'package:flutter/material.dart';
import '../../../utils/helpers/app_sizes.dart'; // adjust import path as needed

class LabelValueRow extends StatelessWidget {
  final String label;
  final String value;
  final FontWeight? labelWeight;
  final FontWeight? valueWeight;
  final double? fontPercent;
  final Color? labelColor;
  final Color? valueColor;
  final EdgeInsetsGeometry? padding;

  const LabelValueRow({
    super.key,
    required this.label,
    required this.value,
    this.labelWeight,
    this.valueWeight,
    this.fontPercent,
    this.labelColor,
    this.valueColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: padding ?? AppSizes.paddingOnly(left: 8,right: 8,top: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: AppSizes.font(fontPercent ?? 1.6),
              fontWeight: labelWeight ?? FontWeight.w500,
              color: labelColor ?? Colors.white.withOpacity(0.9),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: AppSizes.font(fontPercent ?? 1.6),
              fontWeight: valueWeight ?? FontWeight.w400,
              color: valueColor ?? Colors.white.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
