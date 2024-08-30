import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:skar/helpers/snackbars.dart';

Future<bool> checkIntWithContextConn(BuildContext context) async {
  final connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult.first == ConnectivityResult.mobile ||
      connectivityResult.first == ConnectivityResult.wifi) {
    return true;
  } else {
    if (context.mounted) showIntConnErr(context);
    return false;
  }
}
