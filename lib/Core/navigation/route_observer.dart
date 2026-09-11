import 'dart:developer';

import 'package:flutter/material.dart';

class AppRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    log(
      '🔵 [PUSHED] ${route.settings.name} (from: ${previousRoute?.settings.name})',
    );
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    log(
      '🔴 [POPPED] ${route.settings.name} (back to: ${previousRoute?.settings.name})',
    );
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    log(
      '🟡 [REMOVED] ${route.settings.name} (back to: ${previousRoute?.settings.name})',
    );
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    log(
      '🟢 [REPLACED] ${oldRoute?.settings.name} with ${newRoute?.settings.name}',
    );
  }
}
