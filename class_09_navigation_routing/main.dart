// Class 09 - Source Code
// Run this using: flutter run (in a Flutter project)
//
// This class demonstrates navigation and routing patterns.
// Everything here builds on Classes 01-08.

import 'package:flutter/material.dart';

void main() {
  runApp(const NavigationApp());
}

class NavigationApp extends StatelessWidget {
  const NavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class 09: Navigation & Routing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // Start with the examples menu
      home: const ExamplesMenuScreen(),
      // Named routes for Section 2
      routes: {
        '/named-home': (context) => const NamedRoutesHome(),
        '/named-profile': (context) => const NamedProfileScreen(),
        '/named-settings': (context) => const NamedSettingsScreen(),
      },
      // Custom route generator for advanced routing
      onGenerateRoute: (settings) {
        if (settings.name == '/named-product') {
          final args = settings.arguments as Map<String, dynamic>?;
          return MaterialPageRoute(
            builder: (context) => NamedProductScreen(
              productName: args?['name'] ?? 'Unknown',
              price: args?['price'] ?? 0.0,
            ),
          );
        }
        return null;
      },
    );
  }
}

// ============================================================
// EXAMPLES MENU
// ============================================================

class ExamplesMenuScreen extends StatelessWidget {
  const ExamplesMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class 09: Navigation Examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildExampleCard(
            context,
            '1. Basic Push/Pop',
            'Simple navigation between screens',
            Icons.arrow_forward,
            const Section1BasicNavigation(),
          ),
          _buildExampleCard(
            context,
            '2. Passing Data Forward',
            'Send data to new screens',
            Icons.send,
            const Section2PassingData(),
          ),
          _buildExampleCard(
            context,
            '3. Returning Data',
            'Get data back from screens',
            Icons.keyboard_return,
            const Section3ReturningData(),
          ),
          _buildExampleCard(
            context,
            '4. Named Routes',
            'Navigate using route names',
            Icons.route,
            const NamedRoutesHome(),
          ),
          _buildExampleCard(
            context,
            '5. Navigation Stack',
            'Understanding push/pop/replace',
            Icons.layers,
            const Section5NavigationStack(),
          ),
        ],
      ),
    );
  }

  Widget _buildExampleCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Widget destination,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, size: 32, color: Theme.of(context).primaryColor),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
      ),
    );
  }
}

// ============================================================
// SECTION 1: Basic Push/Pop Navigation
// ============================================================

