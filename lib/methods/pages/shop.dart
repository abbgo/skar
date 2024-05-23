import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter/services.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/product.dart';

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
