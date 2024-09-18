import 'package:flutter/material.dart';
import 'package:habit_tracker/presentation/authentication/auth_selection_page.dart';
import 'package:habit_tracker/presentation/authentication/forgot_password_page.dart';
import 'package:habit_tracker/presentation/authentication/providers/forgot_password_page_provider.dart';
import 'package:habit_tracker/presentation/authentication/providers/sign_in_page_provider.dart';
import 'package:habit_tracker/presentation/authentication/providers/sign_up_page_provider.dart';
import 'package:habit_tracker/presentation/authentication/sign_in.dart';
import 'package:habit_tracker/presentation/authentication/sign_up.dart';
import 'package:habit_tracker/presentation/challenge/challenge_details_page.dart';
import 'package:habit_tracker/presentation/challenge/providers/challenge_details_provider.dart';
import 'package:habit_tracker/presentation/create_challenge/create_challenge_provider.dart';
import 'package:habit_tracker/presentation/create_challenge/create_challenge_screen.dart';
import 'package:habit_tracker/presentation/error/unknown_page.dart';
import 'package:habit_tracker/presentation/home/home_page.dart';
import 'package:habit_tracker/presentation/home/providers/home_page_provider.dart';
import 'package:habit_tracker/presentation/language_selection/language_selection_page.dart';
import 'package:habit_tracker/presentation/start_screen/splash_page.dart';
import 'package:provider/provider.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String languageSelection = '/language-selection';
  static const String authTypeSelection = '/auth-type-selection';
  static const String home = '/home';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String forgotPassword = '/forgot-password';
  static const String createChallenge = '/create-challenge';
  static const String challengeDetails = '/challenge-details';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
          settings: settings,
        );
      case languageSelection:
        return MaterialPageRoute(
          builder: (context) => const LanguageSelectionPage(),
          settings: settings,
        );
      case authTypeSelection:
        return MaterialPageRoute(
          builder: (context) => const AuthSelectionPage(),
          settings: settings,
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (_) => HomePageProvider(),
            child: HomePage(),
          ),
          settings: settings,
        );
      case signIn:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (_) => SignInPageProvider(),
            child: const SignInPage(),
          ),
          settings: settings,
        );
      case signUp:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (_) => SignUpPageProvider(),
            child: const SignUpPage(),
          ),
          settings: settings,
        );
      case forgotPassword:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (ctx) => ForgotPasswordPageProvider(),
            child: const ForgotPasswordPage(),
          ),
          settings: settings,
        );
      case createChallenge:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (ctx) => CreateChallengePageProvider(),
            child: const CreateChallengePage(),
          ),
          settings: settings,
        );
      case challengeDetails:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (_) => ChallengeDetailsProvider(),
            child: const ChallengeDetailsPage(),
          ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const UnknownPage(),
          settings: settings,
        );
    }
  }
}
