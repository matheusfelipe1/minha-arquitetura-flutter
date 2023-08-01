import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

extension GetImage on ImagePicker {
  Future<String?> getPath(ImageSource source) async {
    final file = await ImagePicker.platform
        .getImageFromSource(source: source);
    if (file != null) {
      try {
        final path = (await getApplicationDocumentsDirectory()).path;
        final dir = Directory("$path/images");
        if (!(await dir.exists())) dir.createSync();
        final pathSave = "${dir.path}/${DateTime.now().microsecond}.png";
        await file.saveTo(pathSave);
        return pathSave;
      } catch (e) {
        debugPrint(e.toString());
        return null;
      }
    }
    return null;
  }
}