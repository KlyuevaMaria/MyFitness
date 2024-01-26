// Place fonts/CustomIcons.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: CustomIcons
//      fonts:
//       - asset: fonts/CustomIcons.ttf
import 'package:flutter/widgets.dart';

class CustomIcons {
  CustomIcons._();

  static const String _fontFamily = 'CustomIcons';

  static const IconData cup = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData home = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData logo = IconData(0xe905, fontFamily: _fontFamily);
  static const IconData plus = IconData(0xe901, fontFamily: _fontFamily);
  static const IconData pulse = IconData(0xe903, fontFamily: _fontFamily);
  static const IconData person = IconData(0xe904, fontFamily: _fontFamily);
}
