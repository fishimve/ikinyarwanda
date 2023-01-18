import 'package:flutter/material.dart';
import 'package:ikinyarwanda/interface/widgets/text_widget.dart';
import 'package:stacked/stacked.dart';

import 'tagged_isomero_view_model.dart';

class TaggedIsomeroView extends StatelessWidget {
  final String tag;
  const TaggedIsomeroView({
    Key? key,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TaggedIsomeroViewModel>.reactive(
      viewModelBuilder: () => TaggedIsomeroViewModel(),
      createNewViewModelOnInsert: true,
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).backgroundColor,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: viewModel.navigateBack,
            ),
            title: TextWidget.headline1(tag),
            actions: [
              IconButton(
                onPressed: () {
                  // showSearch(
                  //   context: context,
                  //   delegate: StoriesSearchWidget(
                  //     stories: stories,
                  //     readStory: viewModel.navigateToStory,
                  //     searchByChar: viewModel.searchByFirstChar,
                  //     searchLabel: AppLocalizations.of(context)!.search,
                  //   ),
                  // );
                },
                icon: Icon(
                  Icons.search,
                  size: 30.0,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          body: Container(),
        );
      },
    );
  }
}
