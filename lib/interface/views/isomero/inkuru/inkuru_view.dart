import 'package:flutter/material.dart';
import 'package:ikinyarwanda/interface/widgets/text_widget.dart';
import 'package:ikinyarwanda/interface/widgets/web_centered_widget.dart';
import 'package:ikinyarwanda/models/inkuru.dart';
import 'package:ikinyarwanda/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'Inkuru_view_model.dart';



class InkuruView extends StatelessWidget {
  final Inkuru inkuru;
  const InkuruView({Key? key, required this.inkuru}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InkuruViewModel>.reactive(
      viewModelBuilder: () => InkuruViewModel(),
      onViewModelReady: (viewModel) => viewModel.getFavoriteStatus(inkuru.id),
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
              onPressed: viewModel.navigatorPop,
            ),
            title: TextWidget.headline3(inkuru.title),
            actions: [
              IconButton(
                onPressed:null,
                icon: Icon(
                  viewModel.isFavorite
                      ? Icons.bookmark_added
                      : Icons.bookmark_add_outlined,
                  size: 25,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
          body: WebCenteredWidget(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpaceSmall,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                    ),
                    child: TextWidget.body(inkuru.content),
                  ),
                  if (inkuru.author != '-') ...[
                    verticalSpaceMedium,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                      ),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: TextWidget.body(
                          inkuru.author,
                          fontWeight: 2,
                        ),
                      ),
                    ),
                  ],
                  if (inkuru.tags != []) ...[
                    verticalSpaceSmall,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                      ),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: TextWidget.caption(
                          inkuru.tags.join(', '),
                        ),
                      ),
                    ),
                  ],
                  verticalSpaceMedium,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
