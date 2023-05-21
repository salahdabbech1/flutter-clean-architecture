import 'package:auto_route/annotations.dart';
import 'package:auto_route/src/route/auto_route_config.dart';

import 'auto_router_config.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  // TODO: implement routes
  List<AutoRoute> get routes =>
      [AutoRoute(page: HomeRoute.page, initial: true)];
}
