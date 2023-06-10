import 'package:domain/styles.dart';
import 'package:flutter/material.dart';

import '../bottom_nav_bar/bottom_nav_bar_view.dart';

class PlannerFrame extends StatelessWidget {
  final Widget child;
  const PlannerFrame({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Material(
        color: ThemeStyles.mainColor,
        child: Column(
          children: [
            Container(
              height: 30,
              color: ThemeStyles.secondaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),
            ),
            child,
            // const NavBar()
          ],
        ),
      ),
    );
  }
}
