import '../styles/styles.dart';

mixin MovieImage {
  String getImage(int index) {
    switch (index) {
      case 0:
        return KAssetName.movie1Jpg.imagePath;
      case 1:
        return KAssetName.movie2Jpg.imagePath;
      case 2:
        return KAssetName.movie3Jpg.imagePath;
      case 3:
        return KAssetName.movie4Jpg.imagePath;
      case 4:
        return KAssetName.movie5Jpg.imagePath;
      default:
        return KAssetName.movie1Jpg.imagePath;
    }
  }
}
