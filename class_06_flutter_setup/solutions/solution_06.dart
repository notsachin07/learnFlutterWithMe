// Class 06 - Solutions
// Run this using: flutter run (in a Flutter project)
// This file contains reference implementations for Class 06 exercises

import 'package:flutter/material.dart';

// ============================================================
// EXERCISE 1: Customized Counter App
// ============================================================

class Exercise1App extends StatelessWidget {
  const Exercise1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Personal App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: true,
      ),
      home: const Exercise1HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Exercise1HomePage extends StatefulWidget {
  const Exercise1HomePage({super.key});

  @override
  State<Exercise1HomePage> createState() => _Exercise1HomePageState();
}

class _Exercise1HomePageState extends State<Exercise1HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Personal App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '🔢 Button Clicks Counter 🔢',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                color: Colors.purple[700],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'You have clicked $_counter times',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 48),
            Text(
              'Total clicks: $_counter',
              style: TextStyle(
                fontSize: 18,
                color: Colors.purple[400],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: Colors.purple,
        child: const Icon(Icons.favorite),
      ),
    );
  }
}

// ============================================================
// EXERCISE 2: To-Do List App
// ============================================================

class TodoItem {
  final String title;
  final bool isCompleted;

  TodoItem({
    required this.title,
    required this.isCompleted,
  });
}

class TodoItemWidget extends StatelessWidget {
  final TodoItem todo;
  final int index;

  const TodoItemWidget({
    super.key,
    required this.todo,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(
              todo.isCompleted
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              color: todo.isCompleted ? Colors.green : Colors.grey,
              size: 28,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                todo.title,
                style: TextStyle(
                  fontSize: 16,
                  decoration: todo.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color: todo.isCompleted ? Colors.grey : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Exercise2App extends StatelessWidget {
  const Exercise2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const Exercise2HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Exercise2HomePage extends StatefulWidget {
  const Exercise2HomePage({super.key});

  @override
  State<Exercise2HomePage> createState() => _Exercise2HomePageState();
}

class _Exercise2HomePageState extends State<Exercise2HomePage> {
  late List<TodoItem> todos;

  @override
  void initState() {
    super.initState();
    todos = [
      TodoItem(title: 'Buy groceries', isCompleted: true),
      TodoItem(title: 'Study Flutter', isCompleted: false),
      TodoItem(title: 'Call Mom', isCompleted: true),
      TodoItem(title: 'Exercise', isCompleted: false),
      TodoItem(title: 'Read a book', isCompleted: false),
    ];
  }

  int get completedCount => todos.where((t) => t.isCompleted).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My To-Do List'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.teal[50],
            width: double.infinity,
            child: Text(
              'Completed: $completedCount / ${todos.length}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal[700],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoItemWidget(
                  todo: todos[index],
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// EXERCISE 3: Advanced Counter with Operations
// ============================================================

class StatBox extends StatelessWidget {
  final String label;
  final String value;

  const StatBox({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Exercise3App extends StatelessWidget {
  const Exercise3App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Counter',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const Exercise3HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Exercise3HomePage extends StatefulWidget {
  const Exercise3HomePage({super.key});

  @override
  State<Exercise3HomePage> createState() => _Exercise3HomePageState();
}

class _Exercise3HomePageState extends State<Exercise3HomePage> {
  int counter = 0;
  List<String> history = [];

  void _addOperation(String op, int value) {
    setState(() {
      counter += value;
      history.add(op);
      if (history.length > 5) {
        history.removeAt(0);
      }
    });
  }

  void _reset() {
    setState(() {
      counter = 0;
      history.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final textColor = counter > 0
        ? Colors.green
        : counter < 0
            ? Colors.red
            : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Counter'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Counter display
            Text(
              '$counter',
              style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 24),

            // Recent operations
            if (history.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Recent Operations:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: history
                          .map(
                            (op) => Chip(
                              label: Text(op),
                              backgroundColor: Colors.indigo[100],
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 32),

            // Buttons
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: [
                // +1 button
                ElevatedButton(
                  onPressed: () => _addOperation('+1', 1),
                  child: const Text('+1'),
                ),
                // -1 button
                ElevatedButton(
                  onPressed: () => _addOperation('-1', -1),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text(
                    '-1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // +5 button
                ElevatedButton(
                  onPressed: () => _addOperation('+5', 5),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    '+5',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // -5 button
                ElevatedButton(
                  onPressed: () => _addOperation('-5', -5),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text(
                    '-5',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // Double button
                ElevatedButton(
                  onPressed: () => _addOperation('×2', counter),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  child: const Text(
                    'Double',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // Reset button
                ElevatedButton(
                  onPressed: _reset,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  child: const Text(
                    'Reset',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// EXERCISE 4: Personal Profile Screen
// ============================================================

class StatDisplay extends StatelessWidget {
  final String label;
  final String value;

  const StatDisplay({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Colors.grey[300]!,
              width: 1,
            ),
          ),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Exercise4App extends StatelessWidget {
  const Exercise4App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const Exercise4ProfileScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Exercise4ProfileScreen extends StatelessWidget {
  const Exercise4ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile header
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue[100],
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'iOS Developer',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.location_on, size: 16),
                      const SizedBox(width: 4),
                      const Text('San Francisco, CA'),
                    ],
                  ),
                ],
              ),
            ),

            // Statistics
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey[300]!),
                  bottom: BorderSide(color: Colors.grey[300]!),
                ),
              ),
              child: const Row(
                children: [
                  StatDisplay(label: 'Posts', value: '150'),
                  StatDisplay(label: 'Followers', value: '1.2K'),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        children: [
                          Text(
                            '500',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Following',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Action buttons
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        'Follow',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        side: const BorderSide(color: Colors.blue),
                      ),
                      child: const Text('Message'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      side: const BorderSide(color: Colors.grey),
                    ),
                    child: const Icon(Icons.more_horiz),
                  ),
                ],
              ),
            ),

            // About section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Passionate iOS developer, travel enthusiast, and coffee lover ☕. Always learning new technologies and sharing knowledge with the community.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Joined March 2020',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.link, size: 16, color: Colors.blue),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'github.com/johndoe',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.share, size: 16, color: Colors.blue),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'twitter.com/johndoe',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
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
// MAIN - Select which exercise to run
// ============================================================

void main() {
  // Change which app to run by uncommenting one of these:

  runApp(const Exercise1App());  // Exercise 1: Customized Counter
  // runApp(const Exercise2App());  // Exercise 2: To-Do List
  // runApp(const Exercise3App());  // Exercise 3: Advanced Counter
  // runApp(const Exercise4App());  // Exercise 4: Profile Screen
}

// ============================================================
// KEY PATTERNS DEMONSTRATED:
// ============================================================
// 1. StatelessWidget for static UI
// 2. StatefulWidget with setState() for interactive UI
// 3. Custom widgets for reusability
// 4. Lists and collections (ListView.builder, List<T>)
// 5. Styling and theming
// 6. Layouts (Column, Row, Container, Scaffold)
// 7. Icons and colors
// 8. Hot reload workflow
// 9. Common Material Design patterns
// 10. State management with setState()
// ============================================================
