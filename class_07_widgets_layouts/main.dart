// Class 07 - Source Code
// Run this using: flutter run (in a Flutter project)
//
// This class demonstrates layout widgets and UI composition.
// Everything here builds on Classes 01-06.

import 'package:flutter/material.dart';

// ============================================================
// SECTION 1: Container & Decoration Examples
// ============================================================

class ContainerExamples extends StatelessWidget {
  const ContainerExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Container Examples',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Basic styled container
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue, width: 2),
            ),
            child: const Text('Basic Styled Container'),
          ),

          // Container with shadow
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Text('Container with Shadow'),
          ),

          // Container with gradient
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Gradient Container',
              style: TextStyle(color: Colors.white),
            ),
          ),

          // Nested containers showing padding vs margin
          const Text(
            'Padding vs Margin:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            color: Colors.grey[300],
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange[200],
                border: Border.all(color: Colors.orange, width: 2),
              ),
              child: const Text('Inner content'),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Grey = parent, Orange margin = space outside, Orange padding = space inside',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SECTION 2: Row & Column with Alignment
// ============================================================

class RowColumnExamples extends StatelessWidget {
  const RowColumnExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Row & Column Alignment',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Row with different alignments
          const Text('Row - MainAxisAlignment.spaceBetween:'),
          Container(
            height: 60,
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBox(Colors.red, 'A'),
                _buildBox(Colors.green, 'B'),
                _buildBox(Colors.blue, 'C'),
              ],
            ),
          ),
          const SizedBox(height: 16),

          const Text('Row - MainAxisAlignment.spaceEvenly:'),
          Container(
            height: 60,
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBox(Colors.red, 'A'),
                _buildBox(Colors.green, 'B'),
                _buildBox(Colors.blue, 'C'),
              ],
            ),
          ),
          const SizedBox(height: 16),

          const Text('Row - CrossAxisAlignment (different heights):'),
          Container(
            height: 100,
            color: Colors.grey[200],
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(width: 50, height: 30, color: Colors.red),
                const SizedBox(width: 8),
                Container(width: 50, height: 60, color: Colors.green),
                const SizedBox(width: 8),
                Container(width: 50, height: 45, color: Colors.blue),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Column example
          const Text('Column - CrossAxisAlignment.stretch:'),
          Container(
            height: 150,
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(height: 30, color: Colors.red),
                Container(height: 30, color: Colors.green),
                Container(height: 30, color: Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBox(Color color, String label) {
    return Container(
      width: 50,
      height: 50,
      color: color,
      child: Center(
        child: Text(label, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}

// ============================================================
// SECTION 3: Expanded & Flexible
// ============================================================

class ExpandedFlexibleExamples extends StatelessWidget {
  const ExpandedFlexibleExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Expanded & Flexible',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Expanded fills remaining space
          const Text('Expanded - fills remaining space:'),
          Container(
            height: 60,
            color: Colors.grey[200],
            child: Row(
              children: [
                Container(width: 60, color: Colors.red),
                Expanded(child: Container(color: Colors.green)),
                Container(width: 60, color: Colors.blue),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Multiple Expanded with flex
          const Text('Multiple Expanded with flex (2:1:1):'),
          Container(
            height: 60,
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(flex: 2, child: Container(color: Colors.red)),
                Expanded(flex: 1, child: Container(color: Colors.green)),
                Expanded(flex: 1, child: Container(color: Colors.blue)),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Spacer example
          const Text('Spacer - pushes widgets apart:'),
          Container(
            height: 60,
            padding: const EdgeInsets.all(8),
            color: Colors.grey[200],
            child: Row(
              children: [
                const Icon(Icons.menu),
                const Spacer(),
                const Text('Title'),
                const Spacer(),
                const Icon(Icons.search),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Real-world example: Search bar
          const Text('Real Example - Search Bar:'),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.grey),
                const SizedBox(width: 8),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const Icon(Icons.mic, color: Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SECTION 4: Stack & Positioned
// ============================================================

class StackExamples extends StatelessWidget {
  const StackExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Stack & Positioned',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Basic Stack
          const Text('Basic Stack (layers):'),
          SizedBox(
            height: 150,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(width: 150, height: 150, color: Colors.red),
                Container(width: 100, height: 100, color: Colors.green),
                Container(width: 50, height: 50, color: Colors.blue),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Stack with Positioned
          const Text('Stack with Positioned:'),
          SizedBox(
            height: 150,
            child: Stack(
              children: [
                Container(color: Colors.grey[300]),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    color: Colors.red,
                    child: const Text(
                      'TOP LEFT',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    color: Colors.blue,
                    child: const Text(
                      'BOTTOM RIGHT',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
                const Center(child: Text('CENTER')),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Real-world example: Profile with badge
          const Text('Real Example - Profile with Badge:'),
          const SizedBox(height: 8),
          Row(
            children: [
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John Doe',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Online', style: TextStyle(color: Colors.green)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Notification badge example
          const Text('Notification Badge:'),
          const SizedBox(height: 8),
          Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const Icon(Icons.notifications, size: 40),
                  Positioned(
                    top: -5,
                    right: -5,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        '5',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 32),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const Icon(Icons.shopping_cart, size: 40),
                  Positioned(
                    top: -5,
                    right: -5,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SECTION 5: ListView & GridView
// ============================================================

class ListGridExamples extends StatelessWidget {
  const ListGridExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            labelColor: Colors.blue,
            tabs: [Tab(text: 'ListView'), Tab(text: 'GridView')],
          ),
          Expanded(
            child: TabBarView(
              children: [
                // ListView Tab
                ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              Colors.primaries[index % Colors.primaries.length],
                          child: Text('${index + 1}'),
                        ),
                        title: Text('Item ${index + 1}'),
                        subtitle: Text('Description for item ${index + 1}'),
                        trailing: const Icon(Icons.chevron_right),
                      ),
                    );
                  },
                ),

                // GridView Tab
                GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1,
                  ),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color:
                            Colors.primaries[index % Colors.primaries.length],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
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

// ============================================================
// SECTION 6: Complete UI Examples
// ============================================================

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Profile header
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, size: 40, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Software Developer',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 16,
                            color: Colors.grey[500],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'San Francisco, CA',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 12),

            // Stats row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStat('Posts', '142'),
                _buildStat('Followers', '10.5K'),
                _buildStat('Following', '524'),
              ],
            ),

            const SizedBox(height: 20),

            // Action buttons
            Row(
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
                    ),
                    child: const Text('Message'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
      ],
    );
  }
}

class SettingsListItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;

  const SettingsListItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProfileCard(),
          const Divider(height: 1),
          SettingsListItem(
            icon: Icons.person,
            iconColor: Colors.blue,
            title: 'Account',
            subtitle: 'Privacy, security, change number',
            onTap: () {},
          ),
          SettingsListItem(
            icon: Icons.chat,
            iconColor: Colors.green,
            title: 'Chats',
            subtitle: 'Theme, wallpapers, chat history',
            onTap: () {},
          ),
          SettingsListItem(
            icon: Icons.notifications,
            iconColor: Colors.red,
            title: 'Notifications',
            subtitle: 'Message, group & call tones',
            onTap: () {},
          ),
          SettingsListItem(
            icon: Icons.data_usage,
            iconColor: Colors.purple,
            title: 'Storage and Data',
            subtitle: 'Network usage, auto-download',
            onTap: () {},
          ),
          SettingsListItem(
            icon: Icons.help,
            iconColor: Colors.teal,
            title: 'Help',
            subtitle: 'Help center, contact us, privacy policy',
            onTap: () {},
          ),
          SettingsListItem(
            icon: Icons.group,
            iconColor: Colors.blue,
            title: 'Invite a Friend',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// ============================================================
// MAIN APP
// ============================================================

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class 07 - Widgets & Layouts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const ContainerExamples(),
    const RowColumnExamples(),
    const ExpandedFlexibleExamples(),
    const StackExamples(),
    const ListGridExamples(),
    const SettingsScreen(),
  ];

  final List<String> _titles = [
    'Container',
    'Row & Column',
    'Expanded',
    'Stack',
    'List & Grid',
    'Full Example',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        elevation: 0,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.crop_square), label: 'Container'),
          BottomNavigationBarItem(icon: Icon(Icons.view_column), label: 'Row/Col'),
          BottomNavigationBarItem(icon: Icon(Icons.expand), label: 'Expand'),
          BottomNavigationBarItem(icon: Icon(Icons.layers), label: 'Stack'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Example'),
        ],
      ),
    );
  }
}

// ============================================================
// KEY CONCEPTS DEMONSTRATED:
// ============================================================
// 1. Container with decoration, padding, margin
// 2. Row and Column with MainAxisAlignment & CrossAxisAlignment
// 3. Expanded and Flexible for proportional sizing
// 4. Spacer for flexible spacing
// 5. Stack and Positioned for layered layouts
// 6. ListView.builder for efficient lists
// 7. GridView.builder for grids
// 8. Real-world UI patterns (Profile Card, Settings List)
// 9. Composition - building complex UIs from simple widgets
// 10. Navigation with BottomNavigationBar
// ============================================================
