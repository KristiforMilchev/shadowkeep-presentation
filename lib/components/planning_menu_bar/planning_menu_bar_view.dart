import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/planning_menu_bar/planning_menu_bar_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PlanningMenuBar extends StatelessWidget {
  const PlanningMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PlanningMenuBarViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(context),
      builder: (context, viewModel, child) => Container(
        color: ThemeStyles.secondaryColor,
        child: SizedBox(
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: viewModel.onSprintPlanningPressed,
                child: const Icon(
                  Icons.broadcast_on_home_sharp,
                  size: 32,
                  color: ThemeStyles.fontSecondary,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: viewModel.openBoardPressed,
                child: const Icon(
                  Icons.developer_board,
                  size: 32,
                  color: ThemeStyles.fontSecondary,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: viewModel.openFinancePressed,
                child: const Icon(
                  Icons.stacked_line_chart_rounded,
                  size: 32,
                  color: ThemeStyles.fontSecondary,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: viewModel.openSprintPlanner,
                child: const Icon(
                  Icons.calendar_month_outlined,
                  size: 32,
                  color: ThemeStyles.fontSecondary,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: () => {},
                child: const Icon(
                  Icons.logo_dev_rounded,
                  size: 32,
                  color: ThemeStyles.fontSecondary,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: () => {},
                child: const Icon(
                  Icons.settings,
                  size: 32,
                  color: ThemeStyles.fontSecondary,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
