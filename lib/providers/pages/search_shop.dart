import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var searchShopScrollControllerProvider =
    StateProvider.autoDispose<ScrollController>((ref) {
  final controller = ScrollController();
  controller.addListener(() {
    if (controller.position.pixels > 1000) {
      ref.read(openSearchShopNavigateToTopButtonProvider.notifier).state = true;
    } else {
      ref.read(openSearchShopNavigateToTopButtonProvider.notifier).state =
          false;
    }
  });
  return controller;
});

var openSearchShopNavigateToTopButtonProvider =
    StateProvider.autoDispose<bool>((ref) => false);

final loadSearchShopProvider = StateProvider<bool>((ref) => true);
