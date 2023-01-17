import 'package:ikinyarwanda/locator.dart';
import 'package:ikinyarwanda/services/dialog_service.dart';
import 'package:ikinyarwanda/services/favorites_service.dart';
import 'package:ikinyarwanda/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class InkuruViewModel extends ReactiveViewModel {
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _favoritesService = locator<FavoritesService>();

  var isFavorite = false;

  void getFavoriteStatus(String id) {
    isFavorite = _favoritesService.isFavorite(id);
  }

  void handleFavorite(
    String inkuruId,
    String dialogConfirm,
    String removeFromFavs,
    String confirm,
    String deny,
  ) async {
    if (isFavorite) {
      var dialogResponse = await _dialogService.showConfirmationDialog(
        title: dialogConfirm,
        description: removeFromFavs,
        confirmation: confirm,
        cancel: deny,
      )!;

      if (dialogResponse.confirmed!) {
        // _favoritesService.unfavoriteInkuru(InkuruId);
        isFavorite = false;
        notifyListeners();
      }
    } else {
      // _favoritesService.favoriteInkuru(InkuruId);
      isFavorite = true;
      notifyListeners();
    }
  }

  void navigatorPop() {
    _navigationService.pop();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_favoritesService];
}
