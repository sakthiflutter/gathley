import 'package:flutter/material.dart';

ThemeData defaultTheme = ThemeData(
  fontFamily: 'SF Compact',
  primaryColor:const Color(0xFF232323) ,


  brightness: Brightness.light,
  highlightColor: Colors.white,
  hintColor: const Color(0xFF9E9E9E),
  colorScheme:  const ColorScheme.light(
    primary:  Color(0xFF232323),

    secondary: Color(0xFFbF1F1F1),


    background:Colors.white,

    error: Color(0xFFFF5555),

  ),
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
);
