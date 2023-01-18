import 'package:flutter/material.dart';
import 'package:ikinyarwanda/models/inkuru.dart';

import 'inkuru_summary_widget.dart';

class SearchWidget extends SearchDelegate<Inkuru?> {
  final String searchLabel;
  final List<Inkuru> inkurus;
  final List<String> favorites;
  final Function(Inkuru) readInkuru;

  SearchWidget({
    required this.readInkuru,
    required this.inkurus,
    required this.favorites,
    required this.searchLabel,
  });

  var tempStories = <Inkuru>[];

  @override
  String get searchFieldLabel => searchLabel;

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      inputDecorationTheme:
          const InputDecorationTheme(border: InputBorder.none),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear, size: 22.0),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, size: 22.0),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    tempStories = inkurus
        .where((a) => a.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: tempStories.length,
      itemBuilder: (context, index) {
        var a = tempStories[index];
        return GestureDetector(
          onTap: () async {
            await readInkuru(a);
            close(context, a);
          },
          child: InkuruSummaryWidget(
            inkuru: a,
            isFavorite: favorites.contains(a.id),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    tempStories = inkurus
        .where((a) => a.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: tempStories.length,
      itemBuilder: (context, index) {
        var a = tempStories[index];
        return GestureDetector(
          onTap: () async {
            await readInkuru(a);
            close(context, a);
          },
          child: InkuruSummaryWidget(
            inkuru: a,
            isFavorite: favorites.contains(a.id),
          ),
        );
      },
    );
  }
}
