import 'package:advanced_shop/presentation/resources/fonts_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(
  String fontFamily,
  double fontSize,
  FontWeight fontWeight,
  Color color,
) {
  return TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

// Light style
TextStyle getLightStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    FontConstants.fontFamily,
    fontSize,
    FontWeightManger.light,
    color,
  );
}

// Regular style
TextStyle getRegularStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    FontConstants.fontFamily,
    fontSize,
    FontWeightManger.regular,
    color,
  );
}

// Medium style
TextStyle getMediumStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    FontConstants.fontFamily,
    fontSize,
    FontWeightManger.medium,
    color,
  );
}

// SemiBold style
TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    FontConstants.fontFamily,
    fontSize,
    FontWeightManger.semiBold,
    color,
  );
}

// Bold style
TextStyle getBoldStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    FontConstants.fontFamily,
    fontSize,
    FontWeightManger.bold,
    color,
  );
}
