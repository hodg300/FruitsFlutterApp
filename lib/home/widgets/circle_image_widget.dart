import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruitsapp/utils/utils.dart';

class CircleImageWidget extends StatelessWidget {
  final String image;
  final double size;
  const CircleImageWidget({Key? key, required this.image, required this.size}) : super(key: key);

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
              image: imageProvider, fit: BoxFit.fill, filterQuality: FilterQuality.high),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
    // return SizedBox(
    //   height: Utils.screenHeightSize(context) * 0.3,
    //   width: Utils.screenHeightSize(context) * 0.3,
    //   child: CircleAvatar(
    //     radius: 45,
    //     child: ClipRRect(
    //       borderRadius:  BorderRadius.circular(100),
    //     child: CachedNetworkImage(
    //         imageUrl: image,
    //         fit: BoxFit.cover,
    //         // height: 80,
    //         // width: 80,
    //         progressIndicatorBuilder:
    //             (context, url, downloadProgress) =>
    //             CircularProgressIndicator(
    //               value: downloadProgress.progress,
    //               color: Colors.white,
    //             ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
