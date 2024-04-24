import 'package:flutter/material.dart';
import 'package:skar/datas/screen.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/methods/pages/shop.dart';
import 'package:skar/methods/parts/image.dart';
import 'package:skar/models/product.dart';
import 'package:skar/models/product_color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar/pages/product.dart';

Stack productImageMethod(
  BuildContext context,
  PageController pageController,
  ProductColor productColor,
  int activePage,
  Function pageChange,
) {
  return Stack(
    children: [
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShowImage(images: productColor.images!),
            ),
          );
        },
        child: SizedBox(
          width: double.infinity,
          height: screenProperties(context).height / 2,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (value) {
              pageChange(value);
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
                  backgroundColor:
                      activePage == index ? elevatedButtonColor : Colors.grey,
                ),
              ),
            ),
          ),
        ),
      )
    ],
  );
}

Row productPriceMethod(num? price, num? oldPrice) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "$price man",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.red,
        ),
      ),
      const SizedBox(width: 10),
      oldPrice != 0
          ? Text(
              "$oldPrice man",
              style: const TextStyle(
                fontSize: 16,
                decoration: TextDecoration.lineThrough,
              ),
            )
          : const SizedBox(),
    ],
  );
}

Padding productPriceAndBrendMethod(Product product, bool isTM) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isTM ? product.nameTM : product.nameRU,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              productPriceMethod(product.price, product.oldPrice),
            ],
          ),
        ),
        const SizedBox(width: 10),
        if (product.brend!.name != "")
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: showCachImageMethod(product.brend!.image!),
            ),
          )
        else
          const SizedBox(),
      ],
    ),
  );
}

Column productColorsMethod(
  BuildContext context,
  List<ProductColor>? productColors,
  int selectedColor,
  Function changeColor,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      titleMethod(
        context,
        "${AppLocalizations.of(context)!.colors} ( ${productColors!.length} ${AppLocalizations.of(context)!.differentColor} )",
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: elevatedButtonColor,
                    width: selectedColor == index ? 2 : 0,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: InkWell(
                    onTap: () {
                      changeColor(index);
                    },
                    child: showCachImageMethod(productColors[index].images![0]),
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

Padding titleMethod(
  BuildContext context,
  String text,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: elevatedButtonColor.withOpacity(0.1)),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    ),
  );
}

Column similarProductsMethod(
  BuildContext context,
  ScreenProperties screenSize,
  List<Product> similarProducts,
  bool isTM,
  String shopID,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      titleMethod(
        context,
        AppLocalizations.of(context)!.similarProducts,
      ),
      SizedBox(
        height: screenSize.height * 0.35,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: similarProducts.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductPage(
                      productID: similarProducts[index].id,
                      isTM: isTM,
                      shopID: shopID,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Card(
                  surfaceTintColor: Colors.white,
                  color: Colors.white,
                  elevation: 3,
                  child: productStackMethod(
                    similarProducts[index],
                    isTM,
                    screenSize.height * 0.25,
                    screenSize.width * 0.5 - 30,
                    16,
                    14,
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
