import 'package:flutter/material.dart';
import 'package:ikinyarwanda/interface/widgets/circular_progress_widget.dart';
import 'package:ikinyarwanda/models/inkuru.dart';
import 'package:stacked/stacked.dart';
import 'package:ikinyarwanda/interface/widgets/text_widget.dart';
import 'package:ikinyarwanda/interface/widgets/web_centered_widget.dart';

import 'isomero_view_model.dart';

class IsomeroView extends StatelessWidget {
  const IsomeroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IsomeroViewModel>.reactive(
      viewModelBuilder: () => IsomeroViewModel(),
      onViewModelReady: ((viewModel) => viewModel.getInkurus()),
      builder: (context, viewModel, child) => Scaffold(
        body: viewModel.isBusy
            ? const CircularProgressWidget()
            : WebCenteredWidget(
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      padding: const EdgeInsets.only(left: 20),
                      alignment: Alignment.center,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: viewModel.ubwoko.length,
                                itemBuilder: (_, index) {
                                  return GestureDetector(
                                    onTap: null,
                                    child: Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15.0),
                                        child: ConstrainedBox(
                                          constraints: const BoxConstraints(
                                              minWidth: 30),
                                          child: TextWidget.body(
                                              viewModel.ubwoko[index]),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.bookmark,
                              size: 24.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(thickness: 1, height: 0),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (_, index) => InkuruSummaryWidget(
                          inkuru: viewModel.inkurus[index],
                        ),
                        itemCount: viewModel.inkurus.length,
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

class InkuruSummaryWidget extends StatelessWidget {
  final Inkuru inkuru;

  const InkuruSummaryWidget({
    Key? key,
    required this.inkuru,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final summary = inkuru.content.length < 80
        ? inkuru.content
        : inkuru.content.substring(0, 80).endsWith('\n')
            ? inkuru.content.substring(0, 79) + '\u2026\u0020'
            : inkuru.content.substring(0, 80) + '\u2026\u0020';
    return Card(
      elevation: 0,
      shape: null,
      color: Theme.of(context).backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextWidget.headline3(inkuru.title),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextWidget.body(summary),
            ),
          ),
          if (inkuru.author != '')
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextWidget.caption(inkuru.author),
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextWidget.caption(inkuru.tags.join(', ')),
            ),
          ),
        ],
      ),
    );
  }
}
