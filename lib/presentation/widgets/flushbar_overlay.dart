import 'dart:async';

import 'package:flutter/material.dart';
import 'package:minimart/presentation/themes.dart';

class FlushbarOverlay extends StatefulWidget {
  const FlushbarOverlay({super.key, required this.child});
  final Widget child;

  @override
  State<FlushbarOverlay> createState() => _FlushbarOverlayState();

  static void showSuccess(
    BuildContext context, {
    required String message,
    VoidCallback? onClose,
  }) {
    show(context, onClose: onClose, message: message);
  }

  static void showFailure(
    BuildContext context, {
    required String message,
    VoidCallback? onClose,
  }) {
    show(context, onClose: onClose, message: message, isSuccess: false);
  }

  static void show(
    BuildContext context, {
    bool isSuccess = true,
    required String message,
    VoidCallback? onClose,
  }) {
    context.findAncestorStateOfType<_FlushbarOverlayState>()?.showFlush(
      message: message,
      isSuccess: isSuccess,
    );
  }
}

class _FlushbarOverlayState extends State<FlushbarOverlay> {
  final ValueNotifier<List<(int, String, bool)>> _messages = ValueNotifier([]);

  @override
  void dispose() {
    _messages.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          Positioned.fill(child: widget.child),
          ValueListenableBuilder(
            valueListenable: _messages,
            builder:
                (BuildContext context, List<(int, String, bool)> messages, _) {
                  return SafeArea(
                    child: Stack(
                      children: [
                        for (final (int, String, bool) msg in messages)
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Flush(
                              key: ValueKey(msg.$1),
                              message: msg.$2,
                              isSuccess: msg.$3,
                              onClose: () {
                                _removeMessage(msg.$1);
                              },
                            ),
                          ),
                      ],
                    ),
                  );
                },
          ),
        ],
      ),
    );
  }

  void showFlush({required String message, required bool isSuccess}) {
    _messages.value = [
      ..._messages.value,
      (DateTime.now().millisecondsSinceEpoch, message, isSuccess),
    ];
  }

  void _removeMessage(int id) {
    final messages = _messages.value;
    messages.removeWhere((msg) => msg.$1 == id);
    _messages.value = [...messages];
  }
}

class Flush extends StatefulWidget {
  const Flush({
    super.key,
    required this.isSuccess,
    required this.message,
    required this.onClose,
  });

  final bool isSuccess;
  final String message;
  final VoidCallback onClose;

  @override
  State<Flush> createState() => _FlushState();
}

class _FlushState extends State<Flush> with SingleTickerProviderStateMixin {
  Timer? _timer;
  late final AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 250),
    reverseDuration: const Duration(milliseconds: 150),
  );
  late Animation animation = CurvedAnimation(
    parent: controller,
    curve: Curves.easeInOutCubic,
  );

  @override
  void initState() {
    super.initState();
    controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _timer?.cancel();
        _timer = Timer(const Duration(seconds: 2), handleClose);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller.forward();
  }

  @override
  void dispose() {
    _timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  Future<void> handleClose() async {
    _timer?.cancel(); // In case it's abruptly cancelled
    await controller.reverse();
    widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? childWidget) {
        return FractionalTranslation(
          translation: Offset(0, 1.0 - animation.value),
          child: childWidget,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.theme.appColors.background,
            border: Border(
              left: BorderSide(
                width: 8,
                color: widget.isSuccess
                    ? context.theme.appColors.success
                    : context.theme.appColors.failure,
              ),
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withAlpha((.1 * 255).toInt()),
                offset: const Offset(4, 4),
                blurRadius: 6,
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    spacing: 12,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.check_circle_outline),
                      ),
                      Expanded(
                        child: Text(
                          widget.message,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.grey700,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: handleClose,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(Icons.clear),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
