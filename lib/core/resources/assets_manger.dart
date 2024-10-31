import 'package:flutter/cupertino.dart';

const String _animationPath = "assets/animations/";
const String _iconsPath = "assets/icons/";
const String _imagesPath = "assets/images/";

abstract class ImageAssets{
  static const String examItemImage = "lib/core/resources/images/Profit.png";
}

abstract class AnimationAssets{
  static const String error = '${_animationPath}error.json';
  static const String success = '${_animationPath}success.json';
  static const String loading = '${_animationPath}loading.json';

}

abstract class IconsAssets{
}