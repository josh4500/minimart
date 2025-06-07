import 'package:flutter/material.dart';
import 'package:minimart/core.dart';

import 'app_color.dart';

abstract final class AppStyle {
  static final ThemeVariant<ProductTileStyle> productTileStyle =
      ThemeVariant.value(
        ProductTileStyle(
          nameStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          priceStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          bgColor: AppColors.grey100,
          radius: const Radius.circular(12),
        ),
      );

  static final ThemeVariant<ProductDetailStyle> productDetailStyle =
      ThemeVariant.value(
        ProductDetailStyle(
          nameStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
          priceStyle: const TextStyle(
            fontSize: 32.75,
            fontWeight: FontWeight.w700,
          ),
          bgColor: AppColors.grey100,
          radius: const Radius.circular(12),
          descStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.grey,
          ),
        ),
      );
  static final ThemeVariant<CartItemStyle> cartItemStyle = ThemeVariant.value(
    CartItemStyle(
      nameStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.grey700,
      ),
      priceStyle: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: AppColors.grey700,
      ),
      inStockStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.green,
      ),
      outOfStockStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.pink,
      ),
      itemCountStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      minusIconStyle: const MinimartIconStyle(
        bgColor: AppColors.grey200,
        color: AppColors.grey500,
      ),
      addIconStyle: MinimartIconStyle(
        bgColor: AppColors.white,
        color: AppColors.grey700,
        border: Border.all(color: AppColors.grey200),
      ),
      deleteIconStyle: const MinimartIconStyle(
        bgColor: AppColors.white,
        color: AppColors.black,
      ),
      bgColor: AppColors.grey100,
      radius: const Radius.circular(12),
    ),
  );
  static final ThemeVariant<OrderInfoStyle> orderInfoStyle = ThemeVariant.value(
    OrderInfoStyle(
      titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
      details: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      detailsBold: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
    ),
  );
}

final class AppStylesExtension extends ThemeExtension<AppStylesExtension> {
  AppStylesExtension({
    required this.productTileStyle,
    required this.productDetailStyle,
    required this.cartItemStyle,
    required this.orderInfoStyle,
  });

  final ProductTileStyle productTileStyle;
  final ProductDetailStyle productDetailStyle;
  final CartItemStyle cartItemStyle;
  final OrderInfoStyle orderInfoStyle;

  @override
  ThemeExtension<AppStylesExtension> lerp(AppStylesExtension? other, double t) {
    return AppStylesExtension(
      productTileStyle: ProductTileStyle.lerp(
        productTileStyle,
        other?.productTileStyle,
        t,
      )!,
      productDetailStyle: ProductDetailStyle.lerp(
        productDetailStyle,
        other?.productDetailStyle,
        t,
      )!,
      cartItemStyle: CartItemStyle.lerp(
        cartItemStyle,
        other?.cartItemStyle,
        t,
      )!,
      orderInfoStyle: OrderInfoStyle.lerp(
        orderInfoStyle,
        other?.orderInfoStyle,
        t,
      )!,
    );
  }

  @override
  ThemeExtension<AppStylesExtension> copyWith({
    ProductTileStyle? productTileStyle,
    ProductDetailStyle? productDetailStyle,
    CartItemStyle? cartItemStyle,
    OrderInfoStyle? orderInfoStyle,
  }) {
    return AppStylesExtension(
      productTileStyle: productTileStyle ?? this.productTileStyle,
      productDetailStyle: productDetailStyle ?? this.productDetailStyle,
      cartItemStyle: cartItemStyle ?? this.cartItemStyle,
      orderInfoStyle: orderInfoStyle ?? this.orderInfoStyle,
    );
  }
}

class ProductTileStyle {
  ProductTileStyle({
    required this.nameStyle,
    required this.priceStyle,
    required this.bgColor,
    required this.radius,
  });

  final TextStyle nameStyle;
  final TextStyle priceStyle;
  final Color bgColor;
  final Radius radius;

  static ProductTileStyle? lerp(
    ProductTileStyle? a,
    ProductTileStyle? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ProductTileStyle(
      nameStyle: TextStyle.lerp(a?.nameStyle, b?.nameStyle, t)!,
      priceStyle: TextStyle.lerp(a?.priceStyle, b?.priceStyle, t)!,
      bgColor: Color.lerp(a?.bgColor, b?.bgColor, t)!,
      radius: Radius.lerp(a?.radius, b?.radius, t)!,
    );
  }
}

