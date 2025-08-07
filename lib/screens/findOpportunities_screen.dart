import 'package:flutter/material.dart';

class FindOpportunitiesScreen extends StatefulWidget {
  const FindOpportunitiesScreen({super.key});

  @override
  FindOpportunitiesScreenState createState() => FindOpportunitiesScreenState();
}

class FindOpportunitiesScreenState extends State<FindOpportunitiesScreen> {
  bool isListView = true;
  String selectedLocation = 'Location';
  String selectedVolunteer = 'Volunteer';
  String selectedSkills = 'Skills';

  final List<Opportunity> opportunities = [
    Opportunity(
      title: 'Community Development Volunteer',
      description: 'Assist in agricultural projects, provide educational workshops, support local health initiatives',
      imageUrl: 'lib/screens/assets/images/Rectangle 101.png',
      category: 'Community',
    ),
    Opportunity(
      title: 'Environmental Conservation',
      description: 'Support conservation efforts for endangered species, conduct eco-tourism tours, and educate communities on environmental sustainability',
      imageUrl: 'lib/screens/assets/images/Rectangle 104.png',
      category: 'Environment',
    ),
    Opportunity(
      title: 'Youth Education Mentor',
      description: 'Tutor students, offer career mentorship, organize educational events',
      imageUrl: 'lib/screens/assets/images/Rectangle 107.png',
      category: 'Education',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Find opportunities',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search and Filter Section
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search opportunities',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                
                // Filter Buttons
                Row(
                  children: [
                    Expanded(
                      child: _buildFilterButton(selectedLocation, 'Location', () {
                        Navigator.pushNamed(context, '/locationOpportunities');
                      }),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildFilterButton(selectedVolunteer, 'Volunteer', () {
                        Navigator.pushNamed(context, '/volunteer');
                      }),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildFilterButton(selectedSkills, 'Skills', () {
                        Navigator.pushNamed(context, '/skillsOpportunities');
                      }),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // List/Grid Toggle
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => isListView = true),
                          child: Container(
                            decoration: BoxDecoration(
                              color: isListView ? const Color(0xFF2E4B9B) : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'List',
                                style: TextStyle(
                                  color: isListView ? Colors.white : Colors.grey[600],
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => isListView = false),
                          child: Container(
                            decoration: BoxDecoration(
                              color: !isListView ? const Color(0xFF2E4B9B) : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'Grid',
                                style: TextStyle(
                                  color: !isListView ? Colors.white : Colors.grey[600],
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Opportunities List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: opportunities.length,
              itemBuilder: (context, index) {
                return _buildOpportunityCard(opportunities[index]);
              },
            ),
          ),
        ],
      ),
      
      // Bottom Navigation
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF2E4B9B),
          unselectedItemColor: Colors.grey[400],
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event_note_outlined),
              label: 'Events',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
      
      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF2E4B9B),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

Widget _buildFilterButton(String value, String label, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 4),
          Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.grey[600]),
        ],
      ),
    ),
  );
}


  Widget _buildOpportunityCard(Opportunity opportunity) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset:const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[200],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                opportunity.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: Icon(
                      Icons.image,
                      color: Colors.grey[400],
                      size: 30,
                    ),
                  );
                },
              ),
            ),
          ),
          
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    opportunity.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2E4B9B),
                    ),
                  ),
                 const SizedBox(height: 8),
                  Text(
                    opportunity.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.4,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Opportunity {
  final String title;
  final String description;
  final String imageUrl;
  final String category;

  Opportunity({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
  });
}