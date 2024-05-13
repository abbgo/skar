import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ConnectivityStatus { NotDetermined, isConnected, isDisonnected }

class ConnectivityStatusNotifier extends StateNotifier<ConnectivityStatus> {
  ConnectivityStatusNotifier() : super(ConnectivityStatus.isConnected) {
    Connectivity().checkConnectivity().then((value) {
      if (value == ConnectivityResult.mobile ||
          value == ConnectivityResult.wifi) {
        state = ConnectivityStatus.isConnected;
      } else {
        state = ConnectivityStatus.isDisonnected;
      }
    });
  }

  void checkInt() {
    Connectivity().checkConnectivity().then((value) {
      if (value == ConnectivityResult.mobile ||
          value == ConnectivityResult.wifi) {
        state = ConnectivityStatus.isConnected;
      } else {
        state = ConnectivityStatus.isDisonnected;
      }
    });
  }
}

final intConnStatusProvider = StateNotifierProvider((ref) {
  return ConnectivityStatusNotifier();
});
