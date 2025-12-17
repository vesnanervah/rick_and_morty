import 'package:flutter/material.dart';

class SafeImage extends StatelessWidget {
  final String? url;
  final double? height;
  final double? width;

  const SafeImage({this.url, this.height, this.width, super.key});

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return placeholder();
    }
    return Image.network(
      url!,
      height: height,
      width: width,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => placeholder(),
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
          wasSynchronouslyLoaded ? child : placeholder(),
    );
  }

  Widget placeholder() => Image.asset(
    "assets/placeholder.png",
    height: height,
    width: width,
    fit: BoxFit.contain,
  );
}
