import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleImageWidget extends StatelessWidget {
  final String image;
  final double size;
  const CircleImageWidget({Key? key, required this.image, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 5),
            )
          ],
          shape: BoxShape.circle,
          image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
