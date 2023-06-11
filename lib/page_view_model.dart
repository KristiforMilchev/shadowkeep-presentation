import 'package:get_it/get_it.dart';
import 'package:infrastructure/interfaces/iobserver.dart';
import 'package:infrastructure/interfaces/ipage_router_service.dart';
import 'package:infrastructure/interfaces/isession_manager.dart';
import 'package:stacked/stacked.dart';

class PageViewModel extends BaseViewModel {
  GetIt getIt = GetIt.instance;
  late IPageRouterService router = getIt.get<IPageRouterService>();
  late ISessionManager sessionManager = getIt.get<ISessionManager>();
  late IObserver observer = getIt.get<IObserver>();
}
