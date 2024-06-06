import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/styles/colors.dart';
import 'package:skar/methods/navigation.dart';
import 'package:skar/methods/parts/image.dart';
import 'package:skar/models/product_color.dart';
import 'package:skar/providers/pages/product.dart';

class ProductImage extends StatelessWidget {
  const ProductImage(
      {super.key, required this.productColor, required this.pageController});

  final ProductColor productColor;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        int activeImage = ref.watch(activeImageColorProvider);

        return Stack(
          children: [
            InkWell(
              onTap: () => goToPage(
                context,
                ShowImage(images: productColor.images!),
                false,
              ),
              child: SizedBox(
                width: double.infinity,
                height: screenProperties(context).height / 2,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (value) {
                    ref.read(activeImageColorProvider.notifier).state = value;
                  },
                  itemCount: productColor.images!.length,
                  itemBuilder: (context, index) {
                    return showCachImageMethod(productColor.images![index]);
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    productColor.images!.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: activeImage == index
                            ? elevatedButtonColor
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
