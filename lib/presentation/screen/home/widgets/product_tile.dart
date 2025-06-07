import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minimart/domain/models/product.dart' show Product;
import 'package:minimart/generated/l10n.dart' show S;
import 'package:minimart/presentation/router.dart';
import 'package:minimart/presentation/themes.dart';
import 'package:minimart/presentation/widgets/custom_image.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final style = context.theme.appStyles.productTileStyle;
    final formatter = NumberFormat.currency(
      locale: S.of(context).locale,
      symbol: S.of(context).currencySymbol,
      decimalDigits: 2,
    );
    return InkWell(
      onTap: () => context.router.push(ProductDetailsRoute(product: product)),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Hero(
              tag: product.id,
              child: Container(
                decoration: BoxDecoration(
                  color: style.bgColor,
                  borderRadius: BorderRadius.all(style.radius),
                ),
                child: CustomImage(image: NetworkImage(product.imageUrl)),
              ),
            ),
          ),
          Column(
            spacing: 4,
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
        ],
      ),
    );
  }
}
