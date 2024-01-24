import 'package:top_flutter_repo/utils/enum.dart';

enum AppUrl {
  base,
  baseImage,
}

extension AppUrlExtention on AppUrl {
  static String _baseUrl = "";
  static String _baseImageUrl = "";

  static void setUrl(UrlLink urlLink) {
    switch (urlLink) {
      case UrlLink.isProd:
        _baseUrl = "https://api.github.com/search/repositories";
        _baseImageUrl = "";

        break;

      case UrlLink.isDev:
        _baseUrl = "https://api.github.com/search/repositories";
        _baseImageUrl = "";

        break;
      case UrlLink.isQa:
        _baseUrl = "https://api.github.com/search/repositories";
        break;
    }
  }

  String get url {
    switch (this) {
      case AppUrl.base:
        return _baseUrl;
      case AppUrl.baseImage:
        return _baseImageUrl;

      default:
    }
    return "";
  }
}
