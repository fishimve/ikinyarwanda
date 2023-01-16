import 'package:ikinyarwanda/locator.dart';
import 'package:ikinyarwanda/models/inkuru.dart';
import 'package:stacked/stacked.dart';

import 'localstorage_service.dart';


class FavoritesService with ListenableServiceMixin {
  final _storageService = locator<LocalStorageService>();

  final _reactiveList = ReactiveList<Inkuru>();
  List<Inkuru> get favoritedStories => _reactiveList;

  final _favoritesIds = <String>{};

  FavoritesService() {
    listenToReactiveValues([_reactiveList]);
  }

  Future<void> initSetup() async {
    final favs = _storageService.getStringListFromDisk('favorites');
    if (favs.isNotEmpty) {
      _favoritesIds.clear();
      _reactiveList.clear();
      _favoritesIds.addAll(favs);
      for (var f in favs) {
        // TODO
        // var story = await _firestoreService.getFavoriteStory(f);
        // if (story != null) {
        //   _reactiveList.add(story);
        // }
      }
    }
  }

  bool isFavorite(String id) {
    return _favoritesIds.contains(id);
  }

  void favoriteStory(String id) async {
    _favoritesIds.add(id);
    // final story = await _firestoreService.getFavoriteStory(id);
    // _reactiveList.add(story);
    await _storageService.saveStringListToDisk('favorites', _favoritesIds);
  }

  void unfavoriteStory(String id) async {
    _favoritesIds.remove(id);
    _reactiveList.removeWhere((story) => story.title == id);
    await _storageService.saveStringListToDisk('favorites', _favoritesIds);
  }
}
