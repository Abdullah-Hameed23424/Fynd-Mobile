/// Example Usage of the Navigation System
/// This file demonstrates how to use the navigation module effectively

import 'package:flutter/material.dart';
// import 'package:fynd/Core/navigation/navigation_coordinator.dart';
// import 'package:fynd/Core/navigation/route_arguments.dart';
// import 'package:fynd/lib/Core/navigation/routes_constants.dart';

// ============================================================================
// EXAMPLE 1: Simple Navigation (No Arguments)
// ============================================================================

void example1_SimpleNavigation() {
  // Navigate to home
  // NavigationCoordinator.toHome();

  // Navigate to profile
  // NavigationCoordinator.toProfile();

  // Navigate with animation
  // NavigationCoordinator.toSettings();
}

// ============================================================================
// EXAMPLE 2: Navigation with Arguments (Type-Safe)
// ============================================================================

void example2_NavigationWithArguments() {
  // Pass structured arguments
  // NavigationCoordinator.toProductDetail(
  //   arguments: ProductDetailArguments(
  //     productId: '123',
  //     productName: 'Flutter Course',
  //   ),
  // );

  // Or with user details
  // NavigationCoordinator.toUserDetail(
  //   arguments: UserDetailArguments(
  //     userId: 'user_456',
  //     userName: 'Ahmed Ali',
  //   ),
  // );
}

// ============================================================================
// EXAMPLE 3: Authentication Flow
// ============================================================================

void example3_AuthenticationFlow(bool isLoggedIn) {
  if (isLoggedIn) {
    // User is logged in, go to home
    // NavigationCoordinator.toHome();
  } else {
    // User not logged in, show login screen
    // Remove all previous routes
    // NavigationCoordinator.removeAllAndPush(Routes.login);
  }
}

// ============================================================================
// EXAMPLE 4: Splash Screen Flow
// ============================================================================

void example4_SplashFlow(bool isLoggedIn) {
  Future.delayed(const Duration(seconds: 3), () {
    if (isLoggedIn) {
      // Navigate to home and remove splash from stack
      // NavigationCoordinator.toHome();
    } else {
      // Navigate to onboarding
      // NavigationCoordinator.toOnboarding();
    }
  });
}

// ============================================================================
// EXAMPLE 5: Going Back with Results
// ============================================================================

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example Page')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Go back without result
              // NavigationCoordinator.goBack();
            },
            child: const Text('Back'),
          ),
          ElevatedButton(
            onPressed: () {
              // Go back with result
              // NavigationCoordinator.goBack(result: {'selected': 'item1'});
            },
            child: const Text('Back with Result'),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// EXAMPLE 6: Using Route Guards (Protected Routes)
// ============================================================================

void example6_ProtectedNavigation(bool isAdmin) {
  // import 'package:fynd/Core/navigation/route_guards.dart';

  // Navigate to admin page with guard
  // NavigationCoordinator.toProtectedRoute(
  //   Routes.adminPanel,
  //   guard: AdminGuard(isAdmin: isAdmin),
  // );
}

// ============================================================================
// EXAMPLE 7: Custom Navigation with Transitions
// ============================================================================

void example7_CustomTransitions() {
  // Use different transitions for different routes

  // Fade transition
  // NavigationCoordinator.push(Routes.profile); // Uses default

  // Slide from right transition
  // NavigationCoordinator.push(Routes.settings); // Set in dynamic_routes.dart

  // Slide from bottom transition (modal-like)
  // NavigationCoordinator.toSettings();
}

// ============================================================================
// EXAMPLE 8: In a Widget (Most Common Usage)
// ============================================================================

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Simple navigation
        ElevatedButton(
          onPressed: () {
            // NavigationCoordinator.toHome();
          },
          child: const Text('Go Home'),
        ),

        // Navigation with arguments
        ElevatedButton(
          onPressed: () {
            // NavigationCoordinator.toProductDetail(
            //   arguments: ProductDetailArguments(
            //     productId: 'prod_789',
            //     productName: 'Amazing Product',
            //   ),
            // );
          },
          child: const Text('View Product'),
        ),

        // Navigation with settings
        ElevatedButton(
          onPressed: () {
            // NavigationCoordinator.toSettings(
            //   arguments: SettingsArguments(
            //     initialTab: 'notifications',
            //     showNotifications: true,
            //   ),
            // );
          },
          child: const Text('Open Settings'),
        ),

        // Go back
        ElevatedButton(
          onPressed: () {
            // NavigationCoordinator.goBack();
          },
          child: const Text('Back'),
        ),
      ],
    );
  }
}

// ============================================================================
// EXAMPLE 9: Error Handling
// ============================================================================

void example9_ErrorHandling() {
  // When navigation fails
  try {
    // NavigationCoordinator.toHome();
  } catch (e) {
    print('Navigation error: $e');
  }
}

// ============================================================================
// EXAMPLE 10: Main App Setup
// ============================================================================

/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fynd App',
      theme: ThemeData(primarySwatch: Colors.blue),

      // Setup routes
      routes: AppRoutes.getRoutes(),
      onGenerateRoute: AppRoutes.onGenerateRoute,

      // Add route observer for logging
      navigatorObservers: [AppRoutes.getRouteObserver()],

      // Initial route
      initialRoute: Routes.splash,

      // Navigator key for navigation service
      navigatorKey: NavigationService.navigatorKey,

      home: const SplashPage(),
    );
  }
}
*/

// ============================================================================
// KEY POINTS
// ============================================================================

/*
1. ALWAYS use NavigationCoordinator for navigation, not Navigator directly
   ✓ NavigationCoordinator.toHome();
   ✗ Navigator.of(context).pushNamed(Routes.home);

2. Use strongly-typed arguments, never Map<String, dynamic>
   ✓ ProductDetailArguments(productId: '123', productName: 'Product')
   ✗ {'productId': '123', 'productName': 'Product'}

3. Define all route constants in routes_constants.dart
   ✓ Routes.home
   ✗ '/home'

4. Add route guards for protected routes
   ✓ NavigationCoordinator.toProtectedRoute(..., guard: AuthenticationGuard(...))
   ✗ if (isLoggedIn) navigate();

5. Use appropriate transitions from page_transitions.dart
   ✓ PageTransitions.slideFromRightTransition(...)
   ✗ MaterialPageRoute(...)

6. Keep navigation logic out of widgets
   ✓ Create navigation methods in NavigationCoordinator
   ✗ Implement navigation logic in every widget

7. Always check route observer logs for debugging
   🔵 [PUSHED], 🟢 [REPLACED], 🔴 [POPPED], 🟡 [REMOVED]
*/
