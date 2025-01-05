import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/state/base.state.dart';
import '../../../core/utils/constant/colors.dart';
import '../../../core/utils/constant/spacing.dart';

class LoadingStatusOverlay {
  LoadingStatusOverlay._constructor();

  static final LoadingStatusOverlay _instance =
      LoadingStatusOverlay._constructor();

  factory LoadingStatusOverlay() => _instance;

  OverlayEntry? _overlayEntry;
  bool _overlayEntryInList = false;

  void showStatus({
    required BuildContext context,
    required String title,
    required String subtitle,
    required Status status,
  }) {
    _overlayEntry = OverlayEntry(
        builder: (context) =>
            Alert(status: status, title: title, subtitle: subtitle));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_overlayEntry != null) {
        if (_overlayEntry!.mounted || _overlayEntryInList) {
          _overlayEntry?.remove();
        }

        Overlay.of(context).insert(_overlayEntry!);
        _overlayEntryInList = true;
      }
    });
  }

  void dismissOverlay() {
    if (_overlayEntry != null && _overlayEntry!.mounted) {
      _overlayEntry?.remove();
      _overlayEntry?.dispose();
      _overlayEntryInList = false;
    }
  }
}

///show snack bar at the top of screen
class Alert extends StatefulWidget {
  final Status status;
  final String title;
  final String subtitle;
  final Color? backgroundColor;

  const Alert({
    super.key,
    required this.status,
    required this.title,
    required this.subtitle,
    this.backgroundColor,
  });

  @override
  State createState() => _AlertState();
}

class _AlertState extends State<Alert> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _offsetAnimation;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _offsetAnimation = Tween<double>(
      begin: -50,
      end: 50,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    _controller.addListener(() {
      setState(() {});
    });

    _controller.forward();

    timer = Timer(Duration(seconds: 3), () {
      LoadingStatusOverlay().dismissOverlay();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    if (timer != null) timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          //Remove Overlay
          LoadingStatusOverlay().dismissOverlay();
        },
        child: Stack(
          children: [
            Positioned.fill(
              top: _offsetAnimation.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                    color: widget.backgroundColor,
                    decoration: BoxDecoration(
                        color: widget.backgroundColor ??
                            (widget.status == Status.success
                                ? AppColors.green
                                : AppColors.red),
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              (widget.status == Status.success)
                                  ? const Icon(
                                      Icons.check_circle_outline_sharp,
                                      color: AppColors.green,
                                    )
                                  : const Icon(
                                      Icons.cancel_outlined,
                                      color: AppColors.red,
                                    ),
                              Spacing.smallHorizontalSpace,
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(
                                            color: (widget.status ==
                                                    Status.success)
                                                ? AppColors.green
                                                : AppColors.red,
                                          ),
                                    ),
                                    // smallVerticalSpace,
                                    Text(
                                      widget.subtitle,
                                      maxLines: 5,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () => LoadingStatusOverlay().dismissOverlay(),
                          child: Row(
                            children: [
                              Spacing.smallHorizontalSpace,
                              Icon(
                                Icons.close,
                                color: Colors.black,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
