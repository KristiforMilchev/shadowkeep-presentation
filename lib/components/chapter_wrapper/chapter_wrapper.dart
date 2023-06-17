import 'package:domain/styles.dart';
import 'package:flutter/material.dart';

class ChapterWrapper extends StatelessWidget {
  final List<Widget> pageData;
  const ChapterWrapper({super.key, required this.pageData});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        // ignore: use_build_context_synchronously
        maxWidth: MediaQuery.of(context).size.width - 200,
      ),
      decoration: BoxDecoration(
        color: ThemeStyles.mainColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: GridView.count(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 6,
                children: pageData,
              ),
            ),
          ),
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
                child: Row(
                  children: [
                    const Icon(
                      Icons.group_rounded,
                      color: Color.fromARGB(209, 228, 225, 225),
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: Text(
                        "Penny",
                        style: ThemeStyles.whiteParagraph,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: Text(
                        "George",
                        style: ThemeStyles.whiteParagraph,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: Text(
                        "Steven",
                        style: ThemeStyles.whiteParagraph,
                      ),
                    ),
                  ],
                ),
              ),
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
                    const Icon(
                      Icons.pages,
                      color: ThemeStyles.fontPrimary,
                      size: 18,
                    ),
                    Text(
                      "${pageData.length}",
                      style: ThemeStyles.whiteParagraph,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
