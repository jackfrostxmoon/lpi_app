import 'package:flutter/material.dart';
import 'package:lpi_app/widgets/gradient_background.dart';
// Import the file where you defined GradientBackground

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          PopupMenuButton<AppLanguage>(
            icon: const Icon(Icons.language, color: Colors.white),
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
      body: GradientBackground(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // --- CHANGE HERE: Use Image.asset ---
                Image.asset(
                  // *** IMPORTANT: Replace with your actual image path ***
                  'assets/images/plant_logo.png',
                  height: 80.0, // Adjust height as needed
                  // You might need width as well depending on the image aspect ratio
                  // width: 80.0,
                  // Optional: Apply a color filter if your asset is like an icon
                  // color: Colors.white,
                  // colorBlendMode: BlendMode.srcIn, // Use if color is applied
                ),

                // --- END CHANGE ---
                const SizedBox(height: 30.0),

                const Text(
                  'Welcome Back',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 60.0),

                // Sign In Button
                SizedBox(
                  width: buttonWidth,
                  child: OutlinedButton(
                    onPressed: () {
                      print('Sign In Pressed');
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white, width: 1.5),
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
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF2A9D8F),
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
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Your main.dart remains the same
