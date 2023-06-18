import 'package:domain/models/character.dart';
import 'package:domain/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/character_card/character_card_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CharacterCardViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(character),
      builder: (context, viewModel, child) => Container(
        padding: const EdgeInsets.all(20),
        color: ThemeStyles.secondaryColor,
        child: Container(
          decoration: BoxDecoration(
            color: ThemeStyles.mainColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: ThemeStyles.fontSecondary,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(6),
                        topLeft: Radius.circular(6),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_tree_sharp,
                          size: 20,
                          color: ThemeStyles.secondaryColor,
                        ),
                        Text(
                          viewModel.references,
                          style: ThemeStyles.regularParagraphOv(
                            size: 25,
                            color: ThemeStyles.secondaryColor,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: ThemeStyles.fontSecondary,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(6),
                        bottomLeft: Radius.circular(6),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: 20,
                          color: ThemeStyles.secondaryColor,
                        ),
                        Text(
                          viewModel.character == null
                              ? "--"
                              : "${viewModel.character?.firstName} ${viewModel.character?.lastName}",
                          style: ThemeStyles.regularParagraphOv(
                            size: 20,
                            color: ThemeStyles.secondaryColor,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: ThemeStyles.fontSecondary,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(6),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.timelapse_outlined,
                          size: 20,
                          color: ThemeStyles.secondaryColor,
                        ),
                        Text(
                          viewModel.character == null
                              ? "--"
                              : viewModel.character!.age.toString(),
                          style: ThemeStyles.regularParagraphOv(
                            size: 20,
                            color: ThemeStyles.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
                      child: Text(
                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                        style: ThemeStyles.regularParagraph,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 25,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: ThemeStyles.secondaryColor.withAlpha(120),
                ),
                child: ListView.builder(
                  itemCount: 40,
                  primary: false,
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  dragStartBehavior: DragStartBehavior.start,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.fromLTRB(6, 0, 6, 0),
                    child: Text(
                      "Quirky",
                      style: ThemeStyles.regularParagraphOv(
                        color: ThemeStyles.fontPrimary,
                      ),
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
