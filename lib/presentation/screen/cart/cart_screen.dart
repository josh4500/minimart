import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show NumberFormat;
import 'package:minimart/generated/l10n.dart' show S;
import 'package:minimart/presentation/providers.dart' show CartProvider;
import 'package:minimart/presentation/themes.dart';
import 'package:minimart/presentation/widgets.dart';
import 'package:provider/provider.dart';

import 'widgets/cart_item_tile.dart';

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
    final cart = context.watch<CartProvider>().cart;
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
                      child: Padding(
                        padding: const EdgeInsets.all(16),
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
                                  style: orderInfoStyle.detailsBold,
                                ),
                              ],
                            ),
                          ],
                        ),
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
