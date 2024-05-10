import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PresentationHelper {
  Widget buildImageAsset({required String asset, double? height, double? width, BoxFit? boxFit, Color? color}) {
    return Image.asset(asset, height: height, width: width, fit: boxFit, color: color,);
  }

  Widget buildSVGAsset({required String asset, double? height, double? width, BoxFit? boxFit, Color? color}) {
    return SvgPicture.asset(asset, height: height, width: width, fit: boxFit ?? BoxFit.contain);
  }
}