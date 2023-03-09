import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FCachedImageWidget extends StatefulWidget {
  final String url;
  final int? width;
  final int? height;

  const FCachedImageWidget({super.key, required this.url, this.width, this.height});

  @override
  State<FCachedImageWidget> createState() => _FCachedImageWidgetState();
}

class _FCachedImageWidgetState extends State<FCachedImageWidget> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      memCacheWidth: widget.width ?? 50,
      memCacheHeight: widget.height ?? 50,
      imageUrl: widget.url,
      fadeInDuration: const Duration(milliseconds: 100),
      fadeOutDuration: const Duration(milliseconds: 100),
      imageBuilder: (context, imageProvider) => Container(
        width: widget.width != null ? widget.width!.toDouble() : 50.0,
        height: widget.height != null ? widget.height!.toDouble() : 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider, // colorFilter: ColorFilter.mode(Colors.pink.shade200, BlendMode.colorBurn),
          ),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.people_alt_rounded),
    );
  }
}
