import 'package:auth_firebase/auth/auth_service.dart';
import 'package:auth_firebase/auth/login_screen.dart';
import 'package:auth_firebase/widgets/button.dart';
import 'package:flutter/material.dart';
import 'blood_request_form.dart'; // Import the new form screen

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blood Donor App"),
        backgroundColor: Colors.redAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              child: const Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.redAccent),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.redAccent),
              title: const Text("Profile"),
              onTap: () {
                // Navigate to profile screen
              },
            ),
            ListTile(
              leading: Icon(Icons.local_hospital, color: Colors.redAccent),
              title: const Text("Request Blood"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BloodRequestForm()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.history, color: Colors.redAccent),
              title: const Text("Donation History"),
              onTap: () {
                // Navigate to donation history screen
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.redAccent),
              title: const Text("Sign Out"),
              onTap: () async {
                await auth.signout();
                goToLogin(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.redAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome to the Blood Donor App",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/blood_donor_logo.png'), // Ensure you have this asset
                ),
                const SizedBox(height: 20),
                CustomButton(
                  label: "Sign Out",
                  onPressed: () async {
                    await auth.signout();
                    goToLogin(context);
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                  label: "View Donors",
                  onPressed: () {
                    // Navigate to the donors list screen
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                  label: "Request Blood",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BloodRequestForm()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  goToLogin(BuildContext context) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
}
