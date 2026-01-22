// Class 06 - Source Code
// Run this using: flutter run (in a Flutter project)
//
// Note: This class builds on Classes 01-05 (Dart fundamentals).
// Now we apply everything to build beautiful UIs with Flutter!
// Flutter is just Dart + Google's Material Design framework.

import 'package:flutter/material.dart';

// ============================================================
// SECTION 1: Basic StatelessWidget (UI that doesn't change)
// ============================================================
// StatelessWidget is like a photograph - it shows information
// but doesn't respond to interactions.

class GreetingCard extends StatelessWidget {
  final String name;
  final String message;

  const GreetingCard({
    Key? key,
    required this.name,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Column(
        children: [
          Text(
            'Hello, $name! 👋',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SECTION 2: Basic StatefulWidget (UI that can change)
// ============================================================
// StatefulWidget is like a video - it can respond to interactions
// and update its appearance.

class CounterButton extends StatefulWidget {
  final String label;

  const CounterButton({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int count = 0;

  void incrementCount() {
    // setState tells Flutter: "Update the state and rebuild the UI"
    // This is the key to interactivity in Flutter!
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[50],
        border: Border.all(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Count: $count',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.green[700],
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: incrementCount,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
            ),
            child: const Text(
              'Increment',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SECTION 3: Understanding Hot Reload with Theme Toggle
// ============================================================
// This demonstrates changing app state and seeing it instantly
// with hot reload!

class ThemeToggleWidget extends StatefulWidget {
  const ThemeToggleWidget({Key? key}) : super(key: key);

  @override
  State<ThemeToggleWidget> createState() => _ThemeToggleWidgetState();
}

class _ThemeToggleWidgetState extends State<ThemeToggleWidget> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[900] : Colors.orange[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDarkMode ? Colors.grey : Colors.orange,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Text(
            isDarkMode ? '🌙 Dark Mode' : '☀️ Light Mode',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: toggleTheme,
            style: ElevatedButton.styleFrom(
              backgroundColor: isDarkMode ? Colors.grey[700] : Colors.orange,
            ),
            child: Text(
              'Toggle Theme',
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SECTION 4: Card Widget Pattern (Common UI Pattern)
// ============================================================
// Cards are used everywhere in modern apps (Twitter, Instagram, etc.)
// This shows the pattern of creating reusable components

class StudentCard extends StatelessWidget {
  final String name;
  final String major;
  final double gpa;
  final IconData icon;

  const StudentCard({
    Key? key,
    required this.name,
    required this.major,
    required this.gpa,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    major,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'GPA: $gpa',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: gpa >= 3.5 ? Colors.green : Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// SECTION 5: List of Widgets with Scrolling
// ============================================================
// Building lists is one of the most common tasks in mobile apps

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final students = [
      {
        'name': 'Alice Johnson',
        'major': 'Computer Science',
        'gpa': 3.8,
        'icon': Icons.computer,
      },
      {
        'name': 'Bob Smith',
        'major': 'Business',
        'gpa': 3.5,
        'icon': Icons.business,
      },
      {
        'name': 'Carol White',
        'major': 'Engineering',
        'gpa': 3.9,
        'icon': Icons.construction,
      },
      {
        'name': 'David Lee',
        'major': 'Physics',
        'gpa': 3.2,
        'icon': Icons.science,
      },
      {
        'name': 'Eve Martinez',
        'major': 'Art & Design',
        'gpa': 3.6,
        'icon': Icons.palette,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];
        return StudentCard(
          name: student['name'] as String,
          major: student['major'] as String,
          gpa: student['gpa'] as double,
          icon: student['icon'] as IconData,
        );
      },
    );
  }
}

// ============================================================
// MAIN APP - Putting it all together
// ============================================================

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Class 06 Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Widgets Demo'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: _buildBody(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets),
            label: 'Widgets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
        ],
      ),
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome to Flutter! 🚀',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              const GreetingCard(
                name: 'Flutter Developer',
                message: 'Welcome to your first Flutter app!',
              ),
              const SizedBox(height: 24),
              const CounterButton(label: 'Interactive Button'),
              const SizedBox(height: 24),
              const ThemeToggleWidget(),
            ],
          ),
        );
      case 1:
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Widget Examples',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              GreetingCard(
                name: 'Widget Gallery',
                message: 'These are all reusable components!',
              ),
              const SizedBox(height: 16),
              const CounterButton(label: 'Practice Counter'),
              const SizedBox(height: 16),
              const ThemeToggleWidget(),
            ],
          ),
        );
      case 2:
        return const StudentListScreen();
      default:
        return const Center(child: Text('Unknown Page'));
    }
  }
}

// ============================================================
// KEY CONCEPTS DEMONSTRATED:
// ============================================================
// 1. StatelessWidget - UI that doesn't change
// 2. StatefulWidget - UI that can change
// 3. setState() - Rebuilds UI when state changes
// 4. Widgets - Building blocks (Container, Column, Row, etc.)
// 5. Hot reload - See changes instantly
// 6. Widget composition - Building UIs from smaller widgets
// 7. Lists - Using ListView.builder for dynamic lists
// 8. Navigation - BottomNavigationBar for multiple screens
// 9. Styling - Colors, fonts, spacing, shadows
// 10. Icons - Using material icons
// ============================================================
