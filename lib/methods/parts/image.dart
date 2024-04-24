import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skar/helpers/static_data.dart';

class ShowImage extends StatefulWidget {
  const ShowImage({super.key, required this.images});

  final List<dynamic> images;

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, scrolledUnderElevation: 0),
      body: Column(
        children: [
          showCachImageMethod(widget.images[0]),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return showCachImageMethod(widget.images[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

CachedNetworkImage showCachImageMethod(String image) {
  return CachedNetworkImage(
    imageUrl: '$pathUrl/$image',
    progressIndicatorBuilder: (context, url, downloadProgress) => loadWidget,
    errorWidget: (context, url, error) => errImage,
    fit: BoxFit.cover,
  );
}
