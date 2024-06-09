import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/styles/colors.dart';
import 'package:skar/methods/pages/product.dart';
import 'package:skar/methods/parts/image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/models/product_color.dart' as color;
import 'package:skar/providers/pages/product.dart';

class ProductColorPage extends ConsumerWidget {
  const ProductColorPage(
      {super.key, required this.productColors, required this.pageController});

  final List<color.ProductColor> productColors;
  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);
    int selectedColor = ref.watch(selectedProductColorProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleMethod(
          context,
          "${AppLocalizations.of(context)!.colors} ( ${productColors.length} ${AppLocalizations.of(context)!.differentColor} )",
        ),
        SizedBox(
          height: screenProperties(context).height / 5,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productColors.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  width: screenProperties(context).width * .3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: isLightBrightness
                          ? elevatedButtonColor
                          : Colors.white,
                      width: selectedColor == index ? 2 : 0,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: InkWell(
                      onTap: () {
                        ref.read(selectedProductColorProvider.notifier).state =
                            index;
                        ref.read(activeImageColorProvider.notifier).state = 0;
                        pageController.jumpTo(0);
                      },
                      child:
                          showCachImageMethod(productColors[index].images![0]),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        titleMethod(
          context,
          AppLocalizations.of(context)!.body,
        ),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productColors[selectedColor].dimensions!.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: elevatedButtonColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
                width: 50,
                child: Center(
                  child: Text(
                    productColors[selectedColor].dimensions![index],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
