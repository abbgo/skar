import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter/services.dart';
import 'package:skar/datas/screen.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/category.dart';
import 'package:skar/models/product.dart';
import 'package:skar/models/shop.dart';

Padding shopCardTextMethod(
  String text,
  double fontSize,
  TextDecoration decoration,
  FontWeight fontWeight,
  Color? color,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        decoration: decoration,
        color: color,
      ),
      maxLines: 2,
    ),
  );
}

showCallBottomSheet(BuildContext context, List<dynamic> shopPhones) {
  showModalBottomSheet(
    context: context,
    builder: (context) => Wrap(
      children: shopPhones
          .map(
            (e) => ListTile(
              title: Text(
                e.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () async {
                      await Clipboard.setData(
                          ClipboardData(text: e.toString()));
                    },
                    icon: const Icon(
                      Icons.copy_all,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      FlutterPhoneDirectCaller.callNumber(e.toString());
                    },
                    icon: const Icon(
                      Icons.call,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    ),
  );
}

Stack productStackMethod(
  Product product,
  bool isTM,
  double imageHeigt,
  double imageWidth,
  double nameSize,
  double priceSize,
) {
  return Stack(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: CachedNetworkImage(
              width: imageWidth != 0 ? imageWidth : null,
              height: imageHeigt != 0 ? imageHeigt : null,
              imageUrl: "$pathUrl/${product.image}",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  loadWidget,
              errorWidget: (context, url, error) => errImage,
              fit: BoxFit.cover,
            ),
          ),
          shopCardTextMethod(
            isTM ? product.nameTM : product.nameRU,
            nameSize,
            TextDecoration.none,
            FontWeight.bold,
            Colors.black,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shopCardTextMethod(
                "${product.price} man",
                priceSize,
                TextDecoration.none,
                FontWeight.bold,
                Colors.red,
              ),
              product.oldPrice != 0
                  ? shopCardTextMethod(
                      "${product.oldPrice} man",
                      priceSize,
                      TextDecoration.lineThrough,
                      FontWeight.normal,
                      Colors.black,
                    )
                  : const SizedBox(),
            ],
          ),
        ],
      ),
      Positioned(
        right: 5,
        top: 5,
        child: GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 15,
              child: Icon(Icons.favorite_border, size: 16),
            ),
          ),
        ),
      ),
    ],
  );
}

Text shopTextMethod(double fontSize, String text, FontWeight fontWeight) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.black,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
    textAlign: TextAlign.center,
    maxLines: 2,
  );
}

SliverAppBar shopImageMethod(ScreenProperties screenSize, String? shopImage) {
  return SliverAppBar(
    backgroundColor: Colors.white,
    expandedHeight: screenSize.height / 4,
    automaticallyImplyLeading: false,
    flexibleSpace: FlexibleSpaceBar(
      background: CachedNetworkImage(
        imageUrl: '$pathUrl/$shopImage',
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            loadWidget,
        errorWidget: (context, url, error) => errImage,
        fit: BoxFit.cover,
      ),
    ),
  );
}

SliverAppBar shopDetailMethod(
  ScreenProperties screenSize,
  BuildContext context,
  Shop shop,
  bool isTM,
  bool loadMore,
  List<Kategory> categories,
  Kategory category,
  Function getChildCategories,
) {
  return SliverAppBar(
    backgroundColor: Colors.white,
    pinned: true,
    elevation: 0,
    scrolledUnderElevation: 0,
    toolbarHeight: screenSize.height / 5,
    automaticallyImplyLeading: false,
    flexibleSpace: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          shopTextMethod(18, isTM ? shop.nameTM : shop.nameRU, FontWeight.bold),
          shopTextMethod(
              16, isTM ? shop.addressTM! : shop.addressRU!, FontWeight.normal),
          shopButtonsMethod(context, shop),
          const SizedBox(height: 10),
          shopCategoriesMethod(
              categories, isTM, shop.id, category, getChildCategories),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: loadMore
                ? LinearProgressIndicator(color: elevatedButtonColor)
                : const SizedBox(),
          ),
        ],
      ),
    ),
  );
}

Row shopButtonsMethod(BuildContext context, Shop shop) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.adaptive.arrow_back,
          color: Colors.black,
        ),
      ),
      Row(
        children: [
          IconButton(
            onPressed: null,
            icon: Image.asset("assets/icons/search.png", height: 25),
          ),
          const IconButton(
            onPressed: null,
            icon: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              showCallBottomSheet(context, shop.phones!);
            },
            icon: const Icon(
              Icons.call,
              color: Colors.green,
            ),
          ),
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.more_horiz, color: Colors.black),
          ),
        ],
      ),
    ],
  );
}

SizedBox shopCategoriesMethod(
  List<Kategory> categories,
  bool isTM,
  String shopID,
  Kategory kategory,
  Function getChildCategories,
) {
  return SizedBox(
    height: kategory.id.isEmpty ? 30 : 50,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kategory.id.isNotEmpty ? Text(kategory.nameTM) : const SizedBox(),
        Expanded(
          child: kategory.childCategories == null
              ? listCategoriesMethod(categories, getChildCategories, isTM)
              : listCategoriesMethod(
                  kategory.childCategories!, getChildCategories, isTM),
        ),
      ],
    ),
  );
}

ListView listCategoriesMethod(
    List<Kategory> categories, Function getChildCategories, bool isTM) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: categories.length,
    itemBuilder: (context, index) {
      var category = categories[index];

      return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: () {
            getChildCategories(index);
          },
          child: Text(
            isTM ? category.nameTM : category.nameRU,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    },
  );
}
