import 'package:domain/models/core_router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:infrastructure/interfaces/ipage_router_service.dart';
import 'package:stacked/stacked.dart';

class MainViewModel extends BaseViewModel {
  GetIt getIt = GetIt.instance;
  late IPageRouterService routerService;
  late MaterialApp _app;

  late bool? _isConfigured;
  bool? get isConfigured => _isConfigured;
  MaterialApp get app => _app;
  late CoreRouter? _router;
  CoreRouter? get router => _router;

  initialized(CoreRouter router, BuildContext context) async {
    _router = router;

    routerService = getIt.get<IPageRouterService>();
    routerService.registerRouter(router);
    notifyListeners();
  }
}
