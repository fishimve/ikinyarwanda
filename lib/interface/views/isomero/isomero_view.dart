import 'package:flutter/material.dart';
import 'package:ikinyarwanda/interface/route_names.dart';
import 'package:ikinyarwanda/interface/router.dart';
import 'package:ikinyarwanda/locator.dart';
import 'package:ikinyarwanda/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

import 'isomero_view_model.dart';

class IsomeroView extends StatelessWidget {
  const IsomeroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IsomeroViewModel>.reactive(
      viewModelBuilder: () => IsomeroViewModel(),
      onViewModelReady: (viewModel) => viewModel.getIkeshamvugo(),
      builder: (context, viewModel, child) => Scaffold(
        body: Expanded(
          child: Navigator(
            key: locator<NavigationService>().navigationKey,
            onGenerateRoute: generateRoute,
            initialRoute: tabsViewRoute,
          ),
        ),
      ),
    );
  }
}
