import 'package:domain/models/enums.dart';
import 'package:domain/models/transition_data.dart';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:presentation/views/planning/khanban/khanban_view.dart';
import 'package:presentation/views/planning/planning/planning_view.dart';
import 'package:presentation/views/planning/sprint_planner/sprint_planner_view.dart';
import 'package:presentation/views/splash/splash.view.dart';

import '../views/home/home.view.dart';

class ApplicationRouter {
  //Animations Handles

  static SlideTransition slideTransionHandle(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
    bool direction,
  ) {
    late final Animation<Offset> offsetAnimation;

    if (direction) {
      offsetAnimation = Tween<Offset>(
        begin: const Offset(1.5, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      ));
    } else {
      offsetAnimation = Tween<Offset>(
        begin: const Offset(-1.5, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      ));
    }

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }

  static FadeTransition fadeTransision(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
    bool direction,
  ) {
    late final Animation<double> fadeAnimation = CurvedAnimation(
      parent: animation,
      curve: direction ? Curves.easeIn : Curves.easeOut,
    );

    return FadeTransition(
      opacity: fadeAnimation,
      child: child,
    );
  }

  static const Duration animationDuration = Duration(milliseconds: 500);
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'home-view',
            pageBuilder: (context, state) {
              // var pageData = state.extra as TransitionData;
              // var condition = pageData.data as bool;
              return CustomTransitionPage(
                child: const HomeView(),
                transitionDuration: animationDuration,
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) =>
                    tranisitionController(
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                  state,
                ),
              );
            },
          ),
          GoRoute(
            path: 'planning-view',
            pageBuilder: (context, state) {
              // var pageData = state.extra as TransitionData;
              // var condition = pageData.data as bool;
              return CustomTransitionPage(
                child: const PlanningView(),
                transitionDuration: animationDuration,
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) =>
                    tranisitionController(
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                  state,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );

  static tranisitionController(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      GoRouterState state) {
    var caller = state.extra as TransitionData;
    print(state.path);
    if (caller.next == PageTransition.easeInAndOut) {
      return fadeTransision(
          context, animation, secondaryAnimation, child, true);
    }

    if (caller.next == PageTransition.slideBack) {
      return slideTransionHandle(
        context,
        animation,
        secondaryAnimation,
        child,
        false,
      );
    }

    if (caller.next == PageTransition.slideForward) {
      return slideTransionHandle(
        context,
        animation,
        secondaryAnimation,
        child,
        true,
      );
    }

    return child;
  }
}
