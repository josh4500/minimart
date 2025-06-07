import 'package:flutter/material.dart';
import 'package:minimart/presentation/constants.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: AppValues.LOGO_SIZE),
      decoration: BoxDecoration(
        color: const Color(0xFF93C5FD),
        border: Border.all(color: const Color(0xFF548AF3)),
      ),
      child: Image.asset('assets/icons/full_logo.png'),
    );
  }
}
