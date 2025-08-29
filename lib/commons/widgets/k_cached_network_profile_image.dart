import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class KCachedNetworkProfileImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;

  const KCachedNetworkProfileImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: Colors.grey[200],
          child: Icon(Icons.person, color: Colors.grey[600]),
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.grey[200],
          child: Icon(Icons.error, color: Colors.grey[600]),
        ),
      ),
    );
  }
}
