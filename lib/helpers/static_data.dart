import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:skar/styles/colors.dart';

String apiUrl = dotenv.env['API_URL']!;
String pathUrl = dotenv.env['PATH_URL']!;

Image errImage = Image.asset("assets/images/back_logo.jpg", fit: BoxFit.cover);

Widget loadWidget =
    Center(child: CircularProgressIndicator(color: elevatedButtonColor));

Center errorMethod(Object error) {
  return Center(
    child: Text(error.toString(), textAlign: TextAlign.center),
  );
}
