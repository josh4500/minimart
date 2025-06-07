import 'package:flutter/material.dart';
import 'package:minimart/core.dart';

abstract final class AppColors {
  static const Color white = Color(0xFFFFFFFF);

  static const Color black = Color(0xFF000000);

  static const Color grey = Color(0xFF999999);
  static const Color grey100 = Color(0xFFF6F5F8);
  static const Color grey200 = Color(0xFFE2E8F0);
  static const Color grey500 = Color(0xFF64748B);
  static const Color grey700 = Color(0xFF334155);

  static const Color green = Color(0xFF10B981);
  static const Color pink = Color(0xFFFF2D55);

  static final ThemeVariant<Color> accent = ThemeVariant.value(
    const Color(0xFF60B5FF),
  );

  static final ThemeVariant<Color> active = ThemeVariant.value(
    const Color(0xFF60B5FF),
  );

  static final ThemeVariant<Color> inactive = ThemeVariant.value(
    const Color(0xFF078CFF),
  );

  static final ThemeVariant<Color> disabled = ThemeVariant.value(
    const Color(0xFFE2E8F0),
  );

  static final ThemeVariant<Color> selected = ThemeVariant.value(
    const Color(0xFF60B5FF),
  );

  static final ThemeVariant<Color> unselected = ThemeVariant.value(
    const Color(0xFF999999),
  );

  static final ThemeVariant<Color> success = ThemeVariant.value(
    const Color(0xFF10B981),
  );

  static final ThemeVariant<Color> highlight = ThemeVariant.value(
    const Color(0xFFF6F5F8),
  );

  static final ThemeVariant<Color> failure = ThemeVariant.value(
    const Color(0xFFFF2D55),
  );
}

final class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension({
    required this.accent,
    required this.background,
    required this.foreground,
    required this.success,
    required this.failure,
    required this.selected,
    required this.unselected,
    required this.active,
    required this.inactive,
    required this.disabled,
  });

  final Color accent;
  final Color background;
  final Color foreground;
  final Color success;
  final Color failure;
  final Color selected;
  final Color unselected;
  final Color active;
  final Color inactive;
  final Color disabled;

  @override
  ThemeExtension<AppColorsExtension> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(AppColorsExtension? other, double t) {
    return AppColorsExtension(
      accent: Color.lerp(accent, other?.accent, t)!,
      background: Color.lerp(background, other?.background, t)!,
      foreground: Color.lerp(foreground, other?.foreground, t)!,
      success: Color.lerp(success, other?.success, t)!,
      failure: Color.lerp(failure, other?.failure, t)!,
      selected: Color.lerp(selected, other?.selected, t)!,
      unselected: Color.lerp(unselected, other?.unselected, t)!,
      active: Color.lerp(active, other?.active, t)!,
      inactive: Color.lerp(inactive, other?.inactive, t)!,
      disabled: Color.lerp(disabled, other?.disabled, t)!,
    );
  }
}
