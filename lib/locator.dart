//There is also a shortcut (if you don't like it just ignore it):

import 'package:application/implementations/mocks/mock_book_service.dart';
import 'package:application/implementations/mocks/mock_chapter_service.dart';
import 'package:application/implementations/mocks/mock_character_service.dart';
import 'package:application/implementations/mocks/mock_page_service.dart';
import 'package:application/implementations/observer.dart';
import 'package:application/implementations/page_router_service.dart';
import 'package:application/implementations/session_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:infrastructure/interfaces/ibook_service.dart';
import 'package:infrastructure/interfaces/ichapter_service.dart';
import 'package:infrastructure/interfaces/icharacter_service.dart';
import 'package:infrastructure/interfaces/ifont_manager.dart';
import 'package:infrastructure/interfaces/iobserver.dart';
import 'package:infrastructure/interfaces/ipage_router_service.dart';
import 'package:infrastructure/interfaces/ipage_service.dart';
import 'package:infrastructure/interfaces/isession_manager.dart';

GetIt getIt = GetIt.I;

void registerDependency() {
  getIt.registerSingleton<IPageRouterService>(PageRouterService());
  getIt.registerSingleton<IObserver>(Observer());
  getIt.registerSingleton<ISessionManager>(SessionManager());
  getIt.registerSingleton<IBookService>(MockBookService());
  getIt.registerSingleton<IChapterService>(MockChapterService());
  getIt.registerSingleton<IPageService>(MockPageService());
  getIt.registerSingleton<ICharacterService>(MockCharacterService());
  getIt.registerFactory(() => IFontManager);
  //TODO remove this after authentication is implemented
  getIt.get<ISessionManager>().projectId = 1;
}

void registerFactory<T>(FactoryFunc<T> func) {
  getIt.registerFactory(() => func);
}

void registerSingleton<T>(FactoryFunc<T> instance) {
  getIt.registerSingleton(instance);
}

void registerLazySingleton<T>(FactoryFunc<T> func) {
  getIt.registerLazySingleton(() => func);
}
