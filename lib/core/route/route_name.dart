enum RouteName {
  home,
  signin,
  signup,
  forgotPassword,
  resetPassword,
  character,
}

extension RouteNameExtension on RouteName {
  String path() {
    switch (this) {
      case RouteName.home:
        return "/";
      case RouteName.signin:
        return "/signin";
      case RouteName.signup:
        return "/signup";
      case RouteName.forgotPassword:
        return "/forgot-password";
      case RouteName.resetPassword:
        return "/reset-password";
      case RouteName.character:
        return "/character";
    }
  }
}
