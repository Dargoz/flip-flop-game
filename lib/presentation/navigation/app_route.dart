import 'package:auto_route/annotations.dart';
import 'package:flip_flop_game/presentation/pages/game/game_page.dart';
import 'package:flip_flop_game/presentation/pages/home_page.dart';
import 'package:flip_flop_game/presentation/pages/leaderboard_page.dart';
import 'package:flip_flop_game/presentation/pages/result_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(page: MyHomePage, initial: true),
  AutoRoute(page: GamePage),
  AutoRoute(page: LeaderboardPage),
  AutoRoute(page: ResultPage)
])
class $AppRouter {}
