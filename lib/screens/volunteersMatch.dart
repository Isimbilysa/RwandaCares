import 'package:flutter/material.dart';

void main() {
  runApp(const VolunteersMatch());
}

class VolunteersMatch extends StatelessWidget {
  const VolunteersMatch({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeContentPage(),
        '/findOpportunities': (context) => const FindOpportunitiesPage(),
        '/events': (context) => const EventsPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}

// ====================== Bottom Navigation Bar ======================
class BottomNavBar extends StatefulWidget {
  final int initialIndex;

  const BottomNavBar({super.key, required this.initialIndex});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    if (_currentIndex == index) return;
    setState(() => _currentIndex = index);

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/findOpportunities');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/events');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: Colors.blue[900],
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Opportunities'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Events'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}

// ====================== Home Page ======================
class HomeContentPage extends StatelessWidget {
  const HomeContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> features = [
      {
        'title': 'Smart Alerts',
        'subtitle': 'New projects matching your skills in Kigali',
        'icon': 'notifications'
      },
      {
        'title': 'NGO Recommendations',
        'subtitle': 'Recommended NGOs based on your interests',
        'icon': 'thumb_up'
      },
      {
        'title': 'AI Matching Insights',
        'subtitle': 'Our AI analyzes your profile to suggest the best matches',
        'icon': 'smart_toy'
      },
    ];

    final List<Map<String, String>> matches = [
      {
        'title': 'Education Project',
        'description': 'Help teach children in Kigali. Requires 5 hours/week.',
      },
      {
        'title': 'Health Initiative',
        'description': 'Assist in health camps. Requires 3 hours/week.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Volunteer Match'),
        backgroundColor: Colors.white,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade800,
            ),
            onPressed: () {},
            child: const Text("Login"),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...features.map((feature) => _buildFeatureCard(feature)),
              const SizedBox(height: 20),
              const Text(
                "Volunteer Matches",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              ...matches.map((match) => _buildMatchCard(match)),
            ],
          ),
        ),
      ),
      bottomNavigationBar:  BottomNavBar(initialIndex: 0),
    );
  }

  Widget _buildFeatureCard(Map<String, String> feature) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue.withOpacity(0.1),
              child: Icon(_getIcon(feature['icon']!), color: Colors.blue.shade800),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(feature['title']!,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(feature['subtitle']!,
                      style: const TextStyle(fontSize: 12, color: Colors.black54)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMatchCard(Map<String, String> match) {
    return Card(
      color: Colors.grey[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(match['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 4),
            Text(match['description']!, style: const TextStyle(fontSize: 12, color: Colors.black54)),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade800,
              ),
              onPressed: () {},
              child: const Text("More Info", style: TextStyle(fontSize: 12)),
            )
          ],
        ),
      ),
    );
  }

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'notifications':
        return Icons.notifications;
      case 'thumb_up':
        return Icons.thumb_up;
      case 'smart_toy':
        return Icons.smart_toy;
      default:
        return Icons.help_outline;
    }
  }
}

// ====================== Other Pages ======================
class FindOpportunitiesPage extends StatelessWidget {
  const FindOpportunitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Find Opportunities"),
          backgroundColor: Colors.blue.shade800),
      body: const Center(child: Text("Find Opportunities Page")),
      bottomNavigationBar: const BottomNavBar(initialIndex: 1),
    );
  }
}

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Events"), backgroundColor: Colors.blue.shade800),
      body: const Center(child: Text("Events Page")),
      bottomNavigationBar: const BottomNavBar(initialIndex: 2),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), backgroundColor: Colors.blue.shade800),
      body: const Center(child: Text("Profile Page")),
      bottomNavigationBar: const BottomNavBar(initialIndex: 3),
    );
  }
}
