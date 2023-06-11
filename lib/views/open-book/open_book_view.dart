import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:presentation/components/bottom_nav_bar/bottom_nav_bar_view.dart';
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
          ],
        ),
      ),
    );
  }
}
