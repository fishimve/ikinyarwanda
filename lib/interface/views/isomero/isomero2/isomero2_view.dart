import 'package:flutter/material.dart';
import 'package:ikinyarwanda/interface/widgets/text_widget.dart';
import 'package:stacked/stacked.dart';

import 'isomero2_view_model.dart';

class Isomero2View extends StatelessWidget {
  final String tag;
  const Isomero2View({
    Key? key,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Isomero2ViewModel>.reactive(
      viewModelBuilder: () => Isomero2ViewModel(),
      createNewViewModelOnInsert: true,
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).backgroundColor,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 25,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () => Navigator.of(context).pop(),
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
                  size: 24.0,
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
