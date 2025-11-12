import 'package:bike_shopping/core/routes/routes.dart';
import 'package:bike_shopping/features/home/view/cart.dart';
import 'package:bike_shopping/features/home/view/checkout.dart';
import 'package:bike_shopping/features/home/view/on_press.dart';
import 'package:bike_shopping/features/home/view/product_page.dart';
import 'package:flutter/material.dart';
import 'package:bike_shopping/features/home/view/home.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
  // Splash Screen
    case AppRoutes.homeScreen:
      return _buildAnimatedRoute(const HomeScreen());
      case AppRoutes.onPressScreen:
      return _buildAnimatedRoute(const OnPressScreen());
      case AppRoutes.productPage:
      return _buildAnimatedRoute(const ProductPage());
      case AppRoutes.cartScreen:
      return _buildAnimatedRoute(const CartScreen());
      case AppRoutes.checkout:
      return _buildAnimatedRoute(const Checkout());

    default:
      return _buildAnimatedRoute(
        const Scaffold(
          body: Center(child: Text("No route found")),
        ),
      );
  }
}

PageRouteBuilder _buildAnimatedRoute(Widget page) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 600),
    reverseTransitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, animation, secondaryAnimation) => page,
    transitionsBuilder: (_, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOutCubic;

      var slideTween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve),
      );

      var fadeTween = Tween<double>(begin: 0.0, end: 1.0);

      return SlideTransition(
        position: animation.drive(slideTween),
        child: FadeTransition(
          opacity: animation.drive(fadeTween),
          child: child,
        ),
      );
    },
  );
}