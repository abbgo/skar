import 'dart:async';
import 'dart:ui' as dartui;

import 'package:flutter/services.dart';

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  dartui.Codec codec = await dartui
      .instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
  dartui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: dartui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}
