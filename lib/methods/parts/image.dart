import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/styles/colors.dart';
import 'package:skar/providers/pages/product.dart';

class ShowImage extends ConsumerWidget {
  const ShowImage({super.key, required this.images});

  final List<dynamic> images;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);
    int selectedImage = ref.watch(selectedImageProvider);

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: screenProperties(context).height * .8,
                child: InteractiveViewer(
                  minScale: 0.01,
                  maxScale: 4,
                  child: showCachImageMethod(images[selectedImage]),
                ),
              ),
              Positioned(
                top: 20,
                left: 5,
                child: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor:
                        isLightBrightness ? Colors.white : dialogColorDarkTheme,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.adaptive.arrow_back),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    width: screenProperties(context).width * .3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: isLightBrightness
                            ? elevatedButtonColor
                            : Colors.white,
                        width: selectedImage == index ? 2 : 0,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: InkWell(
                        onTap: () {
                          ref.read(selectedImageProvider.notifier).state =
                              index;
                        },
                        child: showCachImageMethod(images[index]),
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
