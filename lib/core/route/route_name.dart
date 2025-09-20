enum RouteName { home, signin, signup }

extension RouteNameExtension on RouteName {
  String path() {
    switch (this) {
      case RouteName.home:
        return "/";
      case RouteName.signin:
        return "/signin";
      case RouteName.signup:
        return "/signup";
    }
  }
}
