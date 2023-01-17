import 'package:flutter/material.dart';
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
        body: WebCenteredWidget(
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
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(minWidth: 30),
                                    child:
                                        TextWiget.body(viewModel.ubwoko[index]),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class StoriesView extends StatefulWidget {
//   final TabsViewModel viewModel;
//   const StoriesView({Key? key, required this.viewModel}) : super(key: key);

//   @override
//   State<StoriesView> createState() => _StoriesViewState();
// }

// class _StoriesViewState extends State<StoriesView>
//     with AutomaticKeepAliveClientMixin {
//   // keep scrolling state
//   @override
//   bool get wantKeepAlive => true;

//   @override
//   Widget build(BuildContext context) {
//     final viewModel = widget.viewModel;
//     super.build(context);
//     return viewModel.isBusy || viewModel.stories.isEmpty
//         ? Center(
//             child: CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation(
//                 Theme.of(context).primaryColor,
//               ),
//               strokeWidth: 3,
//             ),
//           )
//         : Column(
//             children: [
//               const Divider(thickness: 0, height: 0),
//               // TagsWidget(
//               //   tags: viewModel.categories,
//               //   stories: viewModel.stories,
//               //   navigateToStory: viewModel.navigateToInkuruView,
//               //   navigateToCategory: viewModel.navigateToCategoryView,
//               // ),
//               const Divider(thickness: 0, height: 0),
//               Expanded(
//                 child: WebCenteredWidget(
//                   child: ListView.builder(
//                     itemCount: viewModel.stories.length,
//                     itemBuilder: (context, index) {
//                       return CreationAwareListItem(
//                         itemCreated: () {

//                         },
//                         child: GestureDetector(
//                           onTap: () => viewModel.navigateToInkuruView(
//                             viewModel.stories[index],
//                           ),
//                           child: InkuruSummaryWidget(
//                             inkuru: viewModel.stories[index],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           );
//   }
// }
