import 'package:flutter/material.dart';
import 'package:presentation/views/open-book/open_book_viewmodel.dart';
import 'package:stacked/stacked.dart';

class OpenBookView extends StatelessWidget {
  const OpenBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => OpenBookViewModel(),
      builder: (context, viewModel, child) => const Placeholder(),
    );
  }
}
