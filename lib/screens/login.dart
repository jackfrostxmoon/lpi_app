import 'package:flutter/material.dart';
import 'package:lpi_app/services/appwrite_service.dart';
// Corrected import path based on your code
// Assuming FixedImageBackground is the correct class name
import 'package:lpi_app/widgets/image_background.dart';
// Assuming AuthService is in this path

/*
// Mock AuthService for demonstration if you don't have the actual service
class AuthService {
  Future<void> login(String email, String password) async {
    print('Attempting login with Email: $email, Password: $password');
    await Future.delayed(const Duration(seconds: 1));
    if (email == "test@example.com" && password == "password") {
      print('Login successful');
      return;
    } else {
      print('Login failed');
      throw Exception('Invalid email or password');
    }
  }
}
// End Mock AuthService
*/

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AppwriteService(); // Use your actual AuthService
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  Future<void> _login() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        await _authService.login(
          _emailController.text.trim(),
          _passwordController.text,
        );
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/dashboard');
        }
      } catch (e) {
        if (mounted) {
          String errorMessage = 'Login Failed';
          if (e.toString().contains('Invalid credentials')) {
            errorMessage = 'Invalid email or password';
          } else if (e.toString().contains('network')) {
            errorMessage = 'Network error. Please check your connection';
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: Colors.redAccent,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    const primaryGreen = Color(0xFF3AB54A);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // Use FixedImageBackground as the main body
      // NOTE: Using the import name you provided: ImageBackground
      body: FixedImageBackground(
        // Ensure this class name is correct
        // The previous body content now becomes the child
        child: Column(
          // Column now directly under FixedImageBackground
          children: <Widget>[
            // --- Top Section (Logo & Greeting) ---
            // This part remains outside the Expanded section
            SizedBox(height: screenHeight * 0.08), // Adjust spacing top
            Icon(
              Icons.eco, // Replace with your actual logo if needed
              color: Colors.white, // Keep white assuming dark background area
              size: screenHeight * 0.08,
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Hello,\nSign In!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white, // Keep white
                fontSize: screenHeight * 0.04,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            // Add space between text and the form container start point
            SizedBox(height: screenHeight * 0.05), // Adjust spacing
            // --- Expanded Section containing the Form Area ---
            // Use Expanded to make the following widget fill remaining space
            Expanded(
              child: Transform.translate(
                // The overlap offset remains the same relative to the start point
                offset: const Offset(0, 0), // Adjusted offset for overlap
                child: Container(
                  width: double.infinity,
                  // No fixed height, Expanded handles vertical filling
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.08,
                    right: screenWidth * 0.08,
                    top: screenHeight * 0.05, // Padding at the top of the form
                    // No bottom padding needed here, as it extends to edge
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white, // Use standard white
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                      // No bottom radius as it touches the edge
                    ),
                  ),
                  // Make the content inside the white container scrollable
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          // Email Field
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(color: primaryGreen),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryGreen),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: primaryGreen,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              }
                              if (!RegExp(
                                r'^[^@]+@[^@]+\.[^@]+',
                              ).hasMatch(value)) {
                                return 'Enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: screenHeight * 0.03),

                          // Password Field
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: const TextStyle(color: primaryGreen),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryGreen),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: primaryGreen,
                                  width: 2.0,
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: screenHeight * 0.01),

                          // Forgot Password Link
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                if (_emailController.text.isNotEmpty) {
                                  Navigator.pushNamed(
                                    context,
                                    '/forgot-password',
                                    arguments: _emailController.text,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Please enter your email first',
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                }
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.04),

                          // Sign In Button
                          ElevatedButton(
                            onPressed: _isLoading ? null : _login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryGreen,
                              padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.018,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              textStyle: TextStyle(
                                fontSize: screenHeight * 0.022,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child:
                                _isLoading
                                    ? const SizedBox(
                                      height: 24.0,
                                      width: 24.0,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 3.0,
                                      ),
                                    )
                                    : const Text(
                                      'SIGN IN',
                                      style: TextStyle(color: Colors.white),
                                    ),
                          ),
                          SizedBox(height: screenHeight * 0.05),

                          // Sign Up Link - MODIFIED HERE
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have account?",
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Navigate to the Registration Screen
                                  // Assumes you have a named route '/register' defined
                                  // in your MaterialApp routes.
                                  Navigator.pushNamed(context, '/register');

                                  // Alternatively, if not using named routes:
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => const RegistrationScreen(),
                                  //   ),
                                  // );
                                },
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(
                                    color: primaryGreen,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Add some padding at the very bottom inside the scroll view
                          // This ensures content doesn't stick right to the edge
                          // especially when keyboard is up.
                          SizedBox(height: screenHeight * 0.03),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
