import 'package:flutter/material.dart';
import 'index.dart';

class RouteObservers<R extends Route<dynamic>> extends RouteObserver<R> {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    var name = route.settings.name ?? '';
    if (name.isNotEmpty) RoutePages.history.add(name);
    debugPrint('didPush $name');
    debugPrint(RoutePages.history.toString());
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    RoutePages.history.remove(route.settings.name);
    debugPrint('didPop ${route.settings.name}');
    debugPrint(RoutePages.history.toString());
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null) {
      var index = RoutePages.history.indexWhere((element) {
        return element == oldRoute?.settings.name;
      });
      var name = newRoute.settings.name ?? '';
      if (name.isNotEmpty) {
        if (index > 0) {
          RoutePages.history[index] = name;
        } else {
          RoutePages.history.add(name);
        }
      }
    }
    debugPrint('didReplace');
    debugPrint(RoutePages.history.toString());
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    RoutePages.history.remove(route.settings.name);
    debugPrint('didRemove ${route.settings.name}');
    debugPrint(RoutePages.history.toString());
  }

  void didStartUserGesture(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('didStartUserGesture ${route.settings.name}');
  }

  void didStopUserGesture() {
    debugPrint('didStopUserGesture');
  }
}
