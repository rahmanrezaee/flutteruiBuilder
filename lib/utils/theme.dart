import 'package:fluent_ui/fluent_ui.dart';

class ThemeUiSetup {
  static ThemeData getTheme() {
    return ThemeData(
        accentColor: Colors.warningSecondaryColor,
        focusTheme: FocusThemeData(
          glowFactor: 4.0,
        ),
        typography: const Typography(
          body: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ),
          bodyStrong: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: TextStyle(
            color: Color(0xff000000),
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
          title: TextStyle(
            color: Color(0xFF000000),
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          subtitle: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          caption: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black, size: 30));
  }
}
