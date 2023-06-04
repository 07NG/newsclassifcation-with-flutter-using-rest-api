import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/CategoryPages/business.dart';
import 'package:news_app/CategoryPages/entertainment.dart';
import 'package:news_app/CategoryPages/politics.dart';
import 'package:news_app/CategoryPages/sports.dart';
import 'package:news_app/CategoryPages/technology.dart';
import 'package:news_app/Dashboard.dart';
import 'package:news_app/Error.dart';
import 'package:news_app/HomeScreen.dart';
import 'package:news_app/LoginScreen.dart';
import 'package:news_app/Upload.dart';
import 'package:news_app/singup.dart';

class MyAppRouter {
  final GoRouter route = GoRouter(
    errorBuilder: (context, state) => const ErrorScreen(),
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: <GoRoute>[
          GoRoute(
            name: 'login',
            path: 'login', // Remove leading slash '/'
            builder: (BuildContext context, GoRouterState state) =>
                LoginScreen(),
          ),
          GoRoute(
            name: 'signup',
            path: 'signup', // Remove leading slash '/'
            builder: (BuildContext context, GoRouterState state) =>
                SignupScreen(),
          ),
          GoRoute(
            name: 'error',
            path: 'error', // Remove leading slash '/'
            builder: (BuildContext context, GoRouterState state) =>
                const ErrorScreen(),
          ),
          GoRoute(
            name: 'politics',
            path: 'politics', // Remove leading slash '/'
            builder: (BuildContext context, GoRouterState state) =>
                PoliticsScreen(),
          ),
          GoRoute(
            name: 'technology',
            path: 'technology', // Remove leading slash '/'
            builder: (BuildContext context, GoRouterState state) =>
                TechnologyScreen(),
          ),
          GoRoute(
            name: 'sports',
            path: 'sports', // Remove leading slash '/'
            builder: (BuildContext context, GoRouterState state) =>
                SportsScreen(),
          ),
          GoRoute(
            name: 'business',
            path: 'business', // Remove leading slash '/'
            builder: (BuildContext context, GoRouterState state) =>
                BusinessScreen(),
          ),
          GoRoute(
            name: 'entertainment',
            path: 'entertainment', // Remove leading slash '/'
            builder: (BuildContext context, GoRouterState state) =>
                EntertainmentScreen(),
          ),
          GoRoute(
            name: 'upload',
            path: 'upload', // Remove leading slash '/'
            builder: (BuildContext context, GoRouterState state) =>
                UploadScreen(),
          ),
          GoRoute(
            name: 'dashboard',
            path: 'dashboard', // Remove leading slash '/'
            builder: (BuildContext context, GoRouterState state) =>
                DashboardScreen(),
          ),
          GoRoute(
            name: 'processing',
            path: 'processing', // Remove leading slash '/'
            builder: (BuildContext context, GoRouterState state) =>
                DashboardScreen(),
          ),
        ],
      ),
    ],
  );
}
