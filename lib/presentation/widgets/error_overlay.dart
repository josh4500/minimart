import 'package:flutter/material.dart';
import 'package:minimart/presentation/provider/error_handling.dart';
import 'package:minimart/presentation/widgets.dart';

class ErrorOverlay extends StatelessWidget {
  const ErrorOverlay({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

mixin ErrorScreenMixin<T extends StatefulWidget> on State<T> {
  List<ChangeNotifier> get providers;

  bool get showErrors => true;
  bool get clearOnDispose => true;

  @override
  void initState() {
    super.initState();
    _setupErrorListeners();
  }

  @override
  void dispose() {
    if (clearOnDispose) {
      _clearAllErrors();
    }
    super.dispose();
  }

  void _setupErrorListeners() {
    for (final provider in providers) {
      if (provider is ErrorHandling) {
        provider.addListener(() => _handleError(provider));
      }
    }
  }

  void _handleError(ErrorHandling provider) {
    if (provider.hasError && showErrors) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FlushbarOverlay.showFailure(context, message: provider.error!);
      });
    }
  }

  void _clearAllErrors() {
    for (final provider in providers) {
      if (provider is ErrorHandling) {
        provider.clearError();
      }
    }
  }
}
