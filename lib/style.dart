import 'package:flutter/painting.dart';
import 'package:tinycolor/tinycolor.dart';

const marginMd = 15.0;
const marginSm = 8.0;
const paddingMd = marginMd;
const paddingSm = marginSm;

const fontSizeBase = 16.0;
const fontSizeLg = fontSizeBase * 1.25;
const fontSizeSm = fontSizeBase * 0.875;

// Colors
const whiteColor = 0xFFFFFFFF;
const gray100Color = 0xFFf8f9fa;
const gray200Color = 0xFFe9ecef;
const gray300Color = 0xFFdee2e6;
const gray400Color = 0xFFced4da;
const gray500Color = 0xFFadb5bd;
const gray600Color = 0xFF6c757d;
const gray700Color = 0xFF495057;
const gray800Color = 0xFF343a40;
const gray900Color = 0xFF212529;
const blackColor = 0xFF000000;

const blueColor = 0xFF0d6efd;
const indigoColor = 0xFF6610f2;
const purpleColor = 0xFF6f42c1;
const pinkColor = 0xFFd63384;
const redColor = 0xFFdc3545;
const orangeColor = 0xFFfd7e14;
const yellowColor = 0xFFffc107;
const greenColor = 0xFF76b852;
const tealColor = 0xFF20c997;
const cyanColor = 0xFF0dcaf0;

const spring1Color = 0xFF0ba360;
const spring2Color = 0xFF3cba92;

const primaryColor = blueColor;
const secondaryColor = gray600Color;
const successColor = greenColor;
const infoColor = cyanColor;
const warningColor = yellowColor;
const dangerColor = redColor;
const lightColor = gray100Color;
const darkColor = gray900Color;

// Spring
const springColor = 0xFFdeeddf;

enum ColorTheme {
  None,
  Spring,
}

// Borders
const borderRadius = 5.0;
Color getBorderColor(ColorTheme colorTheme) {
  switch (colorTheme) {
    case ColorTheme.Spring:
      return TinyColor(const Color(springColor)).darken(3).color;
    default:
      return const Color(gray200Color);
  }
}

// Box shadows
var boxShadow = BoxShadow(
  color: const Color(gray500Color),
  blurRadius: 8.0, // soften the shadow
  spreadRadius: -5.0, //extend the shadow
  offset: const Offset(
    0, // Move to right 10  horizontally
    5.0, // Move to bottom 10 Vertically
  ),
);

var borderSide = const BorderSide(
  width: 1,
  color: Color(gray300Color),
);
