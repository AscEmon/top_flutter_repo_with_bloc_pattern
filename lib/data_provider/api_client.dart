import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '/constant/app_url.dart';
import '/constant/constant_key.dart';
import '/data_provider/pref_helper.dart';
import '/utils/enum.dart';
import '/utils/extension.dart';
import '/utils/navigation.dart';
import '/utils/network_connection.dart';
import '/utils/view_util.dart';

class ApiClient {
  final Dio _dio = Dio();
  Map<String, dynamic> _header = {};

  _initDio({Map<String, String>? extraHeader}) async {
    _header = _getHeaders();
    if (extraHeader != null) {
      _header.addAll(extraHeader);
    }

    _dio.options = BaseOptions(
      baseUrl: AppUrl.base.url,
      headers: _header,
      connectTimeout: const Duration(milliseconds: 60 * 1000),
      sendTimeout: const Duration(milliseconds: 60 * 1000),
      receiveTimeout: const Duration(milliseconds: 60 * 1000),
    );
    _initInterceptors();
  }

  void _initInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      debugPrint(
          'REQUEST[${options.method}] => PATH: ${AppUrl.base.url}${options.path} '
          '=> Request Values: param: ${options.queryParameters}, => Time : ${DateTime.now()}, DATA: ${options.data}, => _HEADERS: ${options.headers} ');
      return handler.next(options);
    }, onResponse: (response, handler) {
      debugPrint(
          'RESPONSE[${response.statusCode}] => Time : ${DateTime.now()} => DATA: ${response.data} URL: ${response.requestOptions.baseUrl}${response.requestOptions.path} ');
      return handler.next(response);
    }, onError: (err, handler) {
      debugPrint(
          'ERROR[${err.response?.statusCode}] => DATA: ${err.response?.data} Message: ${err.message} URL: ${err.response?.requestOptions.baseUrl}${err.response?.requestOptions.path}');
      return handler.next(err);
    }));
  }

  Future request({
    required String url,
    required Method method,
    Map<String, dynamic>? params,
    Map<String, String>? extraHeaders,
    Options? options,
    void Function(int, int)? onReceiveProgress,
    String? savePath,
    List<File>? files,
    String? fileKeyName,
    required Function(Response response) onSuccessFunction,
  }) async {
    final tokenHeader = <String, String>{
      HttpHeaders.contentTypeHeader: AppConstant.MULTIPART_FORM_DATA.key
    };
    if (extraHeaders != null) {
      tokenHeader.addAll(extraHeaders);
    }
    _initDio(extraHeader: tokenHeader);

    if (files != null) {
      params?.addAll({
        "$fileKeyName": files
            .map((item) => MultipartFile.fromFileSync(item.path,
                filename: item.path.split('/').last))
            .toList()
      });
    }

    FormData? data;
    if (params != null) {
      data = FormData.fromMap(params);
    }
    if (NetworkConnection.instance.isInternet) {
      return clientHandle(
        url,
        method,
        params,
        data: data,
        options: options,
        savePath: savePath,
        onReceiveProgress: onReceiveProgress,
        onSuccessFunction: onSuccessFunction,
      );
    } else {
      _handleNoInternet(
        apiParams: APIParams(
          url: url,
          method: method,
          variables: params ?? {},
          onSuccessFunction: onSuccessFunction,
        ),
      );
    }
  }

