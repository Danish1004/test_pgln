import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pingolearn_assignment/screens/authentication/login/login_screen.dart';
import 'package:pingolearn_assignment/screens/authentication/signup/signup_screen.dart';
import 'package:pingolearn_assignment/screens/home/home.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: <GoRoute>[
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return _buildPageWithAnimation(
            const LoginScreen(), SlideDirection.bottom);
      },
    ),
    GoRoute(
      path: '/signup',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return _buildPageWithAnimation(
            const SignupScreen(), SlideDirection.bottom);
      },
    ),
  ],
);

enum SlideDirection { side, bottom }

CustomTransitionPage _buildPageWithAnimation(
    Widget child, SlideDirection direction) {
  return CustomTransitionPage(
    transitionDuration: direction == SlideDirection.side
        ? const Duration(milliseconds: 300)
        : const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 200),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      Offset begin;
      switch (direction) {
        case SlideDirection.side:
          begin = const Offset(1.0, 0.0);
          break;
        case SlideDirection.bottom:
          begin = const Offset(0.0, 1.0);
          break;
      }

      const end = Offset.zero;
      const curve = Curves.decelerate;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
