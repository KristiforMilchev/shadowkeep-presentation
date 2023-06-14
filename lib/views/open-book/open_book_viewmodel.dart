import 'package:collection/collection.dart';
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
    // await observer.getObserver("characterGraph").call(
    //       _characters
    //           .map(
    //             (e) => RelationalBinding(
    //                 content: Container(
    //                   child: Text(e.firstName),
    //                 ),
    //                 id: e.id,
    //                 relatedTo: _characters.first.id),
    //           )
    //           .toList(),
    //     );
  }

  Future loadChapters() async {
    _chapters = await _chapterService.getAllChapters(sessionManager.bookId);

    List<RelationalBinding> _bindingData = [];
    for (var chapter in _chapters) {
      var currentChapter = RelationalBinding(
        id: chapter.id,
        content: Container(
          width: 300,
          height: 300,
          color: ThemeStyles.mainColor,
          child: Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.paragliding,
                      color: ThemeStyles.mainColor,
                      size: 25,
                    ),
                    Text(
                      chapter.pageTitle,
                      style: ThemeStyles.innerHeading,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Expanded(
                  child: Text(
                    chapter.shortDescription ?? "",
                    style: ThemeStyles.regularParagraph,
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
        ),
        relatedTo: chapter.id,
      );
      _bindingData.add(currentChapter);
      currentChapter.related = [];
      var pages = await _pageService.getChapterPages(chapter.id);
      pages
          .map(
            (e) => currentChapter.related.add(
              RelationalBinding(
                id: _bindingData.length + 1,
                content: Placeholder(),
                relatedTo: chapter.id,
              ),
            ),
          )
          .toList();
    }

    observer.getObserver("chapterGraph").call(_bindingData);
  }
}
