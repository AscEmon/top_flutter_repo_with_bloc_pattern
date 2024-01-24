import 'package:top_flutter_repo/utils/enum.dart';

enum AppUrl {
  base,
  baseImage,
  repoList,
}

extension AppUrlExtention on AppUrl {
  static String _baseUrl = "";
  static String _baseImageUrl = "";

  static void setUrl(UrlLink urlLink) {
    switch (urlLink) {
      case UrlLink.isProd:
        _baseUrl = "https://api.github.com";
        _baseImageUrl = "";

        break;

      case UrlLink.isDev:
        _baseUrl = "https://api.github.com";
        _baseImageUrl = "";

        break;
      case UrlLink.isQa:
        _baseUrl = "https://api.github.com";
        break;
    }
  }

  String get url {
    switch (this) {
      case AppUrl.base:
        return _baseUrl;
      case AppUrl.baseImage:
        return _baseImageUrl;
      case AppUrl.repoList:
        return "/search/repositories";

      default:
    }
    return "";
  }
}
