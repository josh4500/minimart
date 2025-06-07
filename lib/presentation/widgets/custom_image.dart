import 'package:flutter/material.dart';
import 'package:minimart/generated/l10n.dart' show S;
import 'package:minimart/presentation/themes.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.image, this.fit = BoxFit.cover});
  final ImageProvider image;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image(
        image: image,
        fit: fit,
        errorBuilder: (_, _, _) {
          return Column(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: AppColors.grey700),
              Text(
                S.of(context).failedToLoadImage,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12, color: AppColors.grey700),
              ),
            ],
          );
        },
        loadingBuilder: (_, Widget child, event) {
          return Stack(
            alignment: Alignment.center,
            children: [
              child,
              if (event?.cumulativeBytesLoaded != event?.expectedTotalBytes)
                const CircularProgressIndicator.adaptive(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(AppColors.grey700),
                ),
            ],
          );
        },
      ),
    );
  }
}
