import 'package:flutter/material.dart';

void main() {
  runApp(const NgoSelectionApp());
}

// ✅ Make root widget const — it's stateless and unchanging
class NgoSelectionApp extends StatelessWidget {
  const NgoSelectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SelectionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: '',
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  Image.asset(
                    'lib/screens/assets/images/Frame.png', // Replace with your logo asset path
                    height: 30,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'RwandaCares',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SelectionCard(
                      title: 'Volunteer',
                      description:
                          'Join our community service opportunities to make a difference in Kigali.',
                      buttonText: 'Select Volunteer',
                      image: 'lib/screens/assets/images/Group.png', // Replace with your image
                      onTap: () {
                        Navigator.pushNamed(context, '/volunteer');
                      },
                    ),
                    const SizedBox(height: 20),
                    SelectionCard(
                      title: 'NGO',
                      description:
                          'Partner with us to create impactful projects and track your progress.',
                      buttonText: 'Select NGO',
                      image: 'lib/screens/assets/images/group1.png', // Replace with your image
                      onTap: () {
                        // TODO: Handle NGO selection
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectionCard extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final String image;
  final VoidCallback onTap;

  const SelectionCard({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: title == 'Volunteer' ? Colors.blue[100] : Colors.grey[200],
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              image,
              height: 150,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    title == 'Volunteer' ? Colors.blue : Colors.blue[300],
              ),
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
