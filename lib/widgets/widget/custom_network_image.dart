import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  const CustomNetworkImage({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: context.primary,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          }
        },
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          // Error occurred while loading image, show default image
          return Image.asset(
            'assets/images/placeholder.jpg',
            fit: BoxFit.cover,
          ); // Provide path to your default image
        },
      ),
    );
  }
}
