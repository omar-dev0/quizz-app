
const String _animationPath = "assets/animations/";
const String _iconsPath = "assets/icons/";
const String _imagesPath = "assets/Images/";

abstract class ImageAssets{
  static const String examItemImage = "${_imagesPath}Profit.png";
  static const String timerImage = "${_imagesPath}timer.png";
}

abstract class AnimationAssets{
  static const String error = '${_animationPath}error.json';
  static const String success = '${_animationPath}success.json';
  static const String loading = '${_animationPath}loading.json';

}

abstract class IconsAssets{
}