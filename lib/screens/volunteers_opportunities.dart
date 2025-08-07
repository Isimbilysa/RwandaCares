import 'package:flutter/material.dart';

class VolunteerOpportunitiesPage extends StatelessWidget {
  const VolunteerOpportunitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // AppBar with "Back"
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Volunteer Opportunities',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search by cause organisation',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Map Placeholder
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'lib/screens/assets/images/image (1).png',
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            // Section Title
            const Text(
              'Organizations Near You',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF1E3A8A),
              ),
            ),

            const SizedBox(height: 16),

            // Organization Card 1
            _buildOrganizationCard(
              image: 'lib/screens/assets/images/Rectangle 91.png',
              title: 'Hope Village For Youth',
              subtitle: 'Education & Mentorship',
            ),

            const SizedBox(height: 12),

            // Organization Card 2
            _buildOrganizationCard(
              image: 'lib/screens/assets/images/Rectangle 92.png',
              title: 'Rwanda Health Initiative',
              subtitle: 'Healthcare & Community Outreach',
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) Navigator.pushNamed(context, '/home');
          if (index == 1) Navigator.pushNamed(context, '/trainings');
          if (index == 2) Navigator.pushNamed(context, '/events');
          if (index == 3) Navigator.pushNamed(context, '/profile');
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Trainings'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  // Helper widget
  Widget _buildOrganizationCard({
    required String image,
    required String title,
    required String subtitle,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: Colors.grey[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image, height: 140, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(color: Colors.blue)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