class Section1BasicNavigation extends StatelessWidget {
  const Section1BasicNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Navigation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This is Screen A',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenB(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Go to Screen B'),
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen B'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This is Screen B',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text('Notice the automatic back button in the AppBar'),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Go Back Manually'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenC(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Go to Screen C'),
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenC extends StatelessWidget {
  const ScreenC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen C'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This is Screen C',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text('You can go back step by step'),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back to Screen B'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Pop until we reach the first route
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              icon: const Icon(Icons.home),
              label: const Text('Back to Examples Menu'),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// SECTION 2: Passing Data Forward
// ============================================================

class Section2PassingData extends StatelessWidget {
  const Section2PassingData({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {'name': 'Laptop', 'price': 999.99, 'emoji': '💻'},
      {'name': 'Headphones', 'price': 149.99, 'emoji': '🎧'},
      {'name': 'Mouse', 'price': 49.99, 'emoji': '🖱️'},
      {'name': 'Keyboard', 'price': 79.99, 'emoji': '⌨️'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Text(
                product['emoji'] as String,
                style: const TextStyle(fontSize: 32),
              ),
              title: Text(product['name'] as String),
              subtitle: Text('\$${(product['price'] as double).toStringAsFixed(2)}'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Pass data to detail screen via constructor
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(
                      name: product['name'] as String,
                      price: product['price'] as double,
                      emoji: product['emoji'] as String,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final String name;
  final double price;
  final String emoji;

  const ProductDetailScreen({
    super.key,
    required this.name,
    required this.price,
    required this.emoji,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 80),
            ),
            const SizedBox(height: 24),
            Text(
              name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 24,
                color: Colors.green[700],
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 48),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$name added to cart!')),
                );
              },
              icon: const Icon(Icons.shopping_cart),
              label: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// SECTION 3: Returning Data
// ============================================================

class Section3ReturningData extends StatefulWidget {
  const Section3ReturningData({super.key});

  @override
  State<Section3ReturningData> createState() => _Section3ReturningDataState();
}

class _Section3ReturningDataState extends State<Section3ReturningData> {
  Color selectedColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Returning Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Current Color:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: selectedColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: selectedColor.withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () async {
                // Navigate and wait for result
                final Color? newColor = await Navigator.push<Color>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ColorPickerScreen(),
                  ),
                );

                // Update color if user selected one
                if (newColor != null) {
                  setState(() {
                    selectedColor = newColor;
                  });
                }
              },
              icon: const Icon(Icons.palette),
              label: const Text('Pick a Color'),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorPickerScreen extends StatelessWidget {
  const ColorPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      {'color': Colors.red, 'name': 'Red'},
      {'color': Colors.orange, 'name': 'Orange'},
      {'color': Colors.amber, 'name': 'Amber'},
      {'color': Colors.green, 'name': 'Green'},
      {'color': Colors.teal, 'name': 'Teal'},
      {'color': Colors.blue, 'name': 'Blue'},
      {'color': Colors.indigo, 'name': 'Indigo'},
      {'color': Colors.purple, 'name': 'Purple'},
      {'color': Colors.pink, 'name': 'Pink'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick a Color'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final item = colors[index];
          final color = item['color'] as Color;
          final name = item['name'] as String;

          return InkWell(
            onTap: () {
              // Return the selected color
              Navigator.pop(context, color);
            },
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ============================================================
// SECTION 4: Named Routes
// ============================================================

class NamedRoutesHome extends StatelessWidget {
  const NamedRoutesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Named Routes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Navigate using route names',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/named-profile');
              },
              child: const Text('Go to Profile'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/named-settings');
              },
              child: const Text('Go to Settings'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/named-product',
                  arguments: {
                    'name': 'Gaming PC',
                    'price': 1499.99,
                  },
                );
              },
              child: const Text('Go to Product (with args)'),
            ),
          ],
        ),
      ),
    );
  }
}

class NamedProfileScreen extends StatelessWidget {
  const NamedProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Text(
          'Profile Screen (via named route)',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class NamedSettingsScreen extends StatelessWidget {
  const NamedSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(
        child: Text(
          'Settings Screen (via named route)',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class NamedProductScreen extends StatelessWidget {
  final String productName;
  final double price;

  const NamedProductScreen({
    super.key,
    required this.productName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              productName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 16),
            const Text(
              '(Passed via onGenerateRoute)',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// SECTION 5: Navigation Stack Operations
// ============================================================

class Section5NavigationStack extends StatelessWidget {
  const Section5NavigationStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Stack'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Understanding the Navigation Stack',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'The navigation stack is like a deck of cards. Each screen is a card. '
            'You can add cards (push), remove the top card (pop), or replace cards.',
          ),
          const SizedBox(height: 24),

          _buildStackCard(
            context,
            'push()',
            'Add a new screen on top',
            Colors.blue,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StackDemoScreen(
                    operation: 'Pushed',
                    level: 1,
                  ),
                ),
              );
            },
          ),

          _buildStackCard(
            context,
            'pushReplacement()',
            'Replace current screen with new one',
            Colors.orange,
            () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const StackDemoScreen(
                    operation: 'Replaced',
                    level: 1,
                  ),
                ),
              );
            },
          ),

          _buildStackCard(
            context,
            'pushAndRemoveUntil()',
            'Push new screen and clear the stack',
            Colors.red,
            () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const StackDemoScreen(
                    operation: 'Cleared & Pushed',
                    level: 1,
                  ),
                ),
                (route) => false, // Remove all routes
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStackCard(
    BuildContext context,
    String title,
    String description,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: const Icon(Icons.layers, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}

class StackDemoScreen extends StatelessWidget {
  final String operation;
  final int level;

  const StackDemoScreen({
    super.key,
    required this.operation,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level $level'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              operation,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Stack Level: $level',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 32),
            if (level < 3)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StackDemoScreen(
                        operation: 'Pushed',
                        level: level + 1,
                      ),
                    ),
                  );
                },
                child: const Text('Push Another Level'),
              ),
            const SizedBox(height: 16),
            if (Navigator.canPop(context))
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Pop (Go Back)'),
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('Pop to First Route'),
            ),
          ],
        ),
      ),
    );
  }
}
