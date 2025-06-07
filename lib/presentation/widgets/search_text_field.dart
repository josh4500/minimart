import 'package:flutter/material.dart';
import 'package:minimart/generated/l10n.dart' show S;
import 'package:minimart/presentation/themes.dart';

class MinimartSearchTextField extends StatelessWidget {
  const MinimartSearchTextField({super.key, this.controller, this.onSearch});

  final TextEditingController? controller;
  final ValueChanged<String>? onSearch;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: onSearch,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: S.of(context).search,
        hintStyle: const TextStyle(color: AppColors.grey300),
        contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          child: Icon(Icons.search),
        ),
        prefixIconConstraints: const BoxConstraints.tightFor(width: 36),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: context.theme.appColors.accent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: context.theme.appColors.accent),
        ),
      ),
    );
  }
}
