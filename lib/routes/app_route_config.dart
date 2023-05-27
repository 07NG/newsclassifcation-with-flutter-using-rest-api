import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project1/Dashboard.dart';
import 'package:project1/Error.dart';
import 'package:project1/HomeScreen.dart';
import 'package:project1/LoginScreen.dart';
import 'package:project1/Upload.dart';
import 'package:project1/singup.dart';

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
                  const LoginScreen(),
              redirect: (state) => '/dashboard'
              // {
              //   var user;
              //   if (user == 'niroj') {
              //     '/dashboard';
              //   }
              //   return '/';
              // },
              ),
          GoRoute(
            name: 'signup',
            path: 'signup', // Remove leading slash '/'
            builder: (BuildContext context, GoRouterState state) =>
                const SignupScreen(),
          ),
          // GoRoute(
          //   name: 'politics',
          //   path: 'politics', // Remove leading slash '/'
          //   builder: (BuildContext context, GoRouterState state) =>
          //       const PoliticsScreen(),
          // ),
          // GoRoute(
          //   name: 'technology',
          //   path: 'technology', // Remove leading slash '/'
          //   builder: (BuildContext context, GoRouterState state) =>
          //       const SignupScreen(),
          // ),
          // GoRoute(
          //   name: 'sports',
          //   path: 'sports', // Remove leading slash '/'
          //   builder: (BuildContext context, GoRouterState state) =>
          //       const SignupScreen(),
          // ),
          // GoRoute(
          //   name: 'business',
          //   path: 'business', // Remove leading slash '/'
          //   builder: (BuildContext context, GoRouterState state) =>
          //       const SignupScreen(),
          // ),
          // GoRoute(
          //   name: 'health',
          //   path: 'health', // Remove leading slash '/'
          //   builder: (BuildContext context, GoRouterState state) =>
          //       const SignupScreen(),
          // ),
          GoRoute(
            name: 'upload',
            path: 'upload', // Remove leading slash '/'
            builder: (BuildContext context, GoRouterState state) =>
                const UploadScreen(),
          ),
          GoRoute(
            name: 'dashboard',
            path: 'dashboard', // Remove leading slash '/'
            builder: (BuildContext context, GoRouterState state) =>
                const DashboardScreen(),
          ),
          GoRoute(
            name: 'processing',
            path: 'processing', // Remove leading slash '/'
            builder: (BuildContext context, GoRouterState state) =>
                const DashboardScreen(),
          ),
        ],
      ),
    ],
  );
}
