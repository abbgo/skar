import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatutePageNotifier extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  void change() {
    state = !state;
  }
}

var statutePageProvider =
    NotifierProvider<StatutePageNotifier, bool>(() => StatutePageNotifier());
