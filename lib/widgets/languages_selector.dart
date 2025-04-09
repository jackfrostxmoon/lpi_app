// lib/widgets/language_selector.dart
import 'package:flutter/material.dart';

// Define or import your AppLanguage enum
enum AppLanguage { english, malay, chinese }

class LanguageSelectorWidget extends StatelessWidget {
  /// Callback function invoked when a language is selected.
  /// Passes the selected AppLanguage enum value.
  final Function(AppLanguage) onLanguageSelected;

  /// The color of the language icon. Defaults to Colors.white.
  final Color iconColor;

  /// Tooltip text for the icon button.
  final String tooltip;

  const LanguageSelectorWidget({
    super.key,
    required this.onLanguageSelected,
    this.iconColor = Colors.white, // Default suitable for dark backgrounds
    this.tooltip = "Select Language",
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<AppLanguage>(
      icon: Icon(Icons.language, color: iconColor),
      tooltip: tooltip,
      onSelected: onLanguageSelected, // Directly use the passed callback
      itemBuilder:
          (BuildContext context) => <PopupMenuEntry<AppLanguage>>[
            // --- Menu Items ---
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
            // Add more languages here if needed
          ],
      // Optional: Customize the appearance of the dropdown menu
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      // color: Colors.grey[100], // Example background color for the menu
    );
  }
}
