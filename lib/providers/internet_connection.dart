import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/internet.dart';
import 'package:skar/notifiers/internet.dart';

enum ConnectivityStatus { notDetermined, isConnected, isDisonnected }

final connectivityStatusProviders = StateNotifierProvider((ref) {
  return ConnectivityStatusNotifier();
});

var checkInternetConnProvider =
    FutureProvider.autoDispose.family<bool, BuildContext>((ref, arg) async {
  return await checkIntWithContextConn(arg);
});
