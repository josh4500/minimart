import 'package:auto_route/auto_route.dart' show AutoLeadingButton, LeadingType;
import 'package:flutter/material.dart';

class MinimartBackButton extends StatelessWidget {
  const MinimartBackButton({super.key, this.label});
  final String? label;

  @override
  Widget build(BuildContext context) {
    return AutoLeadingButton(
      builder: (_, LeadingType type, VoidCallback? action) {
        if (type == LeadingType.noLeading) return const SizedBox();
        return GestureDetector(
          onTap: action,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              spacing: 8,
              children: [
                const Icon(Icons.chevron_left, size: 30),
                if (label != null)
                  Text(
                    label!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
