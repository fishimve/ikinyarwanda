import 'dart:io' show Platform;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ikinyarwanda/interface/router.dart';
import 'package:ikinyarwanda/interface/views/home_view.dart';
import 'package:ikinyarwanda/services/dialog_service.dart';
import 'package:ikinyarwanda/services/navigation_service.dart';
import 'package:ikinyarwanda/utils/dialog_manager.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';

import 'locator.dart';
import 'shared/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize all services
  await setupLocator();

  // allow only portrait mode
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  configureApp();

  runApp(const Ikinyarwanda());
}

class Ikinyarwanda extends StatelessWidget {
  const Ikinyarwanda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Ikinyarwanda',
      home: const HomeView(),
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: lightColorScheme,
        appBarTheme: AppBarTheme(
          color: Platform.isIOS
              ? const Color(0xFFFFFFFF)
              : const Color(0xFF8F4E00),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: false,
        colorScheme: darkColorScheme,
        appBarTheme: AppBarTheme(
          color: Platform.isIOS
              ? const Color(0xFF4C2700)
              : const Color(0xFFFFB77B),
        ),
      ),
      themeMode: ThemeMode.system,
      navigatorKey: locator<NavigationService>().navigationKey,
      onGenerateRoute: generateRoute,
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => DialogManager(
            child: child!,
          ),
        ),
      ),
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
