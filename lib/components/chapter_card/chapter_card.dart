import 'package:domain/models/chapter.dart';
import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/custom_button/custom_button.dart';

class ChapterCard extends StatelessWidget {
  final Chapter chapter;
  const ChapterCard({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      color: ThemeStyles.mainColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.book_outlined,
                color: ThemeStyles.fontSecondary,
                size: 25,
              ),
              Expanded(
                child: Text(
                  chapter.pageTitle,
                  style: ThemeStyles.innerHeading,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                chapter.shortDescription ?? "",
                style: ThemeStyles.regularParagraph,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: ThemeStyles.secondaryColor,
                child: CustomButton(
                  callback: () {},
                  widget: Row(
                    children: [
                      const Icon(
                        Icons.add,
                        color: ThemeStyles.actionColor,
                      ),
                      Text(
                        "Add new page",
                        style: ThemeStyles.regularParagraphOv(
                          color: ThemeStyles.actionColor,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
