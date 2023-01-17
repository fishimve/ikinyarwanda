import 'package:ikinyarwanda/interface/route_names.dart';
import 'package:ikinyarwanda/locator.dart';
import 'package:ikinyarwanda/models/inkuru.dart';
import 'package:ikinyarwanda/services/data_service.dart';
import 'package:ikinyarwanda/services/favorites_service.dart';
import 'package:ikinyarwanda/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class IsomeroViewModel extends ReactiveViewModel {
  final _favoritesService = locator<FavoritesService>();
  final _navigationService = locator<NavigationService>();
  final _dataService = locator<DataService>();

  List<Inkuru> get favoriteStories => _favoritesService.favoritedInkurus;

  final _inkurus = <Inkuru>[];
  List<Inkuru> get inkurus => _inkurus;

  List<String> get ubwoko => [
        'Abana',
        'Ibyivugo',
        'Imigani',
        'Imivugo',
        'Indirimbo',
        'Inka',
        'Ubumenyi',
        'Urukundo',
        'Abakuru',
        'Alegisi Kagame',
        'Anastase Shyaka',
        'Déo Mazina',
        'Habyalimana Bangambiki',
        'J.B Habimana',
        'Jean Bonaventure Habimana',
        'Jean Pierre Kabano',
        'Jyamubandi Deo',
        'Kajuga Jerome',
        'Karangwa Anaclet',
        'Kimenyi Alexandre',
        'Mupenzi Venuste',
        'Ngarambe François-Xavier',
        'Placide Kalisa',
        'Rugamba Sipiriyani',
        'Sibomana Antoine',
        'Sipiriyani Rugamba',
        'Tuyisenge Olivier',
        'Yozefu Bizuru w\'i Rwamagana',
        'Zeferini Gahamanyi na Francine Uwera'
      ];

  Future<void> getInkurus() async {
    setBusy(true);
    await _favoritesService.initSetup();
    inkurus.addAll(await _dataService.getInkurus());
    setBusy(false);
  }

  void navigateToInkuruView(Inkuru inkuru) async {
    setBusy(true);
    await _navigationService.navigateTo(inkuruViewRoute, arguments: inkuru);
    setBusy(false);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_favoritesService];
}
