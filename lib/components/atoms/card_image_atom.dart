import 'package:flutter/material.dart';
import '../atoms/app_style.dart';

class CardImageAtom extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final double borderRadius;
  final double borderWidth;

  const CardImageAtom({
    super.key,
    this.imageUrl,
    this.height = 250.0,
    this.width = 180.0,
    this.borderRadius = 10.0,
    this.borderWidth = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppStyle.accentColor, width: borderWidth),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.network(
          imageUrl ?? 'https://via.placeholder.com/180x250',
          height: height,
          width: width,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: height,
              width: width,
              color: Colors.grey[300],
              child: const Center(
                child: Icon(Icons.error, color: Colors.red),
              ),
            );
          },
        ),
      ),
    );
  }
}
