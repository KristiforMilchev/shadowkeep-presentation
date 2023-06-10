import 'package:flutter/widgets.dart';
import 'package:presentation/components/splashscreen/splashscreen_viewmodel.dart';
import 'package:stacked/stacked.dart';

class Splashscreen extends StatelessWidget {
  final Function callback;
  const Splashscreen({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SplashScreenViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(callback),
      builder: (context, viewModel, child) => const Placeholder(),
    );
  }
}
