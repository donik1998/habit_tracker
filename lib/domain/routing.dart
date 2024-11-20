import 'package:flutter/material.dart';
import 'package:habit_tracker/domain/ui_models/challenges.dart';
import 'package:habit_tracker/domain/ui_models/goals.dart';
import 'package:habit_tracker/presentation/authentication/auth_selection_page.dart';
import 'package:habit_tracker/presentation/authentication/forgot_password_page.dart';
import 'package:habit_tracker/presentation/authentication/providers/forgot_password_page_provider.dart';
import 'package:habit_tracker/presentation/authentication/providers/sign_in_page_provider.dart';
import 'package:habit_tracker/presentation/authentication/providers/sign_up_page_provider.dart';
import 'package:habit_tracker/presentation/authentication/sign_in.dart';
import 'package:habit_tracker/presentation/authentication/sign_up.dart';
import 'package:habit_tracker/presentation/challenge/challenge_details_page.dart';
import 'package:habit_tracker/presentation/challenge/challenge_info_page.dart';
import 'package:habit_tracker/presentation/challenge/create_challenge/create_challenge_provider.dart';
import 'package:habit_tracker/presentation/challenge/create_challenge/create_challenge_screen.dart';
import 'package:habit_tracker/presentation/challenge/edit_challenge/edit_challenge_page.dart';
import 'package:habit_tracker/presentation/challenge/edit_challenge/edit_challenge_provider.dart';
import 'package:habit_tracker/presentation/challenge/finished_challenge/finished_challenge_details_page.dart';
import 'package:habit_tracker/presentation/challenge/providers/challenge_details_provider.dart';
import 'package:habit_tracker/presentation/challenge/providers/challenge_info_provider.dart';
import 'package:habit_tracker/presentation/error/unknown_page.dart';
import 'package:habit_tracker/presentation/goal/create_goal_group_page.dart';
import 'package:habit_tracker/presentation/goal/goal_group_page.dart';
import 'package:habit_tracker/presentation/goal/providers/create_goal_group_provider.dart';
import 'package:habit_tracker/presentation/goal/providers/goals_group_page_provider.dart';
import 'package:habit_tracker/presentation/habit/create_habit_page.dart';
import 'package:habit_tracker/presentation/habit/habit_details_page.dart';
import 'package:habit_tracker/presentation/habit/provider/create_habit_provider.dart';
import 'package:habit_tracker/presentation/habit/provider/habit_details_provider.dart';
import 'package:habit_tracker/presentation/home/home_page.dart';
import 'package:habit_tracker/presentation/home/providers/home_page_provider.dart';
import 'package:habit_tracker/presentation/language_selection/language_selection_page.dart';
import 'package:habit_tracker/presentation/profile/edit_profile_page.dart';
import 'package:habit_tracker/presentation/profile/providers/edit_profile_provider.dart';
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
  static const String challengeInfo = '/challenge-info';
  static const String editChallenge = '/edit-challenge';
  static const String createHabit = '/create-habit';
  static const String createGoalGroup = '/create-goal';
  static const String goalPage = '/goal-page';
  static const String habitDetails = '/habit-details';
  static const String editProfile = '/edit-profile';
  static const String finishedChallengeDetails = '/finished-challenge-details';

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
            create: (_) => ChallengeDetailsProvider(settings.arguments as int),
            child: const ChallengeDetailsPage(),
          ),
          settings: settings,
        );
      case challengeInfo:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (_) => ChallengeInfoProvider(settings.arguments as ChallengeModel),
            child: const ChallengeInfoPage(),
          ),
          settings: settings,
        );
      case createHabit:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (_) => CreateHabitProvider(settings.arguments as int?),
            child: const CreateHabitPage(),
          ),
        );
      case editChallenge:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (_) => EditChallengeProvider(settings.arguments as ChallengeModel),
            child: const EditChallengePage(),
          ),
          settings: settings,
        );
      case createGoalGroup:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (_) => CreateGoalGroupProvider(),
            child: const CreateGoalGroupPage(),
          ),
          settings: settings,
        );
      case goalPage:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (_) => GoalsGroupPageProvider(groupModel: settings.arguments as GoalGroupModel),
            child: const GoalsGroupPage(),
          ),
          settings: settings,
        );
      case habitDetails:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (_) => HabitDetailsProvider(habit: settings.arguments as HabitModel),
            child: const HabitDetailsPage(),
          ),
          settings: settings,
        );
      case editProfile:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (_) => EditProfileProvider(),
            child: const EditProfilePage(),
          ),
          settings: settings,
        );
      case finishedChallengeDetails:
        return MaterialPageRoute(
          builder: (context) => FinishedChallengeDetailsPage(
            challenge: settings.arguments as ChallengeModel,
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
