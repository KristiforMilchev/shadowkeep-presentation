import 'package:domain/models/enums.dart';
import 'package:domain/models/transition_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:infrastructure/interfaces/ipage_router_service.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  GetIt getIt = GetIt.instance;
  late IPageRouterService _routerService;
  late BuildContext _context;

  List<String> myLongClassName = [];

  ready(BuildContext context) {
    _context = context;
    _routerService = getIt.get<IPageRouterService>();

    myLongClassName.forEach((element) {});
  }

  void routeToAction() {
    _routerService.changePage(
      "/home-view",
      _context,
      TransitionData(next: PageTransition.slideForward),
    );
  }
}
