import 'package:ikinyarwanda/interface/route_names.dart';
import 'package:ikinyarwanda/locator.dart';
import 'package:ikinyarwanda/models/inkuru.dart';
import 'package:ikinyarwanda/services/favorites_service.dart';
import 'package:ikinyarwanda/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class IsomeroViewModel extends ReactiveViewModel {
  final _favoritesService = locator<FavoritesService>();
  final _navigationService = locator<NavigationService>();

  List<Inkuru> get favoriteStories => _favoritesService.favoritedStories;

  final _stories = <Inkuru>[];
  List<Inkuru> get stories => _stories;

  final _authors = <String>{};
  List<String> get authors => _authors.toList();

  final _categories = <String>{};
  List<String> get categories => _categories.toList()..sort();

  Future<void> getTagsAndStories() async {
    await _favoritesService.initSetup();
    _setTagsAndAuthors();
    _listenToStories();
  }

  void _setTagsAndAuthors() {
    setBusy(true);

    // final categories = langs
    //     .map((l) => l.storiesTags)
    //     .toList()
    //     .fold<List<String>>([], (curr, next) => [...curr, ...next]).toSet();

    // final authors = langs
    //     .map((l) => l.authors)
    //     .toList()
    //     .fold<List<String>>([], (curr, next) => [...curr, ...next]).toSet();
    _categories.clear();
    _categories.addAll(categories);
    _authors.clear();
    _authors.addAll(authors);
    notifyListeners();
    setBusy(false);
  }

  void _listenToStories() async {
    setBusy(true);
    // _firestoreService
    //     .listenToStoriesRealTime(selectedLanguages)
    //     .listen((storiesData) {
    //   List<Inkuru>? updatedStories = storiesData;
    //   if (updatedStories != null && updatedStories.isNotEmpty) {
    //     _stories.addAll(updatedStories);
    //     notifyListeners();
    //   }
    //   setBusy(false);
    // });
  }

  void navigateToInkuruView(Inkuru inkuru) async {
    await _navigationService.navigateTo(inkuruViewRoute, arguments: Inkuru);
    notifyListeners();
  }

  void navigateToCategoryView(String category,
      [bool useAuthors = false]) async {
    // await _navigationService.navigateTo(
    //   categoryViewRoute,
    //   arguments: {'category': category, 'useAuthors': useAuthors},
    // );
    notifyListeners();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_favoritesService];
}
