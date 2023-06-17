import 'package:domain/models/book_page.dart';
import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/custom_button/custom_button.dart';

class PageCard extends StatelessWidget {
  final BookPage page;
  const PageCard({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: ThemeStyles.secondaryColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ThemeStyles.secondaryColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Icon(
                    Icons.insert_drive_file_rounded,
                    color: ThemeStyles.fontPrimary,
                    size: 18,
                  )),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ThemeStyles.secondaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                  ),
                ),
                child: Row(
                  children: [
                    CustomButton(
                      widget: const Icon(
                        Icons.edit,
                        color: ThemeStyles.actionColor,
                        size: 18,
                      ),
                      callback: () {},
                    ),
                    CustomButton(
                      widget: const Icon(
                        Icons.delete,
                        color: ThemeStyles.actionColor,
                        size: 18,
                      ),
                      callback: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: page.content.length,
              itemBuilder: (context, index) => Text(
                page.content.elementAt(index),
                style: ThemeStyles.regularParagraph,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
