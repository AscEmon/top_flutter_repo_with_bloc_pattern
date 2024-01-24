enum KAssetName {
  oil,
}

extension AssetsExtention on KAssetName {
  String get imagePath {
    String rootPath = 'assets';
    String imageDir = '$rootPath/images';

    switch (this) {
      case KAssetName.oil:
        return "$imageDir/oil.png";
      default:
        return "";
    }
  }
}
