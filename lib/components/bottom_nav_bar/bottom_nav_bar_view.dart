import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/bottom_nav_bar/nav_bar_viewmodel.dart';
import 'package:presentation/components/custom_icon_button/custom_icon_button.dart';
import 'package:stacked/stacked.dart';

class NavBar extends StatelessWidget {
  final Widget barContent;

  const NavBar({super.key, required this.barContent});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => NavBarViewModel(),
      builder: (context, viewModel, child) => Container(
        color: ThemeStyles.secondaryColor,
        height: 30,
        child: Row(
          children: [
            SizedBox(
              width: 81,
              child: CustomIconButton(
                solidColor: ThemeStyles.mainColor,
                label: "Donate",
                callback: viewModel.onDonatePressed,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            barContent,
            SizedBox(
              width: 81,
              child: CustomIconButton(
                icon: Icon(
                  Icons.notifications,
                  semanticLabel: "Notifications",
                  color: ThemeStyles.fontPrimary,
                ),
                solidColor: ThemeStyles.mainColor,
                label: "5",
                callback: viewModel.onNotificationsPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
