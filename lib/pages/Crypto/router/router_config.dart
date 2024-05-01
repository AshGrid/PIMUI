import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakers_app/pages/Crypto/router/router.dart';


import 'package:sneakers_app/pages/Crypto/navigation.dart';
import 'package:sneakers_app/pages/Crypto/statistics_screen.dart';

import '../../StorePAge/wallet_page.dart';


final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.homescreen.path,
    routes: [
      ShellRoute(
        parentNavigatorKey: _rootNavigatorKey,
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state, child) {
          int index = 0;

          if (state.fullPath == Routes.homescreen.path) {
            index = 0;
          } else if (state.fullPath == Routes.wallet.path) {
            index = 1;
          } else if (state.fullPath == Routes.account.path) {
            index = 2;
          } else if (state.fullPath == Routes.statisticsscreen.path) {
            index = 3;
          }

          return CupertinoPage(
            child: NavigationScreen(
              selectedIndex: index,
              child: child,
            ),
          );
        },
        routes: [
         
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: Routes.wallet.path,
            name: Routes.wallet.name,
            pageBuilder: (context, state) {
              return const CupertinoPage(child: Stripe_page());
            },
          ),
          
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: Routes.statisticsscreen.path,
            name: Routes.statisticsscreen.name,
            pageBuilder: (context, state) {
              return const CupertinoPage(child: StatisticsScreen());
            },
          ),
        ],
      ),
    ]);

// final router = GoRouter( routes: [
//   GoRoute(
//     path: Routes.navigation.path,
//     name: Routes.navigation.name,
//     pageBuilder: (context, state) {
//       return const CupertinoPage(child: Navigation());
//     },
//   ),
//   GoRoute(
//     path: Routes.homescreen.path,
//     name: Routes.homescreen.name,
//     pageBuilder: (context, state) {
//       return const CupertinoPage(child: HomeScreen());
//     },
//   ),
//   GoRoute(
//     path: Routes.wallet.path,
//     name: Routes.wallet.name,
//     pageBuilder: (context, state) {
//       return const CupertinoPage(child: WalletScreen());
//     },
//   ),
//   GoRoute(
//     path: Routes.account.path,
//     name: Routes.account.name,
//     pageBuilder: (context, state) {
//       return const CupertinoPage(child: AccountScreen());
//     },
//   ),
//   GoRoute(
//     path: Routes.statisticsscreen.path,
//     name: Routes.statisticsscreen.name,
//     pageBuilder: (context, state) {
//       return const CupertinoPage(child: StatisticsScreen());
//     },
//   ),
// ]);
