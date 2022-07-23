import 'package:flutter/material.dart';

import './color_manager.dart';
import './fonts_manager.dart';
import './styles_manager.dart';
import './values_manager.dart';

final kAppTheme = ThemeData(
  /// Main app colors
  primarySwatch: const MaterialColor(
    ColorManager.primaryInt,
    ColorManager.tintPrimary,
  ),
  // primaryColor: ColorManager.primary,
  primaryColorLight: ColorManager.primaryWithOpacity70,
  primaryColorDark: ColorManager.darkPrimary,
  accentColor: ColorManager.grey,

  /// Will be used in case of disabled button for example.
  disabledColor: ColorManager.grey1,

  /// ripple color.
  splashColor: ColorManager.primaryWithOpacity70,

  /// CardView theme
  cardTheme: CardTheme(
    color: ColorManager.white,
    shadowColor: ColorManager.grey,
    elevation: AppSize.s4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
    ),
  ),

  /// AppBar theme
  appBarTheme: AppBarTheme(
    centerTitle: true,
    color: ColorManager.primary,
    elevation: AppSize.s4,
    shadowColor: ColorManager.primaryWithOpacity70,
    titleTextStyle: getRegularStyle(
      color: ColorManager.white,
      fontSize: FontSize.s16,
    ),
  ),

  /// Button theme
  buttonTheme: const ButtonThemeData(
    shape: StadiumBorder(),
    disabledColor: ColorManager.grey1,
    buttonColor: ColorManager.primary,
    splashColor: ColorManager.primaryWithOpacity70,
  ),

  /// ElevatedButton theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: getRegularStyle(
        color: ColorManager.white,
      ),
      primary: ColorManager.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
    ),
  ),

  /// Text theme
  textTheme: TextTheme(
    displayLarge: getLightStyle(
      color: ColorManager.white,
      fontSize: FontSize.s22,
    ),
    headlineLarge: getSemiBoldStyle(
      color: ColorManager.darkGrey,
      fontSize: FontSize.s16,
    ),
    headlineMedium: getRegularStyle(
      color: ColorManager.darkGrey,
      fontSize: FontSize.s14,
    ),
    titleMedium: getMediumStyle(
      color: ColorManager.primary,
      fontSize: FontSize.s16,
    ),
    titleSmall: getMediumStyle(
      color: ColorManager.lightGrey,
      fontSize: FontSize.s14,
    ),
    bodyLarge: getRegularStyle(color: ColorManager.grey1),
    bodySmall: getRegularStyle(color: ColorManager.grey),
  ),

  /// Input decoration theme (TextFormField)
  inputDecorationTheme: InputDecorationTheme(
    // Padding around the input and hint text.
    contentPadding: const EdgeInsets.all(AppPadding.p8),

    // Style of the hint text.
    hintStyle: getRegularStyle(color: ColorManager.grey1),

    // Style of the label text.
    labelStyle: getMediumStyle(color: ColorManager.darkGrey),

    // Style of the error text.
    errorStyle: getRegularStyle(color: ColorManager.error),

    // Border style when it's enabled.
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s8),
      borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
    ),

    // Border style when it's in focus mode.
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s8),
      borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
    ),

    // Border style when it's in error mode.
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s8),
      borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
    ),

    // Border style when it's in focus and error mode.
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s8),
      borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
    ),
  ),
);
