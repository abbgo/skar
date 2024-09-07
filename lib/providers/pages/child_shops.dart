import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var childShopsSearchProvider = StateProvider.autoDispose<String>((ref) => '');
var hasChildShopsProvider = StateProvider.autoDispose<bool>((ref) => true);

var childShopsScrollControllerProvider =
    StateProvider.autoDispose<ScrollController>((ref) {
  final controller = ScrollController();
  controller.addListener(() {
    if (controller.position.pixels > 1000) {
      ref
          .read(openChildShopsProductNavigateToTopButtonProvider.notifier)
          .state = true;
    } else {
      ref
          .read(openChildShopsProductNavigateToTopButtonProvider.notifier)
          .state = false;
    }
  });
  return controller;
});

var openChildShopsProductNavigateToTopButtonProvider =
    StateProvider.autoDispose<bool>((ref) => false);

final loadChildShopsProvider = StateProvider.autoDispose<bool>((ref) => true);
