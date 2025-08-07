import 'package:flutter/material.dart';

class MyRankingsPage extends StatelessWidget {
  const MyRankingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'My Rankings',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Tab heading
            const Text(
              "Overall",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E3A8A),
              ),
            ),
            const SizedBox(height: 12),

            // Rank box
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Top Rank', style: TextStyle(color: Colors.black54)),
                  SizedBox(height: 8),
                  Text('23',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E3A8A))),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Top Volunteers section
            const Text(
              'Top Volunteers',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildVolunteerRow(
              image: 'assets/images/marie.jpg',
              name: 'Marie Niyonsaba',
              hours: '100+ Hours Volunteered',
            ),
            const SizedBox(height: 12),
            _buildVolunteerRow(
              image: 'assets/images/samuel.jpg',
              name: 'Samuel Mutabazi',
              hours: '90+ Hours Volunteered',
            ),
            const SizedBox(height: 12),
            _buildVolunteerRow(
              image: 'assets/images/jacqueline.jpg',
              name: 'Jacqueline Musabeyezu',
              hours: '70+ Hours Volunteered',
            ),

            const SizedBox(height: 32),

            // Milestones section
            const Text(
              'Milestones',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildMilestoneTile('Joined RwandaCares'),
            _buildMilestoneTile('First Volunteering Activity'),
            _buildMilestoneTile('10 Hours Volunteers'),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Rankings tab
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) Navigator.pushNamed(context, '/home');
          if (index == 1) Navigator.pushNamed(context, '/rankings');
          if (index == 2) Navigator.pushNamed(context, '/events');
          if (index == 3) Navigator.pushNamed(context, '/profile');
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Rankings'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  // Volunteer List Item
  Widget _buildVolunteerRow({required String image, required String name, required String hours}) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage(image),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(hours, style: const TextStyle(color: Colors.blue)),
          ],
        ),
      ],
    );
  }

  // Milestone Item
  Widget _buildMilestoneTile(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("JUL", style: TextStyle(fontSize: 10, color: Colors.blue)),
                Text("17", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(title, style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
