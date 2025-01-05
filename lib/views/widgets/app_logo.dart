import 'package:flutter/material.dart';

import '../../core/utils/extensions.dart';
import 'image/local_image.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return LocalImage(
      imagePath: "logo".pngImage,
      width: 100,
      height: 100,
    );
  }
}
