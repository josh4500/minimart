import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:minimart/generated/l10n.dart' show S;
import 'package:minimart/presentation/providers.dart';
import 'package:minimart/presentation/router.dart';
import 'package:minimart/presentation/themes.dart';
import 'package:minimart/presentation/widgets.dart';
import 'package:provider/provider.dart';

import 'widgets/nav_icon.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with ErrorScreenMixin {
  bool _setupProviders = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_setupProviders) {
      _setupProviders = true;
      context.read<CartProvider>().loadCart();
      context.read<UserProvider>().loadUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [HomeRoute(), CartRoute()],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          type: BottomNavigationBarType.fixed,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          selectedItemColor: context.theme.appColors.selected,
          unselectedItemColor: context.theme.appColors.unselected,
          selectedIconTheme: const IconThemeData(color: AppColors.white),
          unselectedIconTheme: const IconThemeData(color: AppColors.black),
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: context.theme.appColors.selected,
            fontSize: 14,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: context.theme.appColors.unselected,
            fontSize: 14,
          ),
          enableFeedback: true,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              tooltip: S.of(context).home,
              label: S.of(context).home,
              activeIcon: NavIcon(
                MinimartIcons.home_outlined,
                color: context.theme.appColors.selected,
              ),
              icon: const NavIcon(MinimartIcons.home_outlined),
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              tooltip: S.of(context).cart,
              label: S.of(context).cart,
              activeIcon: Consumer<CartProvider>(
                builder: (_, cartProvider, _) {
                  final count = cartProvider.itemCount;
                  return NavIcon(
                    MinimartIcons.cart_outlined,
                    color: context.theme.appColors.selected,
                    badgeCount: count > 0 ? count : null,
                  );
                },
              ),
              icon: Consumer<CartProvider>(
                builder: (_, cartProvider, _) {
                  final count = cartProvider.itemCount;
                  return NavIcon(
                    MinimartIcons.cart_outlined,
                    badgeCount: count > 0 ? count : null,
                  );
                },
              ),
            ),
            BottomNavigationBarItem(
              tooltip: S.of(context).favourite,
              label: S.of(context).favourite,
              activeIcon: NavIcon(
                MinimartIcons.fav_outlined,
                color: context.theme.appColors.selected,
              ),
              icon: const NavIcon(MinimartIcons.fav_outlined),
            ),
            BottomNavigationBarItem(
              tooltip: S.of(context).profile,
              label: S.of(context).profile,
              activeIcon: NavIcon(
                MinimartIcons.profile_outlined,
                color: context.theme.appColors.selected,
              ),
              icon: const NavIcon(MinimartIcons.profile_outlined),
            ),
          ],
        );
      },
    );
  }

  @override
  List<ChangeNotifier> get providers => [
    Provider.of<UserProvider>(context, listen: false),
    Provider.of<CartProvider>(context, listen: false),
    Provider.of<ProductProvider>(context, listen: false),
  ];
}
