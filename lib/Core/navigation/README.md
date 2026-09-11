## 🧭 Navigation Module - Clean Architecture

This navigation module follows best practices with separation of concerns and clean code principles.

### 📁 File Structure & Responsibilities

```
navigation/
├── app_routes.dart              # Main configuration (minimal)
├── navigation_service.dart      # Low-level navigation service
├── routes_constants.dart        # All route name constants
├── route_arguments.dart         # Strongly-typed argument models
├── route_guards.dart            # Authentication & permission guards
├── route_observer.dart          # Navigation event tracking
├── page_transitions.dart        # Reusable page animations
├── page_routes.dart             # Static routes (no arguments)
├── dynamic_routes.dart          # Dynamic routes (with arguments)
├── navigation_coordinator.dart  # High-level navigation API
└── README.md                    # This file
```

---

### 🚀 Usage Guide

#### 1. **Adding a New Route**

**Step 1:** Define the route in `routes_constants.dart`
```dart
static const String newPage = '/new-page';
```

**Step 2:** Add to `page_routes.dart` (if static) or `dynamic_routes.dart` (if with arguments)

```dart
// In page_routes.dart (static routes)
static Map<String, WidgetBuilder> getRoutes() {
  return {
    Routes.newPage: (_) => const NewPage(),
  };
}
```

**Step 3:** Add navigation method in `navigation_coordinator.dart`
```dart
static Future<dynamic>? toNewPage() {
  return NavigationService.navigateTo(Routes.newPage);
}
```

**Step 4:** Use in your UI
```dart
ElevatedButton(
  onPressed: () => NavigationCoordinator.toNewPage(),
  child: const Text('Go to New Page'),
)
```

---

#### 2. **Route with Arguments (Type-Safe)**

**Step 1:** Create argument model in `route_arguments.dart`
```dart
class NewPageArguments {
  final String title;
  final int count;

  NewPageArguments({
    required this.title,
    required this.count,
  });
}
```

**Step 2:** Add to `routes_constants.dart`
```dart
static const String newPage = '/new-page';
```

**Step 3:** Handle in `dynamic_routes.dart`
```dart
case Routes.newPage:
  if (args is NewPageArguments) {
    return PageTransitions.slideFromRightTransition(
      NewPage(arguments: args),
      settings,
    );
  }
  break;
```

**Step 4:** Add method in `navigation_coordinator.dart`
```dart
static Future<dynamic>? toNewPage({
  required NewPageArguments arguments,
}) {
  return NavigationService.navigateTo(
    Routes.newPage,
    arguments: arguments,
  );
}
```

**Step 5:** Use with type safety
```dart
NavigationCoordinator.toNewPage(
  arguments: NewPageArguments(
    title: 'Hello',
    count: 42,
  ),
);
```

---

#### 3. **Protected Routes (with Guards)**

**Step 1:** Create route guard in `route_guards.dart`
```dart
class CustomGuard implements RouteGuard {
  @override
  Future<bool> canActivate() async {
    // Your logic here
    return true;
  }

  @override
  String get blockedMessage => 'Access denied';
}
```

**Step 2:** Use in `navigation_coordinator.dart`
```dart
static Future<dynamic>? toProtectedPage() {
  return NavigationCoordinator.toProtectedRoute(
    Routes.protectedPage,
    guard: AuthenticationGuard(isLoggedIn: true),
  );
}
```

---

#### 4. **Page Transitions**

Use pre-built transitions in `page_transitions.dart`:

```dart
// Fade transition
PageTransitions.fadeTransition(page, settings)

// Slide from right
PageTransitions.slideFromRightTransition(page, settings)

// Slide from bottom
PageTransitions.slideFromBottomTransition(page, settings)

// Scale transition
PageTransitions.scaleTransition(page, settings)

// Rotate transition
PageTransitions.rotateTransition(page, settings)

// Combined fade + scale
PageTransitions.fadeAndScaleTransition(page, settings)
```

---

#### 5. **Navigation Methods**

From `navigation_coordinator.dart`:

```dart
// Navigate to a page
NavigationCoordinator.toHome();

// Go back
NavigationCoordinator.goBack();

// Push with result
NavigationCoordinator.push(Routes.productDetail, arguments: args);

// Replace current page
NavigationCoordinator.replace(Routes.home);

// Remove all and push
NavigationCoordinator.removeAllAndPush(Routes.splash);
```

---

### 🔧 Main App Setup

In your `main.dart`:

```dart
MaterialApp(
  // Use routes
  routes: AppRoutes.getRoutes(),
  onGenerateRoute: AppRoutes.onGenerateRoute,

  // Add route observer for tracking
  navigatorObservers: [AppRoutes.getRouteObserver()],

  // Set initial route
  initialRoute: Routes.splash,

  // Navigator key for navigation service
  navigatorKey: NavigationService.navigatorKey,
)
```

---

### ✅ Best Practices Applied

✓ **Single Responsibility**: Each file has one clear purpose
✓ **Type Safety**: Use strongly-typed arguments instead of Map
✓ **DRY (Don't Repeat Yourself)**: Reusable transitions and guards
✓ **Separation of Concerns**: UI doesn't know about route logic
✓ **Easy Maintenance**: Centralized route definitions
✓ **Scalable**: Easy to add new routes and features
✓ **Observable**: Built-in route tracking and logging

---

### 📝 Common Scenarios

**Scenario 1: Conditional Navigation Based on Auth**
```dart
if (isLoggedIn) {
  NavigationCoordinator.toHome();
} else {
  NavigationCoordinator.toLogin();
}
```

**Scenario 2: Pop with Result**
```dart
// Send result back
NavigationCoordinator.goBack(result: 'Some Data');

// Receive in previous page
final result = await Navigator.of(context).pushNamed(Routes.newPage);
```

**Scenario 3: Custom Page Transitions**
```dart
// Add custom transition in dynamic_routes.dart
return PageTransitions.fadeAndScaleTransition(
  ProductPage(arguments: args),
  settings,
);
```

---

### 🐛 Debugging

Navigation events are logged to console via `AppRouteObserver`:

```
🔵 [PUSHED] /home (from: /splash)
🟢 [REPLACED] /login with /home
🔴 [POPPED] /settings (back to: /home)
```

---

### 🔄 Future Enhancements

- [ ] DeepLink support
- [ ] Route persistence (save navigation stack)
- [ ] Nested navigation
- [ ] Conditional route visibility
- [ ] Route analytics integration
- [ ] Automatic argument serialization

---

**Created:** 2026-09-10
**Status:** Production Ready
**Version:** 1.0
