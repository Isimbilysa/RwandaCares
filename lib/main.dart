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
import 'screens/ngo_selection_screen.dart';
import 'screens/volunteersMatch.dart';
import 'screens/sign_up_organiza.dart';
import 'screens/notifications_page.dart';
import 'screens/volunteerProfile.dart';
import 'screens/my_events.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rwanda Cares',
      debugShowCheckedModeBanner: false,
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
        '/dashboard': (context) => DashboardScreen(),
        '/profile': (context) => ProfileScreen(),
        '/settings': (context) => SettingsScreen(),
        '/home': (context) => HomeScreen(),
        '/findOpportunities': (context) => FindOpportunitiesScreen(),
        '/volunteer': (context) => VolunteerOpportunitiesPage(),
        '/selection': (context) => SelectionScreen(),
        '/aimatch': (context) => VolunteersMatch(), 
        '/signup_organiza': (context) => SignUpOrganizaScreen(),
        '/notifications': (context) => NotificationsPage(),
        '/volunteerProfile': (context) => VolunteerProfilePage(),
        '/events': (context) => const MyEventsPage(),
      },
    );
  }
}
