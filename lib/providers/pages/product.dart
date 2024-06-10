import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var activeImageColorProvider = StateProvider.autoDispose<int>((ref) => 0);
var selectedProductColorProvider = StateProvider.autoDispose<int>((ref) => 0);
var selectedImageProvider = StateProvider.autoDispose<int>((ref) => 0);

var productScrollControllerProvider =
    StateProvider.autoDispose<ScrollController>((ref) {
  final controller = ScrollController();
  controller.addListener(() {
    if (controller.position.pixels > 1000) {
      ref.read(openProductNavigateToTopButtonProvider.notifier).state = true;
    } else {
      ref.read(openProductNavigateToTopButtonProvider.notifier).state = false;
    }
  });
  return controller;
});

var openProductNavigateToTopButtonProvider =
    StateProvider.autoDispose<bool>((ref) => false);
