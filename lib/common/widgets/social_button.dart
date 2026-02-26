import 'package:flutter/material.dart';
import 'package:resumebuilder/utils/constants/colors.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    this.iconData,
    this.imageAsset,
    this.imageNetwork,
    this.onPressed,
  });

  final IconData? iconData;
  final String? imageAsset;
  final String? imageNetwork;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: onPressed ?? () {},
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: const BorderSide(color: UColors.grayColor),
          backgroundColor: Colors.white,
        ),
        child: _buildChild(),
      ),
    );
  }

  Widget _buildChild() {
    if (imageNetwork != null) {
      return Image.network(imageNetwork!, width: 22, height: 22);
    }
    if (iconData != null) {
      return Icon(iconData, color: UColors.blackColor, size: 22);
    }
    return const SizedBox.shrink();
  }
}
