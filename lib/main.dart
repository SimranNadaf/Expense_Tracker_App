import 'package:expense_app/expenses.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 12, 1, 52));

var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 95, 125));

void main() {
  // ** to lock screen in PortraitUP mode
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((value) =>
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        // useMaterial3: true,
        colorScheme: kDarkColorScheme,
        // appBarTheme: const AppBarTheme().copyWith(
        //   foregroundColor: kDarkColorScheme.primaryContainer,
        //   backgroundColor: kDarkColorScheme.onPrimaryContainer,
        // ),
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 5,
          ),
        ),
        // textTheme: ThemeData().textTheme.copyWith(
        //       titleLarge: TextStyle(
        //         fontWeight: FontWeight.bold,
        //         color: kDarkColorScheme.onSecondaryContainer,
        //         fontSize: 16,
        //       ),
        //     ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        // useMaterial3: true,
        // scaffoldBackgroundColor: Colors.redAccent,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            foregroundColor: kColorScheme.primaryContainer,
            backgroundColor: kColorScheme.onPrimaryContainer),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 5,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
      ),
      // themeMode: ThemeMode.system,  // defual
      home: const Expenses(),
    ),
  );
  // );
}
