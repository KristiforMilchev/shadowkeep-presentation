import 'package:domain/models/work_item_group.dart';
import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StoryHeader extends StatelessWidget {
  final WorkItemGroup story;
  final Function callback;
  const StoryHeader({super.key, required this.story, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => callback.call(),
          child: Container(
            color: ThemeStyles.secondaryColor,
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/images/book.svg",
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
                  story.groupName,
                  style: ThemeStyles.regularHeading,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  width: 6,
                ),
                Icon(
                  Icons.add,
                  color: ThemeStyles.actionColor,
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            Container(
              color: ThemeStyles.secondaryColor,
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/new.svg",
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
                        "1",
                        style: ThemeStyles.regularHeading,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/active.svg",
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
                        "1",
                        style: ThemeStyles.regularHeading,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/testing.svg",
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
                        "1",
                        style: ThemeStyles.regularHeading,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/done.svg",
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
                        "1",
                        style: ThemeStyles.regularHeading,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
