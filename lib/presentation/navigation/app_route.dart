import 'package:auto_route/annotations.dart';
import 'package:flip_flop_game/presentation/navigation/app_route_guard.dart';
import 'package:flip_flop_game/presentation/pages/game/game_page.dart';
import 'package:flip_flop_game/presentation/pages/home_page.dart';
import 'package:flip_flop_game/presentation/pages/leaderboard_page.dart';
import 'package:flip_flop_game/presentation/pages/result_page.dart';
import 'package:flip_flop_game/presentation/pages/select_user_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(
      path: '/:${MyHomePage.groupIdParam}',
      page: MyHomePage,
      guards: [AppRouteGuard],
      initial: true),
  AutoRoute(page: SelectUserPage),
  AutoRoute(page: GamePage),
  AutoRoute(page: LeaderboardPage),
  AutoRoute(page: ResultPage)
])
class $AppRouter {}
