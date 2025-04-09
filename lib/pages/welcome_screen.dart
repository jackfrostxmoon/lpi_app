import 'package:flutter/material.dart';
// Remove the import for GradientBackground if you are replacing it entirely
// import 'package:lpi_app/widgets/gradient_background.dart';

// Enum to represent the languages for type safety
enum AppLanguage { english, malay, chinese }

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  // Function to handle language selection
  void _onLanguageSelected(AppLanguage language, BuildContext context) {
    String languageName;
    switch (language) {
      case AppLanguage.english:
        languageName = "English";
        break;
      case AppLanguage.malay:
        languageName = "Malay";
        break;
      case AppLanguage.chinese:
        languageName = "Chinese";
        break;
    }
    // Replace this with your actual language change logic
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Selected language: $languageName')));
    print("Selected language: $languageName");
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive button width
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.8; // Make buttons 80% of screen width

    return Scaffold(
      extendBodyBehindAppBar: true, // Keep body behind transparent AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make AppBar transparent
        elevation: 0, // Remove AppBar shadow
        actions: [
          PopupMenuButton<AppLanguage>(
            icon: const Icon(
              Icons.language,
              color: Colors.white,
            ), // Ensure icon is visible
            onSelected: (AppLanguage result) {
              _onLanguageSelected(result, context);
            },
            itemBuilder:
                (BuildContext context) => <PopupMenuEntry<AppLanguage>>[
                  const PopupMenuItem<AppLanguage>(
                    value: AppLanguage.english,
                    child: Text('English'),
                  ),
                  const PopupMenuItem<AppLanguage>(
                    value: AppLanguage.malay,
                    child: Text('Malay'),
                  ),
                  const PopupMenuItem<AppLanguage>(
                    value: AppLanguage.chinese,
                    child: Text('Chinese'),
                  ),
                ],
          ),
          const SizedBox(width: 10),
        ],
      ),
      // --- CHANGE HERE: Replace GradientBackground with Stack ---
      body: Stack(
        children: [
          // Layer 1: Background Image (like in CustomScaffold)
          Image.asset(
            // *** IMPORTANT: Use the correct path to YOUR background image ***
            'assets/images/Background.png',
            fit: BoxFit.cover, // Cover the entire screen
            width: double.infinity,
            height: double.infinity,
          ),

          // Layer 2: Your Content (wrapped in SafeArea)
          SafeArea(
            // Ensures content avoids notches, status bars, etc.
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // --- REPLACED Image.asset with Icon ---
                    const Icon(
                      Icons
                          .eco_outlined, // Choose an appropriate icon (e.g., Icons.local_florist, Icons.spa)
                      size: 80.0, // Set the desired size
                      color: Colors.white, // Set the color to be visible
                      // Optional: Add shadow for better visibility
                      // shadows: [
                      //   Shadow(blurRadius: 4.0, color: Colors.black.withOpacity(0.6))
                      // ],
                    ),
                    // --- END REPLACEMENT ---
                    const SizedBox(height: 30.0),

                    // Welcome Text
                    const Text(
                      'Welcome Back',
                      style: TextStyle(
                        color: Colors.white, // Ensure text is visible
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        // Optional: Add shadow for better readability on image
                        // shadows: [
                        //   Shadow(blurRadius: 4.0, color: Colors.black.withOpacity(0.5))
                        // ],
                      ),
                    ),
                    const SizedBox(height: 60.0),

                    // Sign In Button
                    SizedBox(
                      width: buttonWidth,
                      child: OutlinedButton(
                        onPressed: () {
                          print('Sign In Pressed');
                          // TODO: Implement Sign In Navigation/Logic
                          // Example: Navigator.pushNamed(context, '/login');
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(
                            color: Colors.white,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                        ),
                        child: const Text(
                          'SIGN IN',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),

                    // Sign Up Button
                    SizedBox(
                      width: buttonWidth,
                      child: ElevatedButton(
                        onPressed: () {
                          print('Sign Up Pressed');
                          // TODO: Implement Sign Up Navigation/Logic
                          // Example: Navigator.pushNamed(context, '/signup');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          // Use a color that contrasts well with white
                          foregroundColor: const Color(
                            0xFF2A9D8F,
                          ), // Example color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                        ),
                        child: const Text(
                          'SIGN UP',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50), // Adjust spacing if needed
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // --- END CHANGE ---
    );
  }
}
