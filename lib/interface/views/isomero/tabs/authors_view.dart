import 'package:flutter/material.dart';
import 'package:ikinyarwanda/interface/widgets/text_widget.dart';
import 'package:ikinyarwanda/interface/widgets/web_centered_widget.dart';
import 'package:ikinyarwanda/shared/ui_helpers.dart';

import 'tabs_view_model.dart';

class AuthorsView extends StatefulWidget {
  final TabsViewModel viewModel;

  const AuthorsView({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<AuthorsView> createState() => _AuthorsViewState();
}

class _AuthorsViewState extends State<AuthorsView>
    with AutomaticKeepAliveClientMixin {
  // keep scrolling state
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WebCenteredWidget(
      child: ListView.builder(
        itemCount: widget.viewModel.authors.length,
        itemBuilder: (context, index) {
          var author = widget.viewModel.authors[index];
          return GestureDetector(
            onTap: () => widget.viewModel.navigateToCategoryView(author, true),
            child: Padding(
              padding: basePadding,
              child: TextWiget.body(author),
            ),
          );
        },
      ),
    );
  }
}
