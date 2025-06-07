import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show NumberFormat;
import 'package:minimart/domain.dart' show CartItem;
import 'package:minimart/generated/l10n.dart' show S;
import 'package:minimart/presentation/providers.dart' show CartProvider;
import 'package:minimart/presentation/themes.dart';
import 'package:minimart/presentation/widgets.dart';
import 'package:provider/provider.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({super.key, required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    final itemStyle = context.theme.appStyles.cartItemStyle;
    final formatter = NumberFormat.currency(
      locale: S.of(context).locale,
      symbol: S.of(context).currencySymbol,
      decimalDigits: 2,
    );
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: itemStyle.bgColor,
        borderRadius: BorderRadius.all(itemStyle.radius),
      ),
      child: Row(
        children: [
          Container(
            height: 96,
            width: 96,
            margin: const EdgeInsets.all(16),
            child: CustomImage(image: AssetImage(item.product.imageUrl)),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  style: itemStyle.nameStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  formatter.format(item.product.price),
                  style: itemStyle.priceStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  item.product.inStock
                      ? S.of(context).inStock
                      : S.of(context).outOfStock,
                  style: item.product.inStock
                      ? itemStyle.inStockStyle
                      : itemStyle.outOfStockStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    MinimartIconButton(
                      icon: Icon(
                        MinimartIcons.minus,
                        color: itemStyle.minusIconStyle.color,
                      ),
                      border: itemStyle.minusIconStyle.border,
                      bgColor: itemStyle.minusIconStyle.bgColor,
                      onTap: () => context.read<CartProvider>().addToCart(
                        item.product,
                        -1,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          item.quantity.toString(),
                          style: itemStyle.itemCountStyle,
                        ),
                      ),
                    ),
                    MinimartIconButton(
                      icon: Icon(
                        MinimartIcons.add_outlined,
                        color: itemStyle.addIconStyle.color,
                      ),
                      border: itemStyle.addIconStyle.border,
                      bgColor: itemStyle.addIconStyle.bgColor,
                      onTap: () {
                        context.read<CartProvider>().addToCart(item.product);
                      },
                    ),
                    const Spacer(),
                    MinimartIconButton(
                      icon: Icon(
                        MinimartIcons.delete_outlined,
                        color: itemStyle.addIconStyle.color,
                      ),
                      border: itemStyle.deleteIconStyle.border,
                      bgColor: itemStyle.deleteIconStyle.bgColor,
                      onTap: () => context.read<CartProvider>().removeFromCart(
                        item.product,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
