import 'package:flutter/material.dart';

/// A reusable widget that displays a vertical linear gradient background.
///
/// The gradient goes from a lighter green/teal at the top to a darker
/// teal/blue at the bottom. It takes a [child] widget to display on top
/// of the gradient background.
class GradientBackground extends StatelessWidget {
  /// The widget to display on top of the gradient background.
  final Widget child;
  // the code will be added here later
  /// Creates a GradientBackground widget.
  ///
  /// The [child] parameter is required and specifies the widget to be
  /// displayed over the gradient.
  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Ensure the container fills the available space where it's used.
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        // Define the linear gradient.
        gradient: LinearGradient(
          // Define the colors for the gradient stops.
          colors: [
            Color.fromARGB(
              255,
              42,
              139,
              84,
            ), // Lighter green/teal color at the top
            Color(0xFF2A9D8F), // Darker teal/blue color at the bottom
          ],
          // Define the direction of the gradient (top to bottom).
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      // Display the child widget passed to this background widget.
      child: child,
    );
  }
}
