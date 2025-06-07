import 'package:flutter/material.dart';

class NavIcon extends StatelessWidget {
  const NavIcon(
    this.icon, {
    super.key,
    this.color = Colors.transparent,
    this.badgeCount,
  });

  final IconData icon;
  final Color color;
  final int? badgeCount;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: Builder(
          builder: (context) {
            final widget = Icon(icon);
            if (badgeCount != null) {
              return Badge(
                label: Text(badgeCount.toString()),
                padding: const EdgeInsets.all(2),
                backgroundColor: const Color(0xFF3C4856),
                child: widget,
              );
            }
            return widget;
          },
        ),
      ),
    );
  }
}
