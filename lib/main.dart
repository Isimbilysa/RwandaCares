import 'package:flutter/material.dart';
import 'package:rwanda_cares/screens/findOpportunities_screen.dart';
import 'package:rwanda_cares/screens/home_screen.dart';
import 'package:rwanda_cares/screens/volunteers_opportunities.dart';
import 'package:rwanda_cares/screens/welcome_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/sign_in_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/verification_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primaryColor: const Color(0xFF1E3A8A),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E3A8A)),
        useMaterial3: true,
      ),
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/intro': (context) => const WelcomeScreen(), 
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/verification': (context) => const VerificationScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/home': (context) => const HomeScreen(),
        '/findOpportunities': (context) => const  FindOpportunitiesScreen(),
        '/volunteer': (context) => const VolunteerOpportunitiesPage(),
      },
    );
  }
}
