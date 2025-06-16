import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'welcome_screen.dart'; // Adjusted import path for consistency

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyCOH3E3l-KOUHXzcqJyeVahsPqVtI-vONk",
      appId: "1:875124706390:android:331cdf97fe369068c47ff7",
      messagingSenderId: "875124706390",
      projectId: "blooddonorfinderapp-e4072",
    ),

  ); // Ensure Firebase is initialized
  runApp(const BloodDonorFinderApp()); // Use const if possible
}

class BloodDonorFinderApp extends StatelessWidget {
  const BloodDonorFinderApp({super.key}); // Constructor with key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Donor Finder',
      theme: ThemeData(
        useMaterial3: true, // Optional: to enable Material 3
        primaryColor: const Color(0xFFE53935),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE53935),
          secondary: const Color(0xFFFF8A80),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}
