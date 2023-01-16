import 'package:flutter/material.dart';
import 'package:ikinyarwanda/models/inkuru.dart';

import 'text_widget.dart';

class TagsWidget extends StatelessWidget {
  final List<String> tags;
  final List<Inkuru> stories;
  final Function(Inkuru) navigateToStory;
  final Function(String, [bool isAuthor]) navigateToCategory;

  const TagsWidget({
    Key? key,
    required this.tags,
    required this.stories,
    required this.navigateToStory,
    required this.navigateToCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                itemCount: tags.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () => navigateToCategory(tags[index]),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(minWidth: 30),
                          child: TextWiget.body(tags[index]),
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
    );
  }
}
