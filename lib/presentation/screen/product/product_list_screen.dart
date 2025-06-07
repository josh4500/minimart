import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:minimart/presentation.dart';
import 'package:minimart/presentation/widgets.dart';
import 'package:provider/provider.dart';

import '../home/widgets/product_tile.dart';

@RoutePage()
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({
    super.key,
    this.query,
    this.isSearchResults = false,
  });

  final String? query;
  final bool isSearchResults;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  String? category;
  String? subCategory;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() {
    if (widget.isSearchResults && widget.query != null) {
      context.read<ProductProvider>().searchProducts(widget.query!);
      category = 'Technology';
      subCategory = 'Smartphones, Laptops & Accessories';
    } else {
      context.read<ProductProvider>().loadProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    final products = context.watch<ProductProvider>().products;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isSearchResults)
          MinimartBackButton(key: ValueKey(category), label: category),
        if (subCategory != null && widget.isSearchResults)
          Padding(
            key: ValueKey(subCategory),
            padding: const EdgeInsets.all(16.0),
            child: Text(subCategory!, style: const TextStyle(fontSize: 18)),
          ),
        Expanded(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (BuildContext _, int index) {
              return ProductTile(product: products[index]);
            },
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 9 / 10,
            ),
          ),
        ),
      ],
    );
  }
}
