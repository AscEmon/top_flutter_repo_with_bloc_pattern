import 'dart:io';
import 'package:dio/dio.dart';
import '../data_provider/api_client.dart';
import 'enum.dart';
import 'mixin/loader_show_hide_mixin.dart';

class NetworkRequestBuilder with LoaderShowHideMixin {
  final ApiClient _apiClient = ApiClient();

  late String url;
  late Method method;
  Map<String, dynamic>? params;
  Function(bool isLoading) onLoading = (isLoading) => true;
  late Function(Response response) onSuccess;
  late Function(Object errorMessage) onFailed;
  bool showLoader = false;
  Map<String, String>? extraHeaders;
  Options? options;
  void Function(int, int)? onReceiveProgress;
  String? savePath;
  List<File>? files;
  String? fileKeyName;

  NetworkRequestBuilder setUrl(String url) {
    this.url = url;
    return this;
  }

  NetworkRequestBuilder setMethod(Method method) {
    this.method = method;
    return this;
  }

  NetworkRequestBuilder setParams(Map<String, dynamic> params) {
    this.params = params;
    return this;
  }

  NetworkRequestBuilder setOnSuccess(Function(Response response) onSuccess) {
    this.onSuccess = onSuccess;
    return this;
  }

  NetworkRequestBuilder setOnFailed(Function(Object errorMessage) onFailed) {
    this.onFailed = onFailed;
    return this;
  }

  NetworkRequestBuilder setShowLoader(bool showLoader) {
    this.showLoader = showLoader;
    return this;
  }

  NetworkRequestBuilder setExtraHeaders(Map<String, String>? extraHeaders) {
    this.extraHeaders = extraHeaders;
    return this;
  }

  NetworkRequestBuilder setOptions(Options? options) {
    this.options = options;
    return this;
  }

  NetworkRequestBuilder setOnReceiveProgress(
      void Function(int, int)? onReceiveProgress) {
    this.onReceiveProgress = onReceiveProgress;
    return this;
  }

  NetworkRequestBuilder setSavePath(String? savePath) {
    this.savePath = savePath;
    return this;
  }

  NetworkRequestBuilder setFiles(List<File>? files) {
    this.files = files;
    return this;
  }

  NetworkRequestBuilder setFileKeyName(String? fileKeyName) {
    this.fileKeyName = fileKeyName;
    return this;
  }

  Future<void> executeNetworkRequest() async {
    if (showLoader) {
      showLoaderView();
    }
    onLoading(true);

    await _apiClient
        .request(
      method: method,
      url: url,
      params: params,
      extraHeaders: extraHeaders,
      options: options,
      onReceiveProgress: onReceiveProgress,
      savePath: savePath,
      files: files,
      fileKeyName: fileKeyName,
      onSuccessFunction: (Response response) async {
        if (showLoader) {
          hideLoader();
        }
        await onSuccess(response);
        onLoading(false);
      },
    )
        .catchError((Object e) {
      if (showLoader) {
        hideLoader();
      }
      onFailed(e);
      onLoading(false);
    });
  }
}
