import 'package:flutter/material.dart';
import 'package:minimart/presentation/themes.dart';

class MinimartButton extends StatelessWidget {
  const MinimartButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.enabled = true,
  });

  final VoidCallback onPressed;
  final String title;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FilledButton(
        onPressed: onPressed,
        style: ButtonStyle(
          enableFeedback: true,
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 44)),
          backgroundColor: WidgetStateColor.resolveWith((state) {
            if (state.contains(WidgetState.disabled) || !enabled) {
              return context.theme.appColors.disabled;
            }

            return context.theme.appColors.selected;
          }),
        ),

        child: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
      ),
    );
  }
}

class MinimartIconButton extends StatelessWidget {
  const MinimartIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.bgColor = AppColors.white,
    this.border,
    this.margin,
  });

  final VoidCallback? onTap;
  final Widget icon;
  final Color bgColor;
  final EdgeInsets? margin;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: margin,
        decoration: BoxDecoration(
          color: bgColor,
          border: border,
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}
