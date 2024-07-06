import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class SecureFilePicker {
  static const filenameLengthLimit = 20; //TODO MAKE FILENAME LENGTH LIMIT CUSTOMIZABLE
  static const fileSizeLimit = 4000000; // 4MB //TODO MAKE FILE SIZE LIMIT CUSTOMIZABLE

  static Future<File?> pickImage(ImageSource source, {CropAspectRatioPreset? cropAspectRatio}) async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile == null) return null;

    final file = File(pickedFile.path);

    final File compressedFile = await _compressAndGetFile(file);

    if (!validateFile(compressedFile)) return null;

    // needs cropping
    if (cropAspectRatio != null) {
      final croppedFile = await _cropImage(compressedFile);
      return croppedFile;
    }

    return compressedFile;
  }

  static Future<File?> pickWebImage(String userId) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      PlatformFile fileBytes = result.files.first;
      final file = File(fileBytes.path ?? '');

      final compressedFile = await _compressAndGetFile(file, targetSize: fileSizeLimit);

      if (!validateFile(compressedFile)) return null;

      return compressedFile;
    }

    return null;
  }

  static bool validateFile(File file) {
    // Check file size
    if (file.lengthSync() > fileSizeLimit) return false;

    // Check actual file type
    final mimeType = lookupMimeType(file.path);
    if (mimeType == null || !mimeType.startsWith('image/')) return false;

    return true;
  }

  static Future<File> _compressAndGetFile(File sourceFile, {int? targetSize}) async {
    final dir = await getTemporaryDirectory();
    final targetPath = '${dir.absolute.path}/${const Uuid().v4()}.jpg';

    for (int quality = 80; quality >= 40; quality -= 5) {
      final data = await FlutterImageCompress.compressAndGetFile(
        sourceFile.absolute.path,
        targetPath,
        quality: quality,
      );

      final file = File(data?.path ?? '');

      if (targetSize == null) return file;

      if (file.lengthSync() < targetSize) return file;
    }

    throw Exception("Image is too large, cannot compress below target size");
  }

  static Future<File?> _cropImage(final File file,
      {CropAspectRatioPreset aspectRatioPreset = CropAspectRatioPreset.ratio16x9}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: file.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: const Color(0xff497174), //TODO MAKE IT CUSTOMIZABLE
          toolbarWidgetColor: Colors.white, //TODO MAKE IT CUSTOMIZABLE
          initAspectRatio: aspectRatioPreset,
          lockAspectRatio: true, //TODO MAKE IT CUSTOMIZABLE
        ),
        IOSUiSettings(title: 'Cropper'),
      ],
    );
    if (croppedFile == null) {
      return null;
    }

    return File(croppedFile.path);
  }
}
