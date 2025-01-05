import 'dart:io';

import 'package:bad_ideas_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../core/utils/constant/colors.dart';
import 'bottom_sheets/pick_image_bottom_sheet.dart';
import 'image/local_image.dart';

class ProfilePicture extends StatefulWidget {
  const ProfilePicture(
      {super.key,
      this.userId,
      this.onTap,
      this.backgroundColor,
      this.imagePath,
      this.remoteImageWidth,
      this.remoteImageHeight,
      this.width,
      this.height,
      this.onImagePicked,
      this.circleRadius,
      this.isLoading = false,
      this.iconColor});

  final Color? backgroundColor;
  final double? circleRadius;
  final Color? iconColor;
  final String? imagePath;
  final String? userId;
  final double? remoteImageWidth;
  final double? remoteImageHeight;
  final double? width;
  final double? height;
  final Function()? onTap;
  final Function(String)? onImagePicked;
  final bool isLoading;

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        } else {
          imagePickerBottomSheet();
        }
      },
      child: Stack(children: [
        buildImage(),
        if (widget.isLoading)
          const Positioned.fill(
              child: Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator()))
      ]),
    );
  }

  Widget buildImage() {
    if (imagePath != null) {
      return ClipRRect(
          borderRadius:
              BorderRadius.all(Radius.circular(widget.circleRadius ?? 100)),
          child: Image.file(
              File(
                imagePath!,
              ),
              width: widget.width ?? 100,
              height: widget.height ?? 100,
              fit: BoxFit.cover));
    }

    if (widget.imagePath != null && widget.imagePath!.isNotEmpty) {
      return ClipRRect(
          borderRadius:
              BorderRadius.all(Radius.circular(widget.circleRadius ?? 100)),
          child: Image.network(widget.imagePath!,
              loadingBuilder: (context, _, progress) {
                if (progress == null) return _;
                return defaultImage();
              },
              errorBuilder: (context, _, __) => defaultImage(),
              fit: BoxFit.cover,
              width: widget.remoteImageWidth ?? 100,
              height: widget.remoteImageWidth ?? 100));
    }

    return defaultImage();
  }

  Widget defaultImage() {
    return CircleAvatar(
        backgroundColor: widget.backgroundColor ?? AppColors.primaryColor,
        radius: widget.circleRadius ?? 40,
        child: LocalImage(
          imagePath: "profile_user".pngIcon,
          color: Colors.white,
        ));
  }

  void imagePickerBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return PickImageBottomSheet(onImagePicked: (imagePath) {
            setState(() {
              this.imagePath = imagePath;
              if (widget.onImagePicked != null) {
                widget.onImagePicked!(imagePath);
              }
            });
          });
        }); // Added temporary return to fix lint error
  }
}
