import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/custom_icon_button/custom_icon_button.dart';
import 'package:presentation/components/size_control.dart/size_control_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SizeControl extends StatelessWidget {
  final Function callbackSizeChanged;
  final String tooltip;
  final int size;

  const SizeControl({
    super.key,
    required this.callbackSizeChanged,
    required this.size,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SizeControlViewModel(),
      onViewModelReady: (viewModel) =>
          viewModel.ready(callbackSizeChanged, size),
      builder: (context, viewModel, child) => Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: ThemeStyles.mainColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: Row(children: [
          CustomIconButton(
            tooltipMessage: "Decreases the size",
            solidColor: ThemeStyles.mainColor,
            icon: const Icon(
              Icons.remove,
              color: ThemeStyles.actionColor,
              size: 30,
            ),
            label: "",
            callback: viewModel.onSizeDecreased,
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: ThemeStyles.mainColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
              ),
            ),
            child: Text(
              viewModel.currentSize,
              style: ThemeStyles.regularParagraph,
            ),
          ),
          CustomIconButton(
            tooltipMessage: "Increase the size",
            solidColor: ThemeStyles.mainColor,
            icon: const Icon(
              Icons.add,
              color: ThemeStyles.actionColor,
              size: 30,
            ),
            label: "",
            callback: viewModel.onSizeIncreased,
          ),
        ]),
      ),
    );
  }
}
