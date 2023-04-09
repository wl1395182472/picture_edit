import 'package:image_picker/image_picker.dart';

import 'log.dart';

class ImagePick {
  static final _picker = ImagePicker();

  static Future<XFile?> getImageFromCamera() async {
    XFile? file;
    try {
      file = await _picker.pickImage(
        source: ImageSource.camera,
      );
    } catch (error) {
      sLog.e('getImageFromCamera error:$error');
    }
    return file;
  }

  static Future<XFile?> getImageFromGallery() async {
    XFile? file;
    try {
      file = await _picker.pickImage(
        source: ImageSource.gallery,
      );
    } catch (error) {
      sLog.e('getImageFromCamera error:$error');
    }
    return file;
  }
}
