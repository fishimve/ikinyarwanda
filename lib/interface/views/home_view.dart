import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:ikinyarwanda/interface/widgets/web_centered_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:ikinyarwanda/interface/widgets/text_widget.dart';
import 'package:ikinyarwanda/shared/ui_helpers.dart';

import 'home_view_model.dart';
import 'ibisakuzo/ibisakuzo_view.dart';
import 'ikeshamvuga/ikeshamvuga_view.dart';
import 'incamarenga/incamarenga_view.dart';
import 'isomero/isomero_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        body: WebCenteredWidget(
          child: SafeArea(
            child: getViewForIndex(viewModel.currentIndex),
          ),
        ),
        bottomNavigationBar: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          reverse: viewModel.reverse,
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SharedAxisTransition(
              child: child,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
            );
          },
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Theme.of(context).primaryColor,
            selectedItemColor: Theme.of(context).colorScheme.secondary,
            unselectedItemColor: Theme.of(context).indicatorColor,
            currentIndex: viewModel.currentIndex,
            onTap: viewModel.setIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.library_books_outlined),
                label: 'Isomero',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.rule_outlined),
                label: 'Sakwe Sakwe',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.games_outlined),
                label: 'Ikeshamvugo',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.storm_outlined),
                label: 'Imigani',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getViewForIndex(int index) {
  switch (index) {
    case 0:
      return const IsomeroView();
    case 1:
      return const IbisakuzoView(level: 1);
    case 2:
      return const IkeshamvugoView();
    case 3:
      return const IncamarengaView();
    default:
      return const IsomeroView();
  }
}
