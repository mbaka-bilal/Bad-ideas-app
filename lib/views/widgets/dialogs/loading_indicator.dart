import 'package:flutter/cupertino.dart';

import '../../../core/utils/constant/colors.dart';


class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(
      color: color ?? AppColors.primaryColor,
    );
  }
}
