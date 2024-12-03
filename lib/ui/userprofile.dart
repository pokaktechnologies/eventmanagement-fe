import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Curved container at the top
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.center, // Aligns items vertically center
  children: [
    IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    const SizedBox(width: 10),
    // Use Expanded to allow the Text widget to take up the remaining space
       const Text(
        'Profile',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    
    const SizedBox(width: 40), // To balance the back button
  ],
),

            ),
          ),

          // Profile section with circular image and name
          Positioned(
            top: 140, // Places avatar at the bottom of the container
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: screenWidth * 0.15,
                  backgroundImage: const AssetImage('assets/profile.jpeg'),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Tovi',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

           
          Padding(
            padding: const EdgeInsets.only(top: 400), // Adjusted to accommodate avatar
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              children: [
                ProfileOptionItem(
                  icon: Icons.person,
                  label: 'Personal Details',
                  onTap: () {
                    // Navigate to personal details screen
                  },
                ),
               SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                ProfileOptionItem(
                  icon: Icons.settings,
                  label: 'Settings',
                  onTap: () {
                    // Navigate to settings screen
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                ProfileOptionItem(
                  icon: Icons.logout,
                  label: 'Sign Out',
                  onTap: () {
                    // Sign out action
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileOptionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ProfileOptionItem({super.key, 
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.teal,
        ),
        title: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.chevron_right,size: 30,),
        onTap: onTap,
      ),
    );
  }
}