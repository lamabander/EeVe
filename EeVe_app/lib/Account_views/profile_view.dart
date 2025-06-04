import 'package:flutter/material.dart';
import 'package:sawwah_app/Account_views/about_app_view.dart';
import 'package:sawwah_app/Account_views/edit_profile_view.dart';
import 'package:sawwah_app/Account_views/my_cards_view.dart';



class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool isDarkMode = true;
  bool isNotificationsOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('My Account', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Info
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Aaron Ramsdale',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      'aaronramsdale@gmail.com',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 32),

            const Text('Personal Info', style: TextStyle(color: Colors.white54)),
            const SizedBox(height: 16),

            ListTile(
              leading: const Icon(Icons.person_outline, color: Colors.white),
              title: const Text('Edit Profile', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfileView()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.credit_card, color: Colors.white),
              title: const Text('My Cards', style: TextStyle(color: Colors.white)),
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyCardsView()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.confirmation_number, color: Colors.white),
              title: const Text('Tickets', style: TextStyle(color: Colors.white)),
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyCardsView()),
                );

              },
            ),

            const SizedBox(height: 24),
            const Text('Settings', style: TextStyle(color: Colors.white54)),
            const SizedBox(height: 16),

            // Dark Mode Switch
            SwitchListTile(
              value: isDarkMode,
              onChanged: (val) {
                setState(() {
                  isDarkMode = val;
                });
              },
              title: const Text('Dark mode', style: TextStyle(color: Colors.white)),
              secondary: const Icon(Icons.dark_mode_outlined, color: Colors.white),
              activeColor: Color(0xFF8B57E6),
            ),

            // Notification Switch
            SwitchListTile(
              value: isNotificationsOn,
              onChanged: (val) {
                setState(() {
                  isNotificationsOn = val;
                });
              },
              title: const Text('Notification', style: TextStyle(color: Colors.white)),
              secondary: const Icon(Icons.notifications_none, color: Colors.white),
              activeColor: Color(0xFF8B57E6),
            ),

            ListTile(
              leading: const Icon(Icons.info_outline, color: Colors.white),
              title: const Text(
                'About App',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutAppView()),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text('Log out', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
