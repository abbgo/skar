import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';

class ShowImage extends StatefulWidget {
  const ShowImage({super.key, required this.images});

  final List<dynamic> images;

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  // VARIABLES ---------------------------------
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, scrolledUnderElevation: 0),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: screenProperties(context).height * .7,
            child: InteractiveViewer(
              minScale: 0.01,
              maxScale: 4,
              child: showCachImageMethod(widget.images[_selectedColor]),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    width: screenProperties(context).width * .3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: elevatedButtonColor,
                        width: _selectedColor == index ? 2 : 0,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedColor = index;
                          });
                        },
                        child: showCachImageMethod(widget.images[index]),
                      ),
                    ),
                  ),
                );
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
