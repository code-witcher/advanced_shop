import 'package:flutter/material.dart';

class ColorManager {
  static const tintPrimary = {
    50: Color(0xFFf4c17e),
    100: Color(0xFFf2b669),
    200: Color(0xFFf1ac53),
    300: Color(0xFFefa13e),
    400: Color(0xFFed9728),
    500: Color(0xFFd58824),
    600: Color(0xFFbe7920),
    700: Color(0xFFa66a1c),
    800: Color(0xFF8e5b18),
    900: Color(0xFF774c14),
  };
  static const int primaryInt = 0xFFED9728;

  static const Color primary = Color(0xFFED9728);
  static const Color primaryWithOpacity70 = Color(0xB3ED9728);
  static const Color darkGrey = Color(0xFF525252);
  static const Color grey = Color(0xFF737477);
  static const Color lightGrey = Color(0xFF9E9E9E);

  static const Color darkPrimary = Color(0xFFd17d11);
  static const Color grey1 = Color(0xFF707070);
  static const Color grey2 = Color(0xFF797979);
  static const Color white = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFe61f34); // red color.

  static const Color trans = Colors.transparent;
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');

    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString'; // 8 chars with 100% opacity
    }

    return Color(int.parse(hexColorString, radix: 16));
  }
}
