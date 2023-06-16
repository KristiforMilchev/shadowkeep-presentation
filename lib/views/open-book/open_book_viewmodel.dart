import 'package:domain/models/chapter.dart';
import 'package:domain/models/character.dart';
import 'package:domain/models/relational_binding.dart';
import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:infrastructure/interfaces/ichapter_service.dart';
import 'package:infrastructure/interfaces/icharacter_service.dart';
import 'package:infrastructure/interfaces/ipage_service.dart';

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
                    child: Row(
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

      for (var page in pages) {
        i++;

        currentChapter.related.add(
          RelationalBinding(
            id: i,
            content: Container(
              width: 150,
              height: 150,
              color: ThemeStyles.actionColor,
              child: Column(
                children: [
                  ...page.content
                      .map(
                        (e) => Text(
                          e,
                          style: ThemeStyles.regularParagraph,
                        ),
                      )
                      .toList()
                ],
              ),
            ),
            relatedTo: o,
          ),
        );
      }
    }

    observer.getObserver("chapterGraph").call(_bindingData);
  }
}
