import 'package:domain/models/chapter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infrastructure/interfaces/ichapter_service.dart';
import 'package:presentation/page_view_model.dart';

class ChapterCardViewModel extends PageViewModel {
  bool _isLastChapter = false;
  bool get isLastChapter => _isLastChapter;
  ready(Chapter chapter, BuildContext context) async {
    var book = sessionManager.bookId;
    compute(
      (List<dynamic> data) {
        var curretChapterService = data.first as IChapterService;
        (int chapter, int book) current = data.last;
        curretChapterService.setBookId(current.$2);
        var result = curretChapterService.canAdd(current.$1);
        return result;
      },
      [characterService, (chapter.id, book)],
    ).then(
      (value) {
        _isLastChapter = value;
        notifyListeners();
      },
    );
  }

  onActionButtonPressed() {}
}
