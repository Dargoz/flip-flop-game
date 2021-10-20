
import 'package:auto_route/auto_route.dart';

class AppRouteGuard extends AutoRouteGuard {

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    print("router : ${router.current.name}");
    print("path : ${router.current.pathParams}");
    resolver.next();
  }

}