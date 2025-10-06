import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionTitle("Today"),
          _buildNotificationItem(
            leadingIcon: Icons.favorite,
            title: "emma & 5 others appreciated your effort",
            image: "https://i.imgur.com/x1K3xqX.png",
          ),
          _buildNotificationItem(
            profileImage:
                "https://randomuser.me/api/portraits/women/65.jpg",
            title: "emma joined a new project",
            buttonText: "Join now",
          ),
          const SizedBox(height: 20),
          _buildSectionTitle("This week"),
          _buildNotificationItem(
            leadingIcon: Icons.comment,
            title: "sophie_1 commented on your initiative",
            image:
                "https://images.unsplash.com/photo-1599940824399-b87987ceb72a?auto=format&fit=crop&w=600&q=60",
          ),
          _buildNotificationItem(
            leadingIcon: Icons.share,
            title: "sophie_1 shared your project",
            image:
                "https://images.unsplash.com/photo-1601758125946-6ec2ef64b0ac?auto=format&fit=crop&w=600&q=60",
          ),
          const SizedBox(height: 20),
          _buildSectionTitle("Earlier"),
          _buildNotificationItem(
            leadingIcon: Icons.favorite,
            title: "john_d & 8 others supported your cause",
            image:
                "https://images.unsplash.com/photo-1503454537195-1dcabb73ffb9?auto=format&fit=crop&w=600&q=60",
          ),
          _buildNotificationItem(
            leadingIcon: Icons.comment,
            title: "linda_89 commented on your project",
            image:
                "https://images.unsplash.com/photo-1602526219047-3b0a3b49f34d?auto=format&fit=crop&w=600&q=60",
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(Icons.add, color: Colors.white),
            ),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }

  // --- Section Title Widget ---
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          fontSize: 16,
        ),
      ),
    );
  }

  // --- Notification Item Widget ---
  Widget _buildNotificationItem({
    IconData? leadingIcon,
    String? profileImage,
    required String title,
    String? image,
    String? buttonText,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          if (leadingIcon != null)
            Icon(leadingIcon, color: Colors.black, size: 26)
          else if (profileImage != null)
            CircleAvatar(backgroundImage: NetworkImage(profileImage)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          if (buttonText != null)
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            )
          else if (image != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                image,
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }
}