class ProductDetailStyle {
  ProductDetailStyle({
    required this.nameStyle,
    required this.priceStyle,
    required this.descStyle,
    required this.bgColor,
    required this.radius,
  });

  final TextStyle nameStyle;
  final TextStyle priceStyle;
  final TextStyle descStyle;
  final Color bgColor;
  final Radius radius;

  static ProductDetailStyle? lerp(
    ProductDetailStyle? a,
    ProductDetailStyle? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ProductDetailStyle(
      nameStyle: TextStyle.lerp(a?.nameStyle, b?.nameStyle, t)!,
      priceStyle: TextStyle.lerp(a?.priceStyle, b?.priceStyle, t)!,
      descStyle: TextStyle.lerp(a?.descStyle, b?.descStyle, t)!,
      bgColor: Color.lerp(a?.bgColor, b?.bgColor, t)!,
      radius: Radius.lerp(a?.radius, b?.radius, t)!,
    );
  }
}

class CartItemStyle {
  CartItemStyle({
    required this.nameStyle,
    required this.priceStyle,
    required this.inStockStyle,
    required this.outOfStockStyle,
    required this.itemCountStyle,
    required this.minusIconStyle,
    required this.addIconStyle,
    required this.deleteIconStyle,
    required this.bgColor,
    required this.radius,
  });

  final TextStyle nameStyle;
  final TextStyle priceStyle;
  final TextStyle inStockStyle;
  final TextStyle outOfStockStyle;
  final TextStyle itemCountStyle;
  final MinimartIconStyle minusIconStyle;
  final MinimartIconStyle addIconStyle;
  final MinimartIconStyle deleteIconStyle;
  final Color bgColor;
  final Radius radius;

  static CartItemStyle? lerp(CartItemStyle? a, CartItemStyle? b, double t) {
    if (a == null && b == null) {
      return null;
    }

    return CartItemStyle(
      nameStyle: TextStyle.lerp(a?.nameStyle, b?.nameStyle, t)!,
      priceStyle: TextStyle.lerp(a?.priceStyle, b?.priceStyle, t)!,
      inStockStyle: TextStyle.lerp(a?.inStockStyle, b?.inStockStyle, t)!,
      outOfStockStyle: TextStyle.lerp(
        a?.outOfStockStyle,
        b?.outOfStockStyle,
        t,
      )!,
      bgColor: Color.lerp(a?.bgColor, b?.bgColor, t)!,

      radius: Radius.lerp(a?.radius, b?.radius, t)!,
      itemCountStyle: TextStyle.lerp(
        a?.outOfStockStyle,
        b?.outOfStockStyle,
        t,
      )!,
      minusIconStyle: MinimartIconStyle.lerp(
        a?.minusIconStyle,
        b?.minusIconStyle,
        t,
      )!,
      addIconStyle: MinimartIconStyle.lerp(
        a?.addIconStyle,
        b?.addIconStyle,
        t,
      )!,
      deleteIconStyle: MinimartIconStyle.lerp(
        a?.deleteIconStyle,
        b?.deleteIconStyle,
        t,
      )!,
    );
  }
}

class MinimartIconStyle {
  const MinimartIconStyle({
    required this.bgColor,
    required this.color,
    this.border,
  });

  final Color bgColor;
  final Color color;
  final Border? border;

  static MinimartIconStyle? lerp(
    MinimartIconStyle? a,
    MinimartIconStyle? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return MinimartIconStyle(
      color: Color.lerp(a?.color, b?.color, t)!,
      bgColor: Color.lerp(a?.bgColor, b?.bgColor, t)!,
      border: Border.lerp(a?.border, b?.border, t),
    );
  }
}

class OrderInfoStyle {
  OrderInfoStyle({
    required this.titleStyle,
    required this.details,
    required this.detailsBold,
  });

  final TextStyle titleStyle;
  final TextStyle details;
  final TextStyle detailsBold;

  static OrderInfoStyle? lerp(OrderInfoStyle? a, OrderInfoStyle? b, double t) {
    if (a == null && b == null) {
      return null;
    }

    return OrderInfoStyle(
      titleStyle: TextStyle.lerp(a?.titleStyle, b?.titleStyle, t)!,
      details: TextStyle.lerp(a?.details, b?.details, t)!,
      detailsBold: TextStyle.lerp(a?.detailsBold, b?.detailsBold, t)!,
    );
  }
}
