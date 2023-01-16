import 'package:flutter/material.dart';
import 'views/home_view.dart';
import 'views/ibisakuzo/ibisakuzo_view.dart';
import 'views/imigani_migufi/imigani_migufi_view.dart';
import 'views/incamarenga/incamarenga_view.dart';
import '../models/inkuru.dart';
import 'views/isomero/inkuru/inkuru_view.dart';
import 'widgets/text_widget.dart';
import 'views/ikeshamvuga/ikeshamvuga_view.dart';
import 'route_names.dart';

PageRoute _pageRoute({required String routeName, required Widget view}) {
  return MaterialPageRoute(
    settings: RouteSettings(name: routeName),
    builder: (_) => view,
  );
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeViewRoute:
      return _pageRoute(
        routeName: settings.name!,
        view: const HomeView(),
      );
    case inkuruViewRoute:
      final story = settings.arguments as Inkuru;
      return _pageRoute(
        routeName: settings.name!,
        view: InkuruView(inkuru: story),
      );
    case ibisakuzoViewRoute:
      var level = settings.arguments as int;
      return _pageRoute(
        routeName: settings.name!,
        view: IbisakuzoView(level: level),
      );
    case ikeshamvugoViewRoute:
      return _pageRoute(
        routeName: settings.name!,
        view: const IkeshamvugoView(),
      );
    case incamarengaViewRoute:
      return _pageRoute(
        routeName: settings.name!,
        view: const IncamarengaView(),
      );
    case imiganiMigufiViewRoute:
      return _pageRoute(
        routeName: settings.name!,
        view: const ImiganiMigufiView(),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: TextWiget.headline3('Paje itazwi!'),
          ),
        ),
      );
  }
}
