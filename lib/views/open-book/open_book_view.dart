import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/bottom_nav_bar/bottom_nav_bar_view.dart';
import 'package:presentation/components/relation_graph/relational_graph_view.dart';
import 'package:presentation/views/open-book/open_book_viewmodel.dart';
import 'package:stacked/stacked.dart';

class OpenBookView extends StatelessWidget {
  const OpenBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => OpenBookViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(context),
      builder: (context, viewModel, child) => Material(
        child: Column(
          children: [
            const NavBar(
              barContent: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  const Expanded(
                    child: RelationalGraphView(
                      orintation: Axis.vertical,
                      observable: "characterGraph",
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      color: ThemeStyles.secondaryColor,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ThemeStyles.mainColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
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
                                        "22",
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
                                        "Steve Stenly",
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
                                        "23",
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
                            Expanded(
                              child: Text("Description"),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color:
                                    ThemeStyles.secondaryColor.withAlpha(120),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                                    child: Text(
                                      "Quirky",
                                      style: ThemeStyles.regularParagraphOv(
                                        color: ThemeStyles.fontPrimary,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                                    child: Text(
                                      "Quirky",
                                      style: ThemeStyles.regularParagraphOv(
                                        color: ThemeStyles.fontPrimary,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                                    child: Text(
                                      "Quirky",
                                      style: ThemeStyles.regularParagraphOv(
                                        color: ThemeStyles.fontPrimary,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                                    child: Text(
                                      "Quirky",
                                      style: ThemeStyles.regularParagraphOv(
                                        color: ThemeStyles.fontPrimary,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                                    child: Text(
                                      "Quirky",
                                      style: ThemeStyles.regularParagraphOv(
                                        color: ThemeStyles.fontPrimary,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                                    child: Text(
                                      "Quirky",
                                      style: ThemeStyles.regularParagraphOv(
                                        color: ThemeStyles.fontPrimary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Placeholder(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: RelationalGraphView(
                orintation: Axis.horizontal,
                observable: "chapterGraph",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
