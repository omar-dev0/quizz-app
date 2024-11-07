
const String _animationPath = "assets/animations/";
const String _iconsPath = "assets/icons/";
const String _imagesPath = "assets/images/";

abstract class ImageAssets{
  static const String examItemImage = "${_imagesPath}exam_icon.png";
  static const String profileImage = '${_imagesPath}profile.png';
  static const String timerImage = "${_imagesPath}timer.png";
  static const String timerEnd = "${_imagesPath}end.png";
}


abstract class AnimationAssets{
  static const String error = '${_animationPath}error.json';
  static const String success = '${_animationPath}success.json';
  static const String loading = '${_animationPath}loading.json';

}

abstract class IconsAssets{
}