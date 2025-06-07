import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:minimart/presentation/router.dart';
import 'package:minimart/presentation/widgets.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch(String query) {
    query = query.trim();
    if (query.isNotEmpty) {
      context.router.push(
        ProductListRoute(query: query, isSearchResults: true),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFloatingHeader(
              child: MinimartAppBar(
                showLeading: false,
                bottom: MinimartSearchTextField(
                  controller: _searchController,
                  onSearch: _performSearch,
                ),
              ),
            ),
            const SliverFillRemaining(child: AutoRouter()),
          ],
        ),
      ),
    );
  }
}
