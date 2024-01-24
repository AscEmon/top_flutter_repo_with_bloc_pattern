import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '/utils/enum.dart';

class NetworkConnection {
  static NetworkConnection? _instance;

  NetworkConnection._();

  static NetworkConnection get instance => _instance ??= NetworkConnection._();
  bool isInternet = true;

  Future<bool> hasInternetConnection() async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        return true;
      } else {
        return false;
      }
    } on PlatformException {
      return false;
    } catch (e) {
      return false;
    }
  }

  internetAvailable() async {
    isInternet = await hasInternetConnection();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!
      if (result == ConnectivityResult.none) {
        isInternet = false;
      } else {
        isInternet = true;
      }
    });

    /// This Delay is require for sync the result value with UI.
    /// In iOS first rebuild the UI after that
    /// the Internet value is process thats why we show the connection Error Dialog
    await Future.delayed(const Duration(seconds: 1));
  }

  List<APIParams> apiStack = [];
}

//check api params for calling the api while internet will be available
class APIParams {
  String url;
  Method method;
  Map<String, dynamic> variables;
  Function(Response<dynamic>) onSuccessFunction;

  APIParams({
    required this.url,
    required this.method,
    required this.variables,
    required this.onSuccessFunction,
  });
}
