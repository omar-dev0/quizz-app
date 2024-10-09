class RememberMeManager {
  bool _isRememberMeBoxChecked = false;

  void setRememberMeBoxState(bool isRememberMeBoxChecked) {
    _isRememberMeBoxChecked = isRememberMeBoxChecked;
  }

  bool get isRememberMeBoxChecked => _isRememberMeBoxChecked;
}
