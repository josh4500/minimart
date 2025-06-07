import 'package:auto_route/auto_route.dart';
import 'package:minimart/presentation/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      initial: true,
      page: DashboardRoute.page,
      children: [
        AutoRoute(
          page: HomeRoute.page,
          children: [
            AutoRoute(path: '', page: ProductListRoute.page),
            AutoRoute(path: 'search', page: ProductListRoute.page),
          ],
        ),
        AutoRoute(page: CartRoute.page),
      ],
    ),
    AutoRoute(page: ProductDetailsRoute.page),
  ];
}
