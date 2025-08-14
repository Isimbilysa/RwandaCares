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
      home: VolunteerHomePage(),
    );
  }
}

class VolunteerHomePage extends StatelessWidget {
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
      'description':
          'Help teach children in Kigali. Requires 5 hours/week.',
    },
    {
      'title': 'Health Initiative',
      'description':
          'Assist in health camps. Requires 3 hours/week.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.volunteer_activism, color: Colors.blue),
                      const SizedBox(width: 6),
                      const Text(
                        "Volunteer Match",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Login"),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Feature Cards
              ...features.map((feature) => _buildFeatureCard(feature)),

              const SizedBox(height: 20),
              const Text(
                "Volunteer Matches",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),

              // Matches
              ...matches.map((match) => _buildMatchCard(match)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.lightbulb), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
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
              child: Icon(
                _getIcon(feature['icon']!),
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    feature['title']!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    feature['subtitle']!,
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
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
            Text(
              match['title']!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              match['description']!,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "More Info",
                style: TextStyle(fontSize: 12),
              ),
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
