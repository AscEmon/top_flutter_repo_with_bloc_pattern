enum KAssetName {
  movie2Jpg,
  movie3Jpg,
  movie1Jpg,
  movie4Jpg,
  movie5Jpg,
}

extension AssetsExtension on KAssetName {
  String get imagePath {
    const String _rootPath = 'assets';
  const String _imagesDir = '$_rootPath/images';
    switch (this) {
      case KAssetName.movie2Jpg:
        return '$_imagesDir/movie2.jpg';
      case KAssetName.movie3Jpg:
        return '$_imagesDir/movie3.jpg';
      case KAssetName.movie1Jpg:
        return '$_imagesDir/movie1.jpg';
      case KAssetName.movie4Jpg:
        return '$_imagesDir/movie4.jpg';
      case KAssetName.movie5Jpg:
        return '$_imagesDir/movie5.jpg';
    }
  }
}
