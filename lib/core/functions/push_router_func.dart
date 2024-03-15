import 'package:auto_route/auto_route.dart';
import 'package:prototyping/routes/mobile_auto_router.dart';
import 'package:prototyping/server/service_locator.dart';

class AppRouting {
  static pushFunction(PageRouteInfo<dynamic> route) {
    sl<AppRouter>().push(route);
  }

  static popFunction() {
    sl<AppRouter>().pop();
  }

  static pushAndPopUntilFunction(PageRouteInfo<dynamic> route) {
    sl<AppRouter>().pushAndPopUntil(
      route,
      predicate: (route) => false,
    );
  }
}
