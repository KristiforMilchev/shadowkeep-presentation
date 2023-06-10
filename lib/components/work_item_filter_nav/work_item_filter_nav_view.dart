import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/components/work_item_filter_nav/work_item_filter_nav_viewmodel.dart';
import 'package:stacked/stacked.dart';

class WorkItemFilterNav extends StatelessWidget {
  final Function onTapEvent;
  const WorkItemFilterNav({super.key, required this.onTapEvent});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => WorkItemFilterNavViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(),
      builder: (context, viewModel, child) => Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: viewModel.bindingData
              .map(
                (e) => InkWell(
                  onTap: () {
                    viewModel.onStateChanged(e);
                    onTapEvent.call(e.item.id, e.selected);
                  },
                  child: SvgPicture.asset(
                    "assets/images/${e.item.getIcon()}",
                    package: "domain",
                    fit: BoxFit.contain,
                    width: 25,
                    height: 25,
                    color: e.selected
                        ? ThemeStyles.actionColor
                        : ThemeStyles.fontPrimary,
                  ),
                ),
              )
              .toList()),
    );
  }
}
