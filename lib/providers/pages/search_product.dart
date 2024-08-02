import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var searchProductScrollControllerProvider =
    StateProvider.autoDispose<ScrollController>((ref) {
  final controller = ScrollController();
  controller.addListener(() {
    if (controller.position.pixels > 1000) {
      ref.read(openSearchProductNavigateToTopButtonProvider.notifier).state =
          true;
    } else {
      ref.read(openSearchProductNavigateToTopButtonProvider.notifier).state =
          false;
    }
  });
  return controller;
});

var openSearchProductNavigateToTopButtonProvider =
    StateProvider.autoDispose<bool>((ref) => false);

final openProductSearchProvider =
    StateProvider.autoDispose<bool>((ref) => false);
