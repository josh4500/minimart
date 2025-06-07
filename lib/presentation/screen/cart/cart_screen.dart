import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show NumberFormat;
import 'package:minimart/generated/l10n.dart' show S;
import 'package:minimart/presentation/provider/cart_provider.dart';
import 'package:minimart/presentation/themes.dart';
import 'package:minimart/presentation/widgets.dart';
import 'package:provider/provider.dart';

import '../../../domain.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(
      locale: S.of(context).locale,
      symbol: S.of(context).currencySymbol,
      decimalDigits: 2,
    );
    const double shippingAmount = 10.0;
    final cart = context.select<CartProvider, Cart?>((p) => p.cart);
    final orderInfoStyle = context.theme.appStyles.orderInfoStyle;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverFloatingHeader(
                    child: MinimartAppBar(leadingLabel: S.of(context).yourCart),
                  ),
                  if (cart != null && cart.items.isNotEmpty)
                    SliverList(
                      delegate: SliverChildBuilderDelegate((_, int index) {
                        return CartItemTile(item: cart.items[index]);
                      }, childCount: cart.items.length),
                    )
                  else
                    SliverFillRemaining(
                      child: Column(
                        spacing: 16,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(MinimartIcons.cart_outlined, size: 40),
                          Text(
                            S.of(context).noProductInCart,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  if (cart != null)
                    SliverToBoxAdapter(
                      child: Column(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).orderInfo,
                            style: orderInfoStyle.titleStyle,
                          ),
                          Row(
                            children: [
                              Text(
                                S.of(context).subtotal,
                                style: orderInfoStyle.details,
                              ),
                              const Spacer(),
                              Text(
                                formatter.format(cart.totalAmount),
                                style: orderInfoStyle.details,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                S.of(context).shipping,
                                style: orderInfoStyle.details,
                              ),
                              const Spacer(),
                              Text(
                                formatter.format(shippingAmount),
                                style: orderInfoStyle.details,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                S.of(context).total,
                                style: orderInfoStyle.details,
                              ),
                              const Spacer(),
                              Text(
                                formatter.format(
                                  cart.totalAmount + shippingAmount,
                                ),
                                style: orderInfoStyle.details,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            if (cart != null && cart.items.isNotEmpty)
              MinimartButton(
                enabled: cart.totalAmount > 0,
                title:
                    '${S.of(context).checkout} (${formatter.format(cart.totalAmount)})',
                onPressed: () => context.read<CartProvider>().clearCart(),
              ),
          ],
        ),
      ),
    );
  }
}

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
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
            child: const CustomImage(
              image: NetworkImage('https://picsum.photos/id/237/200/300'),
            ),
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
                        Icons.data_array,
                        color: itemStyle.minusIconStyle.color,
                      ),
                      border: itemStyle.minusIconStyle.border,
                      bgColor: itemStyle.minusIconStyle.bgColor,
                      onTap: () => context.read<CartProvider>().addToCart(
                        item.product,
                        item.quantity - 1,
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
                      onTap: () => context.read<CartProvider>().addToCart(
                        item.product,
                        item.quantity + 1,
                      ),
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
