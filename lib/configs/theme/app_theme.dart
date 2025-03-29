import 'package:flutter/material.dart';

//* Colors
import 'package:messaging/configs/theme/colors.dart';

class AppTheme {
  //#region ----------------------------------- Variables ---------------------------------

  int _themeColor = 0;
  Brightness _themeBrightness = Brightness.light;

  //#endregion

  //#region --------------------------------- Hooks ---------------------------------

  AppTheme({
    int themeColor = 0,
    Brightness themeBrightness = Brightness.light,
  }) {
    this.themeColor = themeColor;
    this.themeBrightness = themeBrightness;
  }

  //#endregion

  //#region --------------------------------- Accessors ---------------------------------

  set themeColor(int value) {
    if (value < 0 || value > colorThemes.length - 1) {
      throw ArgumentError(
        'The theme color must be a value between 0 and ${colorThemes.length - 1}',
      );
    }
    _themeColor = value;
  }

  set themeBrightness(Brightness value) {
    _themeBrightness = value;
  }

  //#endregion

  //#region --------------------------------- Methods ---------------------------------

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorThemes[_themeColor],
      brightness: _themeBrightness,
    );
  }

  //#endregion
}
