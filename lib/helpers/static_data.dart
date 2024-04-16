import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String apiUrl = dotenv.env['API_URL']!;
String pathUrl = dotenv.env['PATH_URL']!;

Color elevatedButtonColor = const Color(0xff1e4a71);

Image errImage = Image.asset("assets/images/back_logo.jpg", fit: BoxFit.cover);

Widget loadWidget =
    Center(child: CircularProgressIndicator(color: elevatedButtonColor));
