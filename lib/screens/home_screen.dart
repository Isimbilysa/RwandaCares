import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.grey,
        onTap: (index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/findOpportunities');
        break;
      case 2:
        Navigator.pushNamed(context, '/events');
        break;
      case 3:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar
              const Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
                  ),
                  SizedBox(width: 10),
                  Text("Home", style: TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 24),

              // Greeting
              const Text(
                'Hi, Noah',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3A8A)),
              ),
              const SizedBox(height: 8),
              const Text(
                "2023 marks my 5th year serving the community, and it's truly been a privilege. I'm excited for the journey ahead, and I welcome anyone looking to join our vibrant community.",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              const SizedBox(height: 24),

              // Quick Actions Title
              const Text(
                "Quick Actions",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3A8A)),
              ),
              const SizedBox(height: 12),

              // Quick Action Cards
              _buildActionCard(
                imageUrl: 'lib/screens/assets/images/rectangle.png',
                title: 'Environmental Initiative',
                subtitle:
                    'Join our tree planting event, contributing to a greener future.',
              ),
              const SizedBox(height: 12),
              _buildActionCard(
                imageUrl: 'lib/screens/assets/images/rectangle2.png',
                title: 'Community Support Drive',
                subtitle:
                    'Assist us in our community support initiative, making a direct impact.',
              ),
              const SizedBox(height: 24),

              // Gamification Title
              const Text(
                "Gamification",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3A8A)),
              ),
              const SizedBox(height: 12),

              // Stats Row
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _StatBox(number: '5', label: 'Years of service'),
                  _StatBox(number: '12', label: 'Events participated'),
                  _StatBox(number: '75', label: 'Hours volunteered'),
                ],
              ),

              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Keep up the great work! Your dedication shines brightly',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Action Card Widget
Widget _buildActionCard({
  required String imageUrl,
  required String title,
  required String subtitle,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.grey[100],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius:
              const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          child: Image.asset(imageUrl,
              height: 150, width: double.infinity, fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        )
      ],
    ),
  );
}

// Stat Box Widget
class _StatBox extends StatelessWidget {
  final String number;
  final String label;

  const _StatBox({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue.shade100),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(number,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
