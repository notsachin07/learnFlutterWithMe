// Class 09 - Solutions
// Run this using: flutter run (in a Flutter project)
//
// These are the reference solutions for exercises.md
// Compare your solutions after attempting the exercises yourself!

import 'package:flutter/material.dart';

void main() {
  runApp(const ExerciseSolutionsApp());
}

class ExerciseSolutionsApp extends StatelessWidget {
  const ExerciseSolutionsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class 09 Exercise Solutions',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SolutionsHome(),
    );
  }
}

class SolutionsHome extends StatelessWidget {
  const SolutionsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class 09 Solutions'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSolutionCard(
            context,
            'Exercise 1',
            'User Profile Flow',
            'View, edit, and return data',
            const Exercise1Solution(),
          ),
          _buildSolutionCard(
            context,
            'Exercise 2',
            'Onboarding Flow',
            'Multi-step wizard with pushReplacement',
            const Exercise2Solution(),
          ),
          _buildSolutionCard(
            context,
            'Exercise 3',
            'Shopping App',
            'Named routes with onGenerateRoute',
            const Exercise3Solution(),
          ),
          _buildSolutionCard(
            context,
            'Exercise 4',
            'Tab Navigation',
            'Nested navigation in tabs',
            const Exercise4Solution(),
          ),
        ],
      ),
    );
  }

  Widget _buildSolutionCard(
    BuildContext context,
    String number,
    String title,
    String description,
    Widget destination,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Text(
            number.split(' ')[1],
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(title),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => destination),
          );
        },
      ),
    );
  }
}

// ============================================================
// EXERCISE 1 SOLUTION: User Profile Flow
// ============================================================

class User {
  final int id;
  String name;
  String email;

  User({required this.id, required this.name, required this.email});

  User copyWith({String? name, String? email}) {
    return User(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}

class Exercise1Solution extends StatefulWidget {
  const Exercise1Solution({super.key});

  @override
  State<Exercise1Solution> createState() => _Exercise1SolutionState();
}

class _Exercise1SolutionState extends State<Exercise1Solution> {
  final users = [
    User(id: 1, name: 'John Doe', email: 'john@email.com'),
    User(id: 2, name: 'Jane Smith', email: 'jane@email.com'),
    User(id: 3, name: 'Bob Johnson', email: 'bob@email.com'),
  ];

  void _updateUser(User updatedUser) {
    setState(() {
      final index = users.indexWhere((u) => u.id == updatedUser.id);
      if (index != -1) {
        users[index] = updatedUser;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(user.name[0]),
              ),
              title: Text(user.name),
              subtitle: Text(user.email),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () async {
                final updatedUser = await Navigator.push<User>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetailScreen(user: user),
                  ),
                );

                if (updatedUser != null) {
                  _updateUser(updatedUser);
                }
              },
            ),
          );
        },
      ),
    );
  }
}

class UserDetailScreen extends StatefulWidget {
  final User user;

  const UserDetailScreen({super.key, required this.user});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  late User _currentUser;

  @override
  void initState() {
    super.initState();
    _currentUser = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentUser.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: Text(
                _currentUser.name[0],
                style: const TextStyle(fontSize: 40),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              _currentUser.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              _currentUser.email,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () async {
                final editedUser = await Navigator.push<User>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditUserScreen(user: _currentUser),
                  ),
                );

                if (editedUser != null) {
                  setState(() {
                    _currentUser = editedUser;
                  });
                }
              },
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Return the potentially updated user to the list
          Navigator.pop(context, _currentUser);
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}

class EditUserScreen extends StatefulWidget {
  final User user;

