import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:going_green/screens/forgot_pass_screen.dart';
import 'package:going_green/screens/home_page.dart';
import 'package:going_green/screens/offer_company_screen.dart';
import 'package:going_green/screens/offers_screen.dart';
import 'package:going_green/screens/profile_screen.dart';
import 'package:going_green/screens/scan_screen.dart';
import 'package:going_green/screens/sign_in_page.dart';
import 'package:going_green/screens/sign_up_page.dart';
import 'package:going_green/screens/task_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: '/',
      path: MyAppRouteConstants.initialScreen,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage(
          child: const SignInPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(0.0, 1.0);
            var end = Offset.zero;
            var curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      name: '/signUpScreen',
      path: MyAppRouteConstants.signUpScreen,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage(
          child: const SignUpScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(0.0, 1.0);
            var end = Offset.zero;
            var curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      name: '/homeScreen',
      path: MyAppRouteConstants.homeScreen,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage(
          child: const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(0.0, 1.0);
            var end = Offset.zero;
            var curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      name: '/scanScreen',
      path: MyAppRouteConstants.scanScreen,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: const ScanScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(0.0, 1.0);
            var end = Offset.zero;
            var curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
        path: '/profileScreen',
        name: MyAppRouteConstants.profileScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const ProfileScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = const Offset(0.0, 1.0);
              var end = Offset.zero;
              var curve = Curves.ease;
              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          );
        }),
    GoRoute(
      name: '/offerScreen',
      path: MyAppRouteConstants.offerScreen,
      pageBuilder: (context, state) {
        Map<String, dynamic> extra = state.extra as Map<String, dynamic>;
        return CustomTransitionPage(
          child: OfferScreen(
            offerId: extra['offerId'],
            kNoOfCoupons: extra['kNoOfCoupons'],
            kNoOfCompanies: extra['kNoOfCompanies'],
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(0.0, 1.0);
            var end = Offset.zero;
            var curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      name: '/forgotPasswordScreen',
      path: MyAppRouteConstants.forgotPasswordScreen,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: const ForgotPasswordScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(0.0, 1.0);
            var end = Offset.zero;
            var curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      name: '/offerCompanyScreen',
      path: MyAppRouteConstants.offerCompanyScreen,
      pageBuilder: (context, state) {
        Map<String, dynamic> extra = state.extra as Map<String, dynamic>;
        return CustomTransitionPage(
          child: OfferCompanyScreen(
            kCompanyName: extra['kCompanyName'],
            kNoOfCoupons: extra['kNoOfCoupons'],
            kCompanyLogo: extra['kCompanyLogo'],
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(0.0, 1.0);
            var end = Offset.zero;
            var curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      name: '/taskScreen',
      path: MyAppRouteConstants.taskScreen,
      pageBuilder: (context, state) {
        Map<String, dynamic> extra = state.extra as Map<String, dynamic>;
        return CustomTransitionPage(
          child: TaskScreen(
            kTaskName: extra['kTaskName'],
            kLoyaltyPoints: extra['kLoyaltyPoints'],
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(0.0, 1.0);
            var end = Offset.zero;
            var curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      },
    ),
  ],
);

// Define constants for route names
class MyAppRouteConstants {
  static const String initialScreen = '/';
  static const String signUpScreen = '/signUpScreen';
  static const String homeScreen = '/homeScreen';
  static const String scanScreen = '/scanScreen';
  static const String offerScreen = '/offerScreen';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';
  static const String taskScreen = '/taskScreen';
  static const String profileScreen = '/profileScreen';
  static const String offerCompanyScreen = '/offerCompanyScreen';
}
