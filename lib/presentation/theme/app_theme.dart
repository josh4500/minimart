import 'package:flutter/material.dart';
import 'package:minimart/presentation/theme/app_style.dart';

import 'app_color.dart';

abstract final class AppThemes {
  /// Theme font family
  static const String fontFamily = 'IBMPlexSans';

  //Dark Theme
  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    fontFamily: fontFamily,
    extensions: [_darkAppColors, _darkAppStyles],
  );
  static final AppColorsExtension _darkAppColors = AppColorsExtension(
    background: AppColors.black,
    foreground: AppColors.white,
    accent: AppColors.accent.dark,
    success: AppColors.success.dark,
    failure: AppColors.failure.dark,
    selected: AppColors.selected.dark,
    unselected: AppColors.unselected.dark,
    active: AppColors.active.dark,
    inactive: AppColors.inactive.dark,
    disabled: AppColors.disabled.dark,
  );
  static final AppStylesExtension _darkAppStyles = AppStylesExtension(
    productTileStyle: AppStyle.productTileStyle.dark,
    productDetailStyle: AppStyle.productDetailStyle.dark,
    cartItemStyle: AppStyle.cartItemStyle.dark,
    orderInfoStyle: AppStyle.orderInfoStyle.dark,
  );

  // Light Theme
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    fontFamily: fontFamily,
    extensions: [_lightAppColors, _lightAppStyles],
  );
  static final AppColorsExtension _lightAppColors = AppColorsExtension(
    background: AppColors.white,
    foreground: AppColors.black,
    accent: AppColors.accent.light,
    success: AppColors.success.light,
    failure: AppColors.failure.light,
    selected: AppColors.selected.light,
    unselected: AppColors.unselected.light,
    active: AppColors.active.light,
    inactive: AppColors.inactive.light,
    disabled: AppColors.disabled.light,
  );
  static final AppStylesExtension _lightAppStyles = AppStylesExtension(
    productTileStyle: AppStyle.productTileStyle.light,
    productDetailStyle: AppStyle.productDetailStyle.light,
    cartItemStyle: AppStyle.cartItemStyle.light,
    orderInfoStyle: AppStyle.orderInfoStyle.light,
  );

  static const AnimationStyle themeAnimationStyle = AnimationStyle(
    duration: Duration(milliseconds: 250),
    curve: Curves.easeInCubic,
    reverseCurve: Curves.easeOutCubic,
  );
}

// Usage example: Theme.of(context).appColors or context.theme.appColors;
extension AppThemeExtension on ThemeData {
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? AppThemes._lightAppColors;
  AppStylesExtension get appStyles =>
      extension<AppStylesExtension>() ?? AppThemes._lightAppStyles;
}

extension ThemeGetter on BuildContext {
  // Usage example: `context.theme`
  ThemeData get theme => Theme.of(this);
}
