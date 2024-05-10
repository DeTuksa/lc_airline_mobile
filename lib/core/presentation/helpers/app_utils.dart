import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lc_airline/core/presentation/themes/app_themes.dart';

class AppUtils {
  // -------------CROP IMAGE FUNCTION --------------------

  static Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: image.path,
        maxWidth: 1080,
        maxHeight: 1080,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      );
      if (croppedImage != null) {
        return File(croppedImage.path).path;
      }
    }
  }

  Widget buildImage(String urlImage) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          urlImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Widget buildItemCount(int itemCount, BuildContext context) {
  //   return Container(
  //     height: 30,
  //     width: 30,
  //     decoration: BoxDecoration(
  //         shape: BoxShape.circle,
  //         color: AppTheme.primary,
  //         border: Border.all(color: Colors.white, width: 1)),
  //     child: ClipRRect(
  //         borderRadius: BorderRadius.circular(100),
  //         child: Center(
  //             child: Text('+$itemCount',
  //                 style: AppTheme.getThemeData(context).textTheme.bodyMedium))),
  //   );
  // }
}
