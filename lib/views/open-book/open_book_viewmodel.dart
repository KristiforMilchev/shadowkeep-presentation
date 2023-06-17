import 'package:domain/models/chapter.dart';
import 'package:domain/models/character.dart';
import 'package:domain/models/relational_binding.dart';
import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:infrastructure/interfaces/ichapter_service.dart';
import 'package:infrastructure/interfaces/icharacter_service.dart';
import 'package:infrastructure/interfaces/ipage_service.dart';
import 'package:presentation/components/custom_button/custom_button.dart';

import '../../../page_view_model.dart';

class OpenBookViewModel extends PageViewModel {
  late BuildContext _context;
  late ICharacterService _characterService;
  late IChapterService _chapterService;
  late IPageService _pageService;
  List<Character> _characters = [];
  List<Chapter> _chapters = [];
  ready(BuildContext context) async {
    _context = context;

    _characterService = getIt.get<ICharacterService>();
    _chapterService = getIt.get<IChapterService>();
    _pageService = getIt.get<IPageService>();
    _chapterService.setBookId(sessionManager.bookId);
    _pageService.setBookId(sessionManager.bookId);

    await loadCharacters();
    await loadChapters();
  }

  Future loadCharacters() async {
    _characters =
        await _characterService.getRelatedCharacters(sessionManager.bookId);

    List<RelationalBinding> _bindingData = [];
    int i = 0;
    for (var character in _characters) {
      var currentCharacter = RelationalBinding(
        id: i,
        content: Container(
          height: 100,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: ThemeStyles.mainColor,
            shape: BoxShape.circle,
          ),
          child: Column(
            children: [
              const Icon(
                Icons.account_circle_outlined,
                color: ThemeStyles.fontPrimary,
                size: 32,
              ),
              const SizedBox(height: 16),
              Text(
                character.firstName,
                style: ThemeStyles.innerHeading,
              ),
            ],
          ),
        ),
      );
      var related = await _characterService.getEncounters(
        character.id,
        sessionManager.bookId,
      );

      currentCharacter.related = related
          .map(
            (e) => RelationalBinding(
              id: i++,
              content: Container(
                height: 100,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ThemeStyles.mainColor,
                  shape: BoxShape.circle,
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.account_circle_outlined,
                      color: ThemeStyles.fontPrimary,
                      size: 32,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      e.firstName,
                      style: ThemeStyles.innerHeading,
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList();
      _bindingData.add(currentCharacter);
    }
    await observer.getObserver("characterGraph").call(_bindingData);
  }

  Future loadChapters() async {
    _chapters = await _chapterService.getAllChapters(sessionManager.bookId);

    List<RelationalBinding> _bindingData = [];
    var i = 0;
    int index = i;
    int o = 0;
    for (var chapter in _chapters) {
      var currentChapter = RelationalBinding(
        id: i,
        content: Container(
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
        ),
        relatedTo: o == 0 ? null : o,
      );
      _bindingData.add(currentChapter);
      currentChapter.related = [];
      var pages = await _pageService.getChapterPages(chapter.id);
      o = i;
      List<Widget> pageData = [];
      for (var page in pages) {
        i++;

        pageData.add(
          Container(
            padding: EdgeInsets.all(12),
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
                    itemCount: pages.elementAt(index).content.length,
                    itemBuilder: (context, index) => Text(
                      pages.elementAt(index).content.elementAt(index),
                      style: ThemeStyles.regularParagraph,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }

      currentChapter.related.add(
        RelationalBinding(
          id: i,
          content: Container(
            constraints: BoxConstraints(
              // ignore: use_build_context_synchronously
              maxWidth: MediaQuery.of(_context).size.width - 200,
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
          ),
          relatedTo: o,
        ),
      );
    }

    observer.getObserver("chapterGraph").call(_bindingData);
  }
}
