import 'package:flutter/material.dart';

class AppColors {
  static const Color yellow = Color(0xFFE39419);
  static const Color red = Color(0xFFCA3114);
  static const Color green = Color(0xFF21BA85);

  static int _primary = 0xFFE39419;

  static MaterialColor primarySwatch =
      MaterialColor(_primary, <int, Color>{
        50: Color(_primary,),
        100: Color(_primary,),
        200: Color(_primary,),
        300: Color(_primary,),
        400: Color(_primary,),
        500: Color(_primary,),
        600: Color(_primary,),
        700: Color(_primary,),
        800: Color(_primary,),
        900: Color(_primary,),
      });
}
