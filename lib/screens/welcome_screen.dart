import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset(
                'lib/screens/assets/images/Depth 1, Frame 0.png',
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 30),

            // Text Message
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Join our movement for positive change and build a brighter future for Rwanda, together.",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 40),

            // Create Account Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () {
                 Navigator.pushNamed(context, '/signup');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue.shade800,
                  side: BorderSide(color: Colors.blue.shade800),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  elevation: 0,
                ),
                child: Center(
                  child: Text(
                    "CREATE ACCOUNT",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Login Text
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/signin');
              },
              child: Text.rich(
                TextSpan(
                  text: 'Already have an account ? ',
                  style: GoogleFonts.poppins(color: Colors.black87),
                  children: [
                    TextSpan(
                      text: 'login',
                      style: GoogleFonts.poppins(
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
