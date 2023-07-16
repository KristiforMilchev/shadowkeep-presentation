import 'dart:ui';

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:domain/models/core_router.dart';
import 'package:flutter/material.dart';
import 'package:presentation/router/router.dart';
import 'package:stacked/stacked.dart';

import 'locator.dart' as locator;
import 'main_viewmodel.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  Paint.enableDithering = true;
  locator.registerDependency();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appRouter = ApplicationRouter.router;
  final configured = false;

  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final internalRouter = CoreRouter(router: appRouter);

    return ViewModelBuilder<MainViewModel>.reactive(
      builder: (context, model, child) => MaterialApp.router(
        scrollBehavior: MyCustomScrollBehavior(),
        localizationsDelegates: const [
          AppFlowyEditorLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en', 'US')],
        debugShowCheckedModeBanner: false,
        routerConfig: internalRouter.router,
      ),
      viewModelBuilder: () => MainViewModel(),
      onViewModelReady: (model) => model.initialized(
        internalRouter,
        context,
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      };
}
