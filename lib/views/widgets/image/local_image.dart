import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocalImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;

  const LocalImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height, 
    this.fit,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (imagePath.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(
        imagePath,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      );
    }
    
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit,
      color: color,
    );
  }
}