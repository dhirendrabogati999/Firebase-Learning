
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learning/screens/login_screen.dart';
import 'package:firebase_learning/services/auth_service.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<void> logout(BuildContext context) async {
  await AuthService().logout();

  if (!context.mounted) return;

  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => const SigninScreen(),
    ),
    (route) => false,
  );
}

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: const Color(0xFF071326),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF071326),
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            children: [
              const SizedBox(height: 30),

              // Profile photo placeholder
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF7C3AED),
                      Color(0xFF2563EB),
                    ],
                  ),
                  border: Border.all(
                    color: Colors.white24,
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.person,
                  size: 65,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                user?.displayName ?? 'Your Name',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                user?.email ?? 'your@email.com',
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 35),

              // Profile information
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF12213A),
                  borderRadius: BorderRadius.circular(16),
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Account Information',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      children: [
                        const Icon(
                          Icons.person_outline,
                          color: Colors.white60,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Username',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          user?.displayName ?? 'Your Name',
                          style:const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Row(
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          color: Colors.white60,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        const Spacer(),
                        Text(
                        user?.email ?? 'your@email.com',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Padding(
                    //   padding: const EdgeInsets.only(left: 36),
                    //   child: Text(
                    //     user?.email ?? 'your@email.com',
                    //     style: const TextStyle(
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),

              const Spacer(),

              // Logout button placeholder
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton.icon(
                  onPressed: () {
                    logout(context);
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Logout'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.redAccent,
                    side: const BorderSide(
                      color: Colors.redAccent,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}