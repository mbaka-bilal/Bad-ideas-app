import 'package:flutter/material.dart';

import '../../core/utils/helpers.dart';

class WrapChildWithLayoutBuilder extends StatelessWidget {
  const WrapChildWithLayoutBuilder(
      {super.key, required this.child, this.onRefresh});

  final Widget child;
  final Function? onRefresh;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
                padding: AppHelpers.defaultPadding(),
                physics: AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                    minWidth: constraints.maxWidth,
                  ),
                  child: child,
                ),
              )),
    );
  }
}
