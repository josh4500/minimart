import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show NumberFormat;
import 'package:minimart/domain.dart';
import 'package:minimart/generated/l10n.dart' show S;
import 'package:minimart/presentation.dart';
import 'package:minimart/presentation/themes.dart';
import 'package:minimart/presentation/widgets.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final style = context.theme.appStyles.productDetailStyle;
    final formatter = NumberFormat.currency(
      locale: S.of(context).locale,
      symbol: S.of(context).currencySymbol,
      decimalDigits: 2,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  const SliverFloatingHeader(
                    snapMode: FloatingHeaderSnapMode.scroll,
                    child: MinimartAppBar(leadingLabel: 'Go Back'),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(16.0),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        SizedBox(
                          height: 350,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Hero(
                                  tag: product.id,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: style.bgColor,
                                      borderRadius: BorderRadius.all(
                                        style.radius,
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: CustomImage(
                                      image: NetworkImage(product.imageUrl),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: MinimartIconButton(
                                  onTap: () {
                                    context
                                        .read<ProductProvider>()
                                        .toggleFavorite(product);
                                  },
                                  margin: const EdgeInsets.all(16.0),
                                  icon: Icon(
                                    product.isFavorite
                                        ? MinimartIcons.fav_filled
                                        : MinimartIcons.fav_outlined,
                                    color: product.isFavorite
                                        ? AppColors.pink
                                        : AppColors.grey700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Column(
                          spacing: 4,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: style.nameStyle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              formatter.format(product.price),
                              style: style.priceStyle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          product.description,
                          style: style.descStyle,
                          textAlign: TextAlign.start,
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            MinimartButton(
              enabled: product.inStock,
              title: S.of(context).addToCart,
              onPressed: () => context.read<CartProvider>().addToCart(product),
            ),
          ],
        ),
      ),
    );
  }
}
