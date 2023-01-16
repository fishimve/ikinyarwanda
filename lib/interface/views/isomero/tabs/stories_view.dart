import 'package:flutter/material.dart';
import 'package:ikinyarwanda/interface/widgets/creation_aware_list_item.dart';
import 'package:ikinyarwanda/interface/widgets/story_widget.dart';
import 'package:ikinyarwanda/interface/widgets/tags_widget.dart';
import 'package:ikinyarwanda/interface/widgets/web_centered_widget.dart';

import 'tabs_view_model.dart';

class StoriesView extends StatefulWidget {
  final TabsViewModel viewModel;
  const StoriesView({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<StoriesView> createState() => _StoriesViewState();
}

class _StoriesViewState extends State<StoriesView>
    with AutomaticKeepAliveClientMixin {
  // keep scrolling state
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final viewModel = widget.viewModel;
    super.build(context);
    return viewModel.isBusy || viewModel.stories.isEmpty
        ? Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                Theme.of(context).primaryColor,
              ),
              strokeWidth: 3,
            ),
          )
        : Column(
            children: [
              const Divider(thickness: 0, height: 0),
              TagsWidget(
                tags: viewModel.categories,
                stories: viewModel.stories,
                navigateToStory: viewModel.navigateToInkuruView,
                navigateToCategory: viewModel.navigateToCategoryView,
              ),
              const Divider(thickness: 0, height: 0),
              Expanded(
                child: WebCenteredWidget(
                  child: ListView.builder(
                    itemCount: viewModel.stories.length,
                    itemBuilder: (context, index) {
                      return CreationAwareListItem(
                        itemCreated: () {
                       
                        },
                        child: GestureDetector(
                          onTap: () => viewModel.navigateToInkuruView(
                            viewModel.stories[index],
                          ),
                          child: StoryWidget(
                            story: viewModel.stories[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
  }
}
