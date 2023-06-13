import 'package:collection/collection.dart';
import 'package:domain/models/chapter.dart';
import 'package:domain/models/character.dart';
import 'package:domain/models/relational_binding.dart';
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
    await observer.getObserver("characterGraph").call(
          _characters
              .map(
                (e) => RelationalBinding(
                    content: Container(
                      child: Text(e.firstName),
                    ),
                    id: e.id,
                    relatedTo: _characters.first.id),
              )
              .toList(),
        );
  }

  Future loadChapters() async {
    _chapters = await _chapterService.getAllChapters(sessionManager.bookId);

    List<RelationalBinding> _bindingData = [];
    for (var chapter in _chapters) {
      _bindingData.add(
        RelationalBinding(
            id: chapter.id,
            content: Container(
              child: Text(chapter.pageTitle),
            ),
            relatedTo: chapter.relatedTo),
      );

      var pages = await _pageService.getChapterPages(chapter.id);
      for (var page in pages) {
        _bindingData.add(
          RelationalBinding(
            id: page.id,
            content: Container(
              child: Text(
                page.content.first,
              ),
            ),
            relatedTo: chapter.id,
          ),
        );
      }
    }

    observer.getObserver("chapterGraph").call(_bindingData);
  }
}