  const EditUserScreen({super.key, required this.user});

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _emailController = TextEditingController(text: widget.user.email);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _save() {
    final updatedUser = widget.user.copyWith(
      name: _nameController.text,
      email: _emailController.text,
    );
    Navigator.pop(context, updatedUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _save,
                child: const Text('Save Changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// EXERCISE 2 SOLUTION: Onboarding Flow
// ============================================================

class OnboardingData {
  String name = '';
  List<String> interests = [];
}

class Exercise2Solution extends StatelessWidget {
  const Exercise2Solution({super.key});

  @override
  Widget build(BuildContext context) {
    return const WelcomeScreen();
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '🚀',
                style: TextStyle(fontSize: 80),
              ),
              const SizedBox(height: 24),
              const Text(
                'Welcome to App!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Let's get you started",
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
              const SizedBox(height: 48),
              FilledButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Step1NameScreen(
                        data: OnboardingData(),
                      ),
                    ),
                  );
                },
                child: const Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Step1NameScreen extends StatefulWidget {
  final OnboardingData data;

  const Step1NameScreen({super.key, required this.data});

  @override
  State<Step1NameScreen> createState() => _Step1NameScreenState();
}

class _Step1NameScreenState extends State<Step1NameScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _next() {
    if (_controller.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your name')),
      );
      return;
    }

    widget.data.name = _controller.text.trim();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Step2InterestsScreen(data: widget.data),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step 1 of 3'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const LinearProgressIndicator(value: 1 / 3),
            const SizedBox(height: 48),
            const Text(
              "What's your name?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.words,
              autofocus: true,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _next,
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Step2InterestsScreen extends StatefulWidget {
  final OnboardingData data;

  const Step2InterestsScreen({super.key, required this.data});

  @override
  State<Step2InterestsScreen> createState() => _Step2InterestsScreenState();
}

class _Step2InterestsScreenState extends State<Step2InterestsScreen> {
  final allInterests = [
    'Sports',
    'Music',
    'Movies',
    'Books',
    'Gaming',
    'Travel',
    'Food',
    'Tech',
  ];

  final Set<String> selectedInterests = {};

  void _next() {
    if (selectedInterests.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one interest')),
      );
      return;
    }

    widget.data.interests = selectedInterests.toList();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Step3SummaryScreen(data: widget.data),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step 2 of 3'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const LinearProgressIndicator(value: 2 / 3),
            const SizedBox(height: 48),
            const Text(
              'Select your interests',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: allInterests.map((interest) {
                final isSelected = selectedInterests.contains(interest);
                return FilterChip(
                  label: Text(interest),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedInterests.add(interest);
                      } else {
                        selectedInterests.remove(interest);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _next,
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Step3SummaryScreen extends StatelessWidget {
  final OnboardingData data;

  const Step3SummaryScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step 3 of 3'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const LinearProgressIndicator(value: 1),
            const SizedBox(height: 48),
            const Text(
              'All Set!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Summary',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Divider(),
                    Text('Name: ${data.name}'),
                    const SizedBox(height: 8),
                    const Text('Interests:'),
                    ...data.interests.map((i) => Text('  • $i')),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  // Clear entire stack and go to home
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OnboardingHomeScreen(data: data),
                    ),
                    (route) => false,
                  );
                },
                child: const Text('Finish'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingHomeScreen extends StatelessWidget {
  final OnboardingData data;

  const OnboardingHomeScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '🎉',
              style: TextStyle(fontSize: 64),
            ),
            const SizedBox(height: 24),
            Text(
              'Welcome, ${data.name}!',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Your interests:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            ...data.interests.map((i) => Text('• $i')),
            const SizedBox(height: 32),
            Text(
              'Back button exits app (onboarding complete)',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// EXERCISE 3 SOLUTION: Shopping App with Named Routes
// ============================================================

class Routes {
  static const home = '/';
  static const category = '/category';
  static const product = '/product';
  static const cart = '/cart';
  static const checkout = '/checkout';
}

class Product {
  final String id;
  final String name;
  final double price;
  final String category;
  final String emoji;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.emoji,
  });
}

// Simple cart storage
class CartService {
  static final List<Product> items = [];

  static void add(Product product) => items.add(product);
  static void remove(int index) => items.removeAt(index);
  static void clear() => items.clear();
  static bool get isEmpty => items.isEmpty;
  static int get count => items.length;
  static double get total =>
      items.fold(0, (sum, item) => sum + item.price);
}

class Exercise3Solution extends StatelessWidget {
  const Exercise3Solution({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: Routes.home,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Routes.home:
            return MaterialPageRoute(
              builder: (context) => const ShopHomeScreen(),
            );

          case Routes.category:
            final categoryName = settings.arguments as String? ?? 'All';
            return MaterialPageRoute(
              builder: (context) => ShopCategoryScreen(category: categoryName),
            );

          case Routes.product:
            final product = settings.arguments as Product;
            return MaterialPageRoute(
              builder: (context) => ShopProductScreen(product: product),
            );

          case Routes.cart:
            return MaterialPageRoute(
              builder: (context) => const ShopCartScreen(),
            );

          case Routes.checkout:
            // Route guard: check if cart has items
            if (CartService.isEmpty) {
              return MaterialPageRoute(
                builder: (context) => const ShopCartScreen(),
              );
            }
            return MaterialPageRoute(
              builder: (context) => const ShopCheckoutScreen(),
            );

          default:
            return MaterialPageRoute(
              builder: (context) => const Scaffold(
                body: Center(child: Text('404 - Page Not Found')),
              ),
            );
        }
      },
    );
  }
}

class ShopHomeScreen extends StatelessWidget {
  const ShopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'name': 'Electronics', 'emoji': '📱'},
      {'name': 'Clothing', 'emoji': '👕'},
      {'name': 'Books', 'emoji': '📚'},
      {'name': 'Home', 'emoji': '🏠'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('🛒 Shop'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.cart);
                },
              ),
              if (CartService.count > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${CartService.count}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.category,
                  arguments: category['name'],
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    category['emoji'] as String,
                    style: const TextStyle(fontSize: 48),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category['name'] as String,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ShopCategoryScreen extends StatelessWidget {
  final String category;

  const ShopCategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final products = _getProductsForCategory(category);

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              leading: Text(product.emoji, style: const TextStyle(fontSize: 32)),
              title: Text(product.name),
              subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.product,
                  arguments: product,
                );
              },
            ),
          );
        },
      ),
    );
  }

  List<Product> _getProductsForCategory(String category) {
    switch (category) {
      case 'Electronics':
        return [
          Product(id: '1', name: 'Laptop', price: 999.99, category: category, emoji: '💻'),
          Product(id: '2', name: 'Phone', price: 699.99, category: category, emoji: '📱'),
          Product(id: '3', name: 'Headphones', price: 149.99, category: category, emoji: '🎧'),
        ];
      case 'Clothing':
        return [
          Product(id: '4', name: 'T-Shirt', price: 29.99, category: category, emoji: '👕'),
          Product(id: '5', name: 'Jeans', price: 59.99, category: category, emoji: '👖'),
        ];
      case 'Books':
        return [
          Product(id: '6', name: 'Flutter Guide', price: 49.99, category: category, emoji: '📘'),
          Product(id: '7', name: 'Dart Cookbook', price: 39.99, category: category, emoji: '📗'),
        ];
      default:
        return [
          Product(id: '8', name: 'Lamp', price: 34.99, category: category, emoji: '💡'),
          Product(id: '9', name: 'Chair', price: 129.99, category: category, emoji: '🪑'),
        ];
    }
  }
}

