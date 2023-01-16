import 'package:flutter/material.dart';
import 'package:ikinyarwanda/interface/widgets/story_widget.dart';
import 'package:ikinyarwanda/interface/widgets/text_widget.dart';
import 'package:ikinyarwanda/interface/widgets/web_centered_widget.dart';

import 'tabs_view_model.dart';

class BookmarksView extends StatefulWidget {
  final TabsViewModel viewModel;

  const BookmarksView({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<BookmarksView> createState() => _BookmarksViewState();
}

class _BookmarksViewState extends State<BookmarksView>
    with AutomaticKeepAliveClientMixin {
  // keep scrolling state
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    var favorites = widget.viewModel.favoriteStories;

    if (favorites.isEmpty) {
      return Center(
        child: TextWiget.body('Harimo ubusa'),
      );
    } else {
      return WebCenteredWidget(
        child: ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => widget.viewModel.navigateToInkuruView(
              widget.viewModel.favoriteStories[index],
            ),
            child: StoryWidget(
              story: widget.viewModel.favoriteStories[index],
            ),
          ),
        ),
      );
    }
  }
}
