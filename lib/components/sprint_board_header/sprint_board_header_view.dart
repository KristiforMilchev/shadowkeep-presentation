import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/components/sprint_board_header/sprint_board_header_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SprintBoardHeader extends StatelessWidget {
  const SprintBoardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SprintBoardHeaderViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(),
      builder: (context, viewModel, child) => Row(
        children: [
          ...viewModel.boards.map(
            (e) => Expanded(
              child: Container(
                margin:
                    viewModel.boards.indexOf(e) == viewModel.boards.length - 1
                        ? null
                        : const EdgeInsets.fromLTRB(0, 0, 16, 0),
                color: ThemeStyles.secondaryColor,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: ThemeStyles.mainColor,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/images/${e.icon}",
                                package: "domain",
                                fit: BoxFit.contain,
                                width: 25,
                                height: 25,
                                color: ThemeStyles.fontPrimary,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                e.name,
                                style: ThemeStyles.regularHeading,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 81,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: ThemeStyles.mainColor,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12),
                            ),
                          ),
                          child: Text(
                            e.workItems.length.toString(),
                            style: ThemeStyles.regularHeading,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: 81,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: ThemeStyles.mainColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                            ),
                          ),
                          child: Text(
                            viewModel.sumRemaining(e.id),
                            style: ThemeStyles.regularHeading,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
