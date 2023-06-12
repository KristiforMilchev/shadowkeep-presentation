import 'package:get_it/get_it.dart';
import 'package:infrastructure/interfaces/ibook_service.dart';
import 'package:infrastructure/interfaces/ichapter_service.dart';
import 'package:infrastructure/interfaces/icharacter_service.dart';
import 'package:infrastructure/interfaces/iobserver.dart';
import 'package:infrastructure/interfaces/ipage_router_service.dart';
import 'package:infrastructure/interfaces/ipage_service.dart';
import 'package:infrastructure/interfaces/isession_manager.dart';
import 'package:stacked/stacked.dart';

class PageViewModel extends BaseViewModel {
  GetIt getIt = GetIt.instance;
  late IPageRouterService router = getIt.get<IPageRouterService>();
  late ISessionManager sessionManager = getIt.get<ISessionManager>();
  late IObserver observer = getIt.get<IObserver>();
  late IBookService bookService = getIt.get<IBookService>();
  late IChapterService chapterService = getIt.get<IChapterService>();
  late ICharacterService characterService = getIt.get<ICharacterService>();
  late IPageService pageService = getIt.get<IPageService>();
}
