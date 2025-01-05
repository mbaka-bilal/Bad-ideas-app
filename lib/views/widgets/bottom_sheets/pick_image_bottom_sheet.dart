import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controllers/services/navigation_service.dart';
import '../../../core/utils/constant/spacing.dart';
import '../../../core/utils/helpers.dart';

class PickImageBottomSheet extends StatelessWidget {
  final Function(String) onImagePicked;

  const PickImageBottomSheet({super.key, required this.onImagePicked});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppHelpers.defaultPadding(bottom: 10),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Text("From Camera"),
                Spacing.mediumVerticalSpace,
                IconButton(
                    onPressed: () async {
                      await pickImage(context: context, fromCamera: true);
                    },
                    icon: const Icon(Icons.camera_alt_outlined)),
              ],
            ),
            const VerticalDivider(
              width: 1,
              thickness: 1,
            ),
            Column(
              children: [
                const Text("From Gallery"),
                Spacing.mediumVerticalSpace,
                IconButton(
                    onPressed: () async {
                      await pickImage(context: context, fromCamera: false);
                    },
                    icon: const Icon(Icons.sd_card_outlined)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> pickImage(
      {required BuildContext context, bool fromCamera = false}) async {
    AppNavigator.pop(context: context);

    final image = await ImagePicker().pickImage(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery);
    if (image?.path != null) {
      onImagePicked(image!.path);
    }
  }
}
