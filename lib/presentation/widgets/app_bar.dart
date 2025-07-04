import 'package:flutter/material.dart';
import 'package:minimart/generated/l10n.dart' show S;
import 'package:minimart/presentation/constants.dart';
import 'package:minimart/presentation/providers.dart';
import 'package:minimart/presentation/themes.dart';
import 'package:provider/provider.dart';

import 'app_logo.dart';
import 'back_button.dart';

class MinimartAppBar extends StatelessWidget {
  const MinimartAppBar({
    super.key,
    this.bottom,
    this.leadingLabel,
    this.showLeading = true,
  });
  final String? leadingLabel;
  final bool showLeading;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          color: context.theme.appColors.background,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppLogo(),
                  Expanded(
                    child: Selector<UserProvider, String?>(
                      selector: (_, userProvider) {
                        return userProvider.user?.deliveryAddress;
                      },
                      builder: (_, String? deliveryAddress, _) {
                        if (deliveryAddress == null) return const SizedBox();
                        return Column(
                          spacing: 4,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              S.of(context).deliveryAddress,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.grey700,
                              ),
                            ),
                            Text(
                              deliveryAddress,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.grey700,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: AppValues.LOGO_SIZE,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        MinimartIcons.notification_outlined,
                        color: context.theme.appColors.foreground,
                      ),
                    ),
                  ),
                ],
              ),
              ?bottom,
            ],
          ),
        ),
        const Divider(height: 0),
        if (showLeading) MinimartBackButton(label: leadingLabel),
      ],
    );
  }
}
