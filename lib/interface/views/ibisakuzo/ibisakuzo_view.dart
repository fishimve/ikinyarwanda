import 'package:flutter/material.dart';
import 'package:ikinyarwanda/interface/widgets/button_widget.dart';
import 'package:ikinyarwanda/interface/widgets/circular_progress_widget.dart';
import 'package:ikinyarwanda/interface/widgets/dots_indicator.dart';
import 'package:ikinyarwanda/interface/widgets/text_widget.dart';
import 'package:ikinyarwanda/interface/widgets/web_centered_widget.dart';
import 'package:ikinyarwanda/models/igisakuzo.dart';
import 'package:ikinyarwanda/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'ibisakuzo_view_model.dart';

class IbisakuzoView extends StatefulWidget {
  const IbisakuzoView({Key? key}) : super(key: key);

  @override
  _IbisakuzoViewState createState() => _IbisakuzoViewState();
}

class _IbisakuzoViewState extends State<IbisakuzoView>
    with TickerProviderStateMixin {
  late PageController _controller;
  var _currentPage = 0;
  var _isLastPage = false;
  static const _duration = Duration(milliseconds: 300);
  static const _curve = Curves.ease;

  @override
  void initState() {
    _controller = PageController(initialPage: _currentPage);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IbisakuzoViewModel>.reactive(
      viewModelBuilder: () => IbisakuzoViewModel(),
      onViewModelReady: (viewModel) => viewModel.getIbisakuzo(),
      builder: (context, viewModel, child) => Scaffold(
        body: viewModel.isBusy
            ? const CircularProgressWidget()
            : WebCenteredWidget(
                child: SafeArea(
                  child: Stack(
                    children: [
                      PageView.builder(
                        pageSnapping: true,
                        allowImplicitScrolling: false,
                        reverse: false,
                        scrollDirection: Axis.horizontal,
                        itemCount: viewModel.ibisakuzoIcumi.length,
                        controller: _controller,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                            _isLastPage = _currentPage ==
                                viewModel.ibisakuzoIcumi.length - 1;
                          });
                        },
                        itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: basePadding,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: viewModel.showAboutDialog,
                                child: TextWidget.headline1(
                                  'Sakwe Sakwe?',
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            verticalSpaceLarge,
                            Flexible(
                              child: IgisakuzoWidget(
                                igisakuzo: viewModel.ibisakuzoIcumi[index],
                                updateScore: viewModel.updateScore,
                              ),
                            ),
                            verticalSpaceSmall,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextWidget.caption(
                                  viewModel.correctScore.toString(),
                                ),
                                horizontalSpaceTiny,
                                const Icon(
                                  Icons.check,
                                  size: 18,
                                ),
                                horizontalSpaceSmall,
                                TextWidget.caption(
                                  viewModel.wrongScore.toString(),
                                ),
                                horizontalSpaceTiny,
                                const Icon(
                                  Icons.close,
                                  size: 18,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (!_isLastPage)
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(
                              10,
                            ),
                            child: Center(
                              child: DotsIndicator(
                                controller: _controller,
                                itemCount: viewModel.ibisakuzoIcumi.length,
                                color: Theme.of(context).primaryColor,
                                onPageSelected: (int page) {
                                  _controller.animateToPage(
                                    page,
                                    duration: _duration,
                                    curve: _curve,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      if (_isLastPage)
                        Positioned(
                          bottom: 10.0,
                          left: 0.0,
                          right: 0.0,
                          child: Padding(
                            padding: basePadding,
                            child: ButtonWidget(
                              title: 'Ibindi bisakuzo',
                              busy: viewModel.isBusy,
                              onTap: () async {
                                await viewModel.getIbisakuzo();
                                setState(() {
                                  _isLastPage = false;
                                  _currentPage = 0;
                                  _controller.jumpTo(0);
                                });
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class IgisakuzoWidget extends StatelessWidget {
  final Igisakuzo igisakuzo;
  final Function(bool) updateScore;

  const IgisakuzoWidget({
    Key? key,
    required this.igisakuzo,
    required this.updateScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: basePadding,
      color: Theme.of(context).backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
                vertical: 25.0,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  topRight: Radius.circular(borderRadius),
                ),
              ),
              child: TextWidget.headline2(
                igisakuzo.question,
                align: TextAlign.center,
                color: Theme.of(context).backgroundColor,
              ),
            ),
          ),
          verticalSpaceSmall,
          OptionWidget(
            optionText: igisakuzo.option1,
            correctAnswer: igisakuzo.correctAnswer,
            updateScore: updateScore,
          ),
          OptionWidget(
            optionText: igisakuzo.option2,
            correctAnswer: igisakuzo.correctAnswer,
            updateScore: updateScore,
          ),
          OptionWidget(
            optionText: igisakuzo.option3,
            correctAnswer: igisakuzo.correctAnswer,
            updateScore: updateScore,
          ),
          OptionWidget(
            optionText: igisakuzo.option4,
            correctAnswer: igisakuzo.correctAnswer,
            updateScore: updateScore,
          ),
        ],
      ),
    );
  }
}

class OptionWidget extends StatefulWidget {
  final String optionText;
  final String correctAnswer;
  final Function(bool) updateScore;
  const OptionWidget({
    Key? key,
    required this.optionText,
    required this.correctAnswer,
    required this.updateScore,
  }) : super(key: key);

  @override
  _GameOptionState createState() => _GameOptionState();
}

class _GameOptionState extends State<OptionWidget> {
  late bool _isCorrect;
  late bool _isWrong;

  @override
  void initState() {
    _isCorrect = false;
    _isWrong = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 12.0,
      ),
      constraints: const BoxConstraints(
        minHeight: 50,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: _isCorrect
            ? Theme.of(context).primaryColor
            : Theme.of(context).backgroundColor,
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: () {
          setState(() {
            if (widget.optionText == widget.correctAnswer) {
              if (!_isCorrect && !_isWrong) {
                widget.updateScore(true);
                _isCorrect = true;
              }
            } else {
              if (!_isCorrect && !_isWrong) {
                widget.updateScore(false);
                _isWrong = true;
              }
            }
          });
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: TextWidget.body(
                  widget.optionText,
                  color: _isCorrect
                      ? Theme.of(context).backgroundColor
                      : _isWrong
                          ? Theme.of(context).errorColor
                          : Theme.of(context).primaryColor,
                ),
              ),
              horizontalSpaceTiny,
              _isCorrect
                  ? Icon(
                      Icons.check,
                      color: Theme.of(context).backgroundColor,
                      size: 16,
                    )
                  : _isWrong
                      ? Icon(
                          Icons.close,
                          color: Theme.of(context).errorColor,
                          size: 16,
                        )
                      : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
