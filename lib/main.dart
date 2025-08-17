import 'package:flutter/material.dart';

void main() => runApp(const InternshipApp());

class InternshipApp extends StatelessWidget {
  const InternshipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Internship Warmup',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
      ),
      home: const HomeScreen(),
      routes: {
        '/profile': (ctx) => const ProfileScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile photo (change path if needed)
            SizedBox(
              width: 140,
              height: 140,
              child: ClipOval(
                child: Image.asset(
                  'assets/profile.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return Container(
                      color: Colors.black12,
                      child: const Icon(Icons.person, size: 80),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Shankavi Selvam', // <-- change your name
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 1),
              ),
              child: const Text('Intern – Mobile Developer'), // <-- role
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/profile'),
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Go to Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Update with your details
    final education = [
      'HND in Information Technology ',
      'Diploma in English',
    ];

    final skills = [
      'Flutter',
      'Dart',
      'Java',
      'MySQL',
      'Git & GitHub',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Educational Background',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...education.map(
            (e) => ListTile(
              dense: true,
              leading: const Icon(Icons.school),
              title: Text(e),
            ),
          ),
          const SizedBox(height: 12),
          const Text('Skills',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills.map((s) => Chip(label: Text(s))).toList(),
          ),
          const Spacer(),
          Center(
            child: ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.home),
              label: const Text('Back to Home'),
            ),
          ),
        ]),
      ),
    );
  }
}
