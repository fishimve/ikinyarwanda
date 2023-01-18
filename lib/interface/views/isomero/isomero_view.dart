import 'package:flutter/material.dart';
import 'package:ikinyarwanda/interface/widgets/circular_progress_widget.dart';
import 'package:ikinyarwanda/interface/widgets/inkuru_summary_widget.dart';
import 'package:ikinyarwanda/interface/widgets/search_widget.dart';
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
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
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
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: Icon(
                          //     Icons.info_outline,
                          //     size: 14.0,
                          //     color: Theme.of(context).primaryColor,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                itemBuilder: (_, index) => GestureDetector(
                                  onTap: null,
                                  child: Center(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 15.0),
                                      child: ConstrainedBox(
                                        constraints: const BoxConstraints(
                                          minWidth: 30,
                                        ),
                                        child: index == 0
                                            ? Center(
                                                child: IconButton(
                                                  padding: EdgeInsets.zero,
                                                  constraints:
                                                      const BoxConstraints(),
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.bookmark_border,
                                                    size: 22.0,
                                                  ),
                                                ),
                                              )
                                            : TextWidget.body(
                                                viewModel.ubwoko[index],
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            padding: const EdgeInsets.only(left: 8),
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              showSearch(
                                context: context,
                                delegate: SearchWidget(
                                  inkurus: viewModel.inkurus,
                                  readInkuru: viewModel.navigateToInkuruView,
                                  searchLabel: 'Shakisha',
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.search,
                              size: 22.0,
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
