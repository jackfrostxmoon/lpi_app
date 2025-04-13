import 'package:flutter/material.dart';

class FixedImageBackground extends StatelessWidget {
  /// The widget to display on top of the background image.
  final Widget child;

  /// How the image should be inscribed into the space (defaults to BoxFit.cover).
  final BoxFit imageFit;

  static const String _backgroundImagePath = 'assets/images/Background.png';

  const FixedImageBackground({
    super.key,
    required this.child,
    this.imageFit = BoxFit.cover, // Default to cover
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Layer 1: Background Image (using the hardcoded path)
        Image.asset(
          _backgroundImagePath, // Use the hardcoded path
          fit: imageFit,
          errorBuilder: (context, error, stackTrace) {
            print(
              "Error loading fixed background image '$_backgroundImagePath': $error",
            );
            // Fallback widget (e.g., a solid color or gradient)
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  // Example fallback gradient
                  colors: [Colors.grey[300]!, Colors.grey[500]!],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: const Center(
                child: Text(
                  'BG Load Error',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            );
          },
        ),

        // Layer 2: Child Content
        child,
      ],
    );
  }
}