class ShopProductScreen extends StatelessWidget {
  final Product product;

  const ShopProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(product.emoji, style: const TextStyle(fontSize: 80)),
            const SizedBox(height: 24),
            Text(
              product.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 24,
                color: Colors.green[700],
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 48),
            FilledButton.icon(
              onPressed: () {
                CartService.add(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.name} added to cart!')),
                );
              },
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Add to Cart'),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () {
                CartService.add(product);
                Navigator.pushNamed(context, Routes.checkout);
              },
              icon: const Icon(Icons.flash_on),
              label: const Text('Buy Now'),
            ),
          ],
        ),
      ),
    );
  }
}

class ShopCartScreen extends StatefulWidget {
  const ShopCartScreen({super.key});

  @override
  State<ShopCartScreen> createState() => _ShopCartScreenState();
}

class _ShopCartScreenState extends State<ShopCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: CartService.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('🛒', style: TextStyle(fontSize: 64)),
                  SizedBox(height: 16),
                  Text('Your cart is empty'),
                ],
              ),
            )
          : ListView.builder(
              itemCount: CartService.items.length,
              itemBuilder: (context, index) {
                final item = CartService.items[index];
                return ListTile(
                  leading: Text(item.emoji, style: const TextStyle(fontSize: 24)),
                  title: Text(item.name),
                  subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () {
                      setState(() {
                        CartService.remove(index);
                      });
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: CartService.isEmpty
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total:',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '\$${CartService.total.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.checkout);
                        },
                        child: const Text('Checkout'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class ShopCheckoutScreen extends StatelessWidget {
  const ShopCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...CartService.items.map((item) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Text(item.emoji),
                  title: Text(item.name),
                  trailing: Text('\$${item.price.toStringAsFixed(2)}'),
                )),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${CartService.total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  CartService.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Order placed!')),
                  );
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text('Place Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// EXERCISE 4 SOLUTION: Tab Navigation with Nested Routes
// ============================================================

class Exercise4Solution extends StatefulWidget {
  const Exercise4Solution({super.key});

  @override
  State<Exercise4Solution> createState() => _Exercise4SolutionState();
}

class _Exercise4SolutionState extends State<Exercise4Solution> {
  int _currentIndex = 0;

  final _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        // Try to pop in current tab first
        final currentNavigator = _navigatorKeys[_currentIndex].currentState;
        if (currentNavigator != null && currentNavigator.canPop()) {
          currentNavigator.pop();
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            _buildNavigator(0, const TabHomeScreen()),
            _buildNavigator(1, const TabSearchScreen()),
            _buildNavigator(2, const TabProfileScreen()),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.search_outlined),
              selectedIcon: Icon(Icons.search),
              label: 'Search',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outlined),
              selectedIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigator(int index, Widget child) {
    return Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => child,
        );
      },
    );
  }
}

class TabHomeScreen extends StatelessWidget {
  const TabHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Tab', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TabDetailScreen(
                      tabName: 'Home',
                      level: 1,
                    ),
                  ),
                );
              },
              child: const Text('Go to Home Details'),
            ),
          ],
        ),
      ),
    );
  }
}

class TabSearchScreen extends StatelessWidget {
  const TabSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Search Tab', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TabDetailScreen(
                      tabName: 'Search',
                      level: 1,
                    ),
                  ),
                );
              },
              child: const Text('Go to Search Results'),
            ),
          ],
        ),
      ),
    );
  }
}

class TabProfileScreen extends StatelessWidget {
  const TabProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Profile Tab', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TabDetailScreen(
                      tabName: 'Profile',
                      level: 1,
                    ),
                  ),
                );
              },
              child: const Text('Go to Profile Settings'),
            ),
          ],
        ),
      ),
    );
  }
}

class TabDetailScreen extends StatelessWidget {
  final String tabName;
  final int level;

  const TabDetailScreen({
    super.key,
    required this.tabName,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$tabName Detail (Level $level)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$tabName Detail',
              style: const TextStyle(fontSize: 24),
            ),
            Text('Nested Level: $level'),
            const SizedBox(height: 32),
            if (level < 3)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TabDetailScreen(
                        tabName: tabName,
                        level: level + 1,
                      ),
                    ),
                  );
                },
                child: const Text('Go Deeper'),
              ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
