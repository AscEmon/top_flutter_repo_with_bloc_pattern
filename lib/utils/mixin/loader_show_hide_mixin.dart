import '../../global/widget/global_loader.dart';
import '../navigation.dart';
import '../view_util.dart';

mixin LoaderShowHideMixin {
  void showLoaderView() {
    ViewUtil.showAlertDialog(
      content: const GlobalLoader(),
    );
  }

  void hideLoader() {
    Navigation.pop(Navigation.key.currentContext);
  }
  
}