// Handle all the method and error.
  Future clientHandle(
    String url,
    Method method,
    Map<String, dynamic>? params, {
    dynamic data,
    Options? options,
    String? savePath,
    void Function(int, int)? onReceiveProgress,
    required Function(Response response)? onSuccessFunction,
  }) async {
    Response response;
    try {
      // Handle response code from api.
      if (method == Method.POST) {
        response = await _dio.post(
          url,
          data: data ?? params,
        );
      } else if (method == Method.DELETE) {
        response = await _dio.delete(url);
      } else if (method == Method.PATCH) {
        response = await _dio.patch(url);
      } else if (method == Method.DOWNLOAD) {
        response = await _dio.download(
          url,
          savePath,
          queryParameters: params,
          options: options,
          onReceiveProgress: onReceiveProgress,
        );
      } else {
        response = await _dio.get(
          url,
          queryParameters: params,
          options: options,
          onReceiveProgress: onReceiveProgress,
        );
      }
      /**
       * Handle Rest based on response json
       */
      _handleResponse(
        response: response,
        onSuccessFunction: onSuccessFunction,
      );

      // Handle Error type if dio catches anything.
    } on DioException catch (e) {
      "Error is: $e".log();
      _handleDioError(e);
      rethrow;
    } catch (e) {
      "DioErrorCatch :: $e".log();
      throw Exception("Something went wrong $e");
    }
  }

  Map<String, String> _getHeaders() {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader:
          AppConstant.APPLICATION_VND_GITHUB_JSON.key,
      AppConstant.APP_VERSION.key:
          PrefHelper.getString(AppConstant.APP_VERSION.key),
      AppConstant.BUILD_NUMBER.key:
          PrefHelper.getString(AppConstant.BUILD_NUMBER.key),
      AppConstant.LANGUAGE.key: PrefHelper.getLanguage() == 1
          ? AppConstant.EN.key
          : AppConstant.BN.key,
    };
    String token = PrefHelper.getString(AppConstant.TOKEN.key);
    if (token.isNotEmpty == true) {
      Map<String, String> bearerToken = {
        HttpHeaders.authorizationHeader:
            "${AppConstant.BEARER.key} ${PrefHelper.getString(AppConstant.TOKEN.key)}",
      };
      headers.addAll(bearerToken);
    }

    return headers;
  }

  void _handleNoInternet({
    required APIParams apiParams,
  }) {
    NetworkConnection.instance.apiStack.add(apiParams);

    if (ViewUtil.isPresentedDialog == false) {
      ViewUtil.isPresentedDialog = true;
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ViewUtil.showInternetDialog(
            onPressed: () {
              if (NetworkConnection.instance.isInternet == true) {
                Navigator.of(Navigation.key.currentState!.overlay!.context,
                        rootNavigator: true)
                    .pop();
                ViewUtil.isPresentedDialog = false;
                for (var element in NetworkConnection.instance.apiStack) {
                  request(
                    url: element.url,
                    method: element.method,
                    params: element.variables,
                    onSuccessFunction: element.onSuccessFunction,
                  );
                }
                NetworkConnection.instance.apiStack = [];
              }
            },
          );
        },
      );
    }
  }

  void _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        ViewUtil.snackbar("Time out delay ");
        break;
      case DioExceptionType.receiveTimeout:
        ViewUtil.snackbar("Server is not responded properly");
        break;
      case DioExceptionType.unknown:
        ViewUtil.snackbar("Server is not responded properly");
        break;
      case DioExceptionType.connectionError:
        ViewUtil.snackbar("Connection error");
        break;
      case DioExceptionType.cancel:
        ViewUtil.snackbar("Connection cancel");
        break;

      case DioExceptionType.badCertificate:
        ViewUtil.snackbar("Incorrect certificate error");
        break;
      case DioExceptionType.sendTimeout:
        ViewUtil.snackbar("Send timeout error");
        break;
      case DioExceptionType.badResponse:
        _tempErrorHandle(error);
        break;

      default:
        ViewUtil.snackbar("Something went wrong");
        break;
    }
  }

  Future<void> _handleResponse({
    required Response response,
    required Function(Response response)? onSuccessFunction,
  }) async {
    if ((response.statusCode == 200 || response.statusCode == 201) &&
        response.data != null) {
      return onSuccessFunction!(response);
    } else {
      ViewUtil.snackbar("Something went wrong");
      throw Exception("Response data is ${response.data}");
    }
  }

  void _tempErrorHandle(DioException error) async {
    final Map data = json.decode(error.response.toString());
    "_tempErrorHandle :: $data".log();
    if (error.response?.statusCode == 403) {
      ViewUtil.snackbar("Forbidden");
    } else if (error.response?.statusCode == 502) {
      ViewUtil.snackbar("Something went wrong");
    } else if (error.response?.statusCode == 422) {
      ViewUtil.snackbar("Validation failed, or the endpoint has been spammed.");
    } else {
      ViewUtil.snackbar("Something went wrong");
    }
  }
}
