import 'package:flutter/material.dart';
import 'package:ikinyarwanda/interface/widgets/circular_progress_widget.dart';
import 'package:ikinyarwanda/models/inkuru.dart';
import 'package:ikinyarwanda/shared/ui_helpers.dart';
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: basePadding,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: viewModel.showAboutDialog,
                        child: TextWidget.headline1(
                          'Isomero',
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
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
                                            minWidth: 30,
                                          ),
                                          child: TextWidget.body(
                                            viewModel.ubwoko[index],
                                          ),
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
                      child: ListView.separated(
                        separatorBuilder: (_, index) => const Divider(
                          indent: 25,
                          endIndent: 25,
                          thickness: 1,
                          height: 0,
                        ),
                        primary: true,
                        shrinkWrap: true,
                        itemCount: viewModel.inkurus.length,
                        itemBuilder: (_, index) => GestureDetector(
                          onTap: () => viewModel.navigateToInkuruView(
                            viewModel.inkurus[index],
                          ),
                          child: InkuruSummaryWidget(
                            inkuru: viewModel.inkurus[index],
                          ),
                        ),
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
          if (inkuru.author != '' || inkuru.tags.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextWidget.caption(
                      inkuru.author == ''
                          ? inkuru.tags.join(', ')
                          : '${inkuru.author} | ${inkuru.tags.join(', ')}',
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextWidget.headline3(
                inkuru.title,
                align: TextAlign.center,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextWidget.body(summary),
            ),
          ),
        ],
      ),
    );
  }
}
