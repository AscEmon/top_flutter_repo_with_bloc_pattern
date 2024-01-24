import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//localization
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'modules/repo_list/view/repo_list_screen.dart';
import '/constant/app_url.dart';
import '/data_provider/pref_helper.dart';
import '/utils/enum.dart';
import '/utils/navigation.dart';
import '/utils/network_connection.dart';
import '/utils/styles/k_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  //Set Potraite Mode only
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(const MyApp());
}

/// Make sure you always init shared pref first.
/// It has token and token is need
/// to make API call
initServices() async {
  const mode = String.fromEnvironment('mode', defaultValue: 'DEV');
  _setModeFlavor(mode);
  await PrefHelper.init();
  await NetworkConnection.instance.internetAvailable();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    return ScreenUtilInit(
      /// Change the height and Width based on design
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (ctx, child) {
        return MaterialApp(
          title: 'Top Flutter Repository',
          navigatorKey: Navigation.key,

          debugShowCheckedModeBanner: false,

          /// localization
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          locale: (PrefHelper.getLanguage() == 1)
              ? const Locale('en', 'US')
              : const Locale('bn', 'BD'),
          theme: ThemeData(
            progressIndicatorTheme: ProgressIndicatorThemeData(
              color: KColor.secondary.color,
            ),
            textTheme: GoogleFonts.poppinsTextTheme(),
            primaryColor: KColor.primary.color,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            colorScheme: ThemeData().colorScheme.copyWith(
                  secondary: KColor.secondary.color,
                ),
            primarySwatch: KColor.primary.color as MaterialColor,
          ),
          home: child,
        );
      },
      child: const RepoListScreen(),
    );
  }
}

_setModeFlavor(mode) {
  switch (mode) {
    case 'DEV':
      AppUrlExtention.setUrl(UrlLink.isDev);
      break;
    case 'LIVE':
      AppUrlExtention.setUrl(UrlLink.isProd);
      break;
    case 'QA':
      AppUrlExtention.setUrl(UrlLink.isQa);
      break;
    default:
      AppUrlExtention.setUrl(UrlLink.isProd);
  }
}
