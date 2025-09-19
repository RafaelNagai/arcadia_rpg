enum RouteName { home }

extension RouteNameExtension on RouteName {
  String path() {
    switch (this) {
      case RouteName.home:
        return "/";
    }
  }
}
