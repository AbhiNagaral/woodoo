import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

mixin ConnectivityAwareMixin {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _subscription;

  bool _isConnected = true;
  bool get isConnected => _isConnected;

  @protected
  void onConnectivityChanged(bool isConnected) {}

  void initializeConnectivity() {
    _subscription =
        _connectivity.onConnectivityChanged.listen((result) {
          final connected = result != ConnectivityResult.none;

          if (_isConnected != connected) {
            _isConnected = connected;
            onConnectivityChanged(connected);
          }
        });
  }

  void disposeConnectivity() {
    _subscription?.cancel();
  }
}