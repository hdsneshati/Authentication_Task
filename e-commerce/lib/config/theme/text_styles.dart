import 'package:authentication_task/config/theme/color_pallet.dart';
import 'package:flutter/material.dart';

TextTheme lightTextTheme = TextTheme(
    //! title
    titleLarge: TextStyle(
      fontFamily: "circular",
      fontSize: 35,
      color: ColorPallet.lightColorScheme.onSurface,
      fontWeight: FontWeight.w800,
    ),
    titleMedium: TextStyle(
      fontFamily: "circular",
      fontSize: 16,
      color: ColorPallet.lightColorScheme.onSurface,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      fontFamily: "circular",
      fontSize: 14,
      color: ColorPallet.lightColorScheme.onSurface,
      fontWeight: FontWeight.w500,
    ),

//! label
    labelLarge: TextStyle(
        fontFamily: "circular",
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: ColorPallet.lightColorScheme.onPrimary),
    bodySmall: TextStyle(
        fontFamily: "circular",
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: ColorPallet.lightColorScheme.onSurface),

//! body
    bodyMedium: TextStyle(
        fontFamily: "circular",
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: ColorPallet.lightColorScheme.surfaceBright));
