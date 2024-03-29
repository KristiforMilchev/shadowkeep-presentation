import 'package:flutter/material.dart';
import 'package:presentation/components/custom_button/custom_button_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CustomButton extends StatelessWidget {
  final Function callback;
  final Widget widget;
  final bool enabled;
  final String? tooltipMessage;
  const CustomButton({
    super.key,
    required this.widget,
    required this.callback,
    this.enabled = true,
    this.tooltipMessage,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CustomButtonViewModel(),
      builder: (context, viewModel, child) => Tooltip(
        message: tooltipMessage ?? "",
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => enabled ? viewModel.onButtonPressed(callback) : {},
          child: Opacity(opacity: viewModel.opacity, child: widget),
        ),
      ),
    );
  }
}
