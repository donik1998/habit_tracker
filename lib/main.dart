import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/data/local/preferences.dart';
import 'package:habit_tracker/domain/dependency_injection.dart';
import 'package:habit_tracker/domain/routing.dart';
import 'package:habit_tracker/firebase_options.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:habit_tracker/presentation/theme/text_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  await setupLocator();
  final savedLang = await locator<LocalPreferences>().appLanguage;
  runApp(
    EasyLocalization(
      startLocale: savedLang != null ? Locale(savedLang) : null,
      supportedLocales: const [
        Locale('ru'),
        Locale('en'),
        Locale('uz'),
      ],
      saveLocale: true,
      path: 'assets/translations',
      child: const Root(),
    ),
  );
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(color: AppColors.purple500),
          unselectedIconTheme: IconThemeData(color: AppColors.textFieldText),
          selectedItemColor: AppColors.purple500,
          unselectedItemColor: AppColors.textFieldText,
          selectedLabelStyle: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            color: AppColors.purple500,
            fontSize: 12,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            color: AppColors.textFieldText,
            fontSize: 12,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        useMaterial3: true,
        extensions: [
          CustomTextTheme(),
        ],
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
