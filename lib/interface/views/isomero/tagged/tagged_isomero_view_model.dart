import 'package:ikinyarwanda/interface/route_names.dart';
import 'package:ikinyarwanda/locator.dart';
import 'package:ikinyarwanda/models/inkuru.dart';
import 'package:ikinyarwanda/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class TaggedIsomeroViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future<void> navigateToInkuruView(Inkuru inkuru) async {
    setBusy(true);
    await _navigationService.navigateTo(inkuruViewRoute, arguments: inkuru);
    setBusy(false);
  }

  void navigateBack() {
    _navigationService.pop();
  }
}
