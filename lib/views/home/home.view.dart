import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/bottom_nav_bar/bottom_nav_bar_view.dart';
import 'package:presentation/components/custom_button/custom_button.dart';
import 'package:presentation/components/custom_icon_button/custom_icon_button.dart';
import 'package:presentation/components/custom_text_field/custom_text_field.dart';

import 'package:stacked/stacked.dart';

import 'home.viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(context),
      builder: (context, viewModel, child) => Material(
        color: ThemeStyles.mainColor,
        child: Column(
          children: [
            NavBar(
              barContent: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIconButton(
                      icon: const Icon(
                        Icons.add,
                        color: ThemeStyles.fontSecondary,
                      ),
                      fontColor: ThemeStyles.fontSecondary,
                      label: "Add",
                      callback: viewModel.onAddNewBook,
                    ),
                    SizedBox(
                      width: 500,
                      child: CustomTextField(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: ThemeStyles.fontSecondary,
                        ),
                        borderRadius: 0,
                        floatingLabel: "",
                        onChange: viewModel.onSearchChanged,
                      ),
                    ),
                    CustomIconButton(
                      icon: const Icon(
                        Icons.settings,
                        color: ThemeStyles.fontSecondary,
                      ),
                      label: "Settings",
                      fontColor: ThemeStyles.fontSecondary,
                      callback: viewModel.onAddNewBook,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.books.length,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      decoration: BoxDecoration(
                        color: ThemeStyles.secondaryColor,
                      ),
                      child: CustomButton(
                        callback: () => viewModel.onBookSelected(
                          viewModel.books.elementAt(index),
                        ),
                        widget: Column(
                          children: [
                            Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  child: Row(
                                    children: [
                                      ...viewModel.books
                                          .elementAt(index)
                                          .categories
                                          .map(
                                            (e) => Container(
                                              decoration: BoxDecoration(
                                                color: ThemeStyles.mainColor,
                                              ),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(6),
                                                child: Text(
                                                  e,
                                                  style: ThemeStyles
                                                      .regularParagraph,
                                                ),
                                              ),
                                            ),
                                          )
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: ThemeStyles.mainColor,
                                    ),
                                    padding: const EdgeInsets.all(6),
                                    child: Text(
                                      viewModel.books.elementAt(index).title,
                                      style: ThemeStyles.regularHeading,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: CustomIconButton(
                                    icon: const Icon(
                                      Icons.remove_circle_outline,
                                      color: ThemeStyles.fontPrimary,
                                    ),
                                    label: "",
                                    callback: () => viewModel.removeBook(
                                      viewModel.books.elementAt(index),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(60),
                              child: const Icon(
                                Icons.menu_book_sharp,
                                color: ThemeStyles.fontPrimary,
                                size: 96,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                viewModel.books.elementAt(index).description,
                                style: ThemeStyles.regularParagraphOv(
                                  size: 16,
                                  color: ThemeStyles.fontPrimary,
                                ),
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                              color: ThemeStyles.fontSecondary,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
