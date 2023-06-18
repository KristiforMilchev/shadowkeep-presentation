import 'package:domain/models/chapter.dart';
import 'package:domain/models/character.dart';
import 'package:domain/models/relational_binding.dart';
import 'package:flutter/material.dart';
import 'package:infrastructure/interfaces/ichapter_service.dart';
import 'package:infrastructure/interfaces/icharacter_service.dart';
import 'package:infrastructure/interfaces/ipage_service.dart';
import 'package:presentation/components/chapter_card/chapter_card.dart';
import 'package:presentation/components/chapter_wrapper/chapter_wrapper.dart';
import 'package:presentation/components/page_card/page_card.dart';

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

    await loadChapters();
  }

  Future loadChapters() async {
    _chapters = await _chapterService.getAllChapters(sessionManager.bookId);

    List<RelationalBinding> bindingData = [];

    for (var chapter in _chapters) {
      var currentChapter = RelationalBinding(
        id: chapter.id,
        content: ChapterCard(chapter: chapter),
      );
      bindingData.add(currentChapter);
      var pages = await _pageService.getChapterPages(chapter.id);
      currentChapter.related = [];
      currentChapter.related.add(
        RelationalBinding(
          id: chapter.id,
          content: ChapterWrapper(
            pageData: pages
                .map(
                  (e) => PageCard(page: e),
                )
                .toList(),
          ),
        ),
      );
    }

    observer.getObserver("chapterGraph").call(bindingData);
  }
}
