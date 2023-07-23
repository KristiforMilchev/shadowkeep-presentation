import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/custom_icon_button/custom_icon_button.dart';
import 'package:presentation/components/nav_bar_inner/nav_bar_inner_viewmodel.dart';
import 'package:stacked/stacked.dart';

class NavBarInner extends StatelessWidget {
  const NavBarInner({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => NavBarInnerViewModel(),
        builder: (context, viewModel, child) => Container(
              color: ThemeStyles.secondaryColor,
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 81,
                    child: CustomIconButton(
                      height: 30,
                      solidColor: ThemeStyles.mainColor,
                      label: "Donate",
                      callback: viewModel.onDonatePressed,
                    ),
                  ),
                  SizedBox(
                    width: 81,
                    child: CustomIconButton(
                      height: 30,
                      icon: const Icon(
                        Icons.close,
                        semanticLabel: "Close",
                        color: ThemeStyles.fontPrimary,
                      ),
                      solidColor: ThemeStyles.mainColor,
                      label: "Close",
                      callback: () => viewModel.router.backToPrevious(context),
                    ),
                  ),
                ],
              ),
            ));
  }
}
