import 'package:flutter/material.dart';

Widget carryImageWidget({required String url}) {
  return Image.network(
    url,
    fit: BoxFit.fitHeight,
    loadingBuilder:
        (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
      if (loadingProgress == null) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20), // Image border
          child: SizedBox.fromSize(
            size: const Size.fromRadius(48), // Image radius
            child: child,
          ),
        );
      }
      return Container(
        margin: const EdgeInsets.fromLTRB(0, 50, 0, 50),
        child: Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        ),
      );
    },
  );
}
