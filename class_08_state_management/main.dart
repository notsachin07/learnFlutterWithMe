// Class 08 - Source Code
// Run this using: flutter run (in a Flutter project)
//
// This class demonstrates state management fundamentals.
// Everything here builds on Classes 01-07.

import 'package:flutter/material.dart';

void main() {
  runApp(const StateManagementApp());
}

class StateManagementApp extends StatelessWidget {
  const StateManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class 08: State Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    Section1LocalState(),
    Section2LiftedState(),
    Section3FormState(),
    Section4ListState(),
    Section5ComplexState(),
  ];

  final List<String> _titles = const [
    '1. Local State',
    '2. Lifted State',
    '3. Form State',
    '4. List State',
    '5. Complex State',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.touch_app_outlined),
            selectedIcon: Icon(Icons.touch_app),
            label: 'Local',
          ),
          NavigationDestination(
            icon: Icon(Icons.share_outlined),
            selectedIcon: Icon(Icons.share),
            label: 'Lifted',
          ),
          NavigationDestination(
            icon: Icon(Icons.edit_outlined),
            selectedIcon: Icon(Icons.edit),
            label: 'Form',
          ),
          NavigationDestination(
            icon: Icon(Icons.list_outlined),
            selectedIcon: Icon(Icons.list),
            label: 'List',
          ),
          NavigationDestination(
            icon: Icon(Icons.layers_outlined),
            selectedIcon: Icon(Icons.layers),
            label: 'Complex',
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SECTION 1: Local State with setState()
// ============================================================

class Section1LocalState extends StatelessWidget {
  const Section1LocalState({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Text(
          'Local State Examples',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text('State that belongs to a single widget.'),
        SizedBox(height: 24),

        // Counter example
        CounterWidget(),
        SizedBox(height: 16),

        // Toggle example
        ToggleWidget(),
        SizedBox(height: 16),

        // Color picker example
        ColorPickerWidget(),
        SizedBox(height: 16),

        // Expandable card example
        ExpandableCardWidget(),
      ],
    );
  }
}

// Simple counter with local state
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Counter',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '$count',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                  onPressed: () => setState(() => count--),
                  icon: const Icon(Icons.remove),
                ),
                const SizedBox(width: 16),
                IconButton.filled(
                  onPressed: () => setState(() => count = 0),
                  icon: const Icon(Icons.refresh),
                ),
                const SizedBox(width: 16),
                IconButton.filled(
                  onPressed: () => setState(() => count++),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Toggle switch with local state
class ToggleWidget extends StatefulWidget {
  const ToggleWidget({super.key});

  @override
  State<ToggleWidget> createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  bool isEnabled = false;
  bool isDarkMode = false;
  bool notificationsOn = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Toggle Switches',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: const Text('Enable Feature'),
              subtitle: Text(isEnabled ? 'Enabled' : 'Disabled'),
              value: isEnabled,
              onChanged: (value) => setState(() => isEnabled = value),
            ),
            SwitchListTile(
              title: const Text('Dark Mode'),
              subtitle: Text(isDarkMode ? 'On' : 'Off'),
              value: isDarkMode,
              onChanged: (value) => setState(() => isDarkMode = value),
            ),
            SwitchListTile(
              title: const Text('Notifications'),
              subtitle: Text(notificationsOn ? 'On' : 'Off'),
              value: notificationsOn,
              onChanged: (value) => setState(() => notificationsOn = value),
            ),
          ],
        ),
      ),
    );
  }
}

// Color picker with local state
class ColorPickerWidget extends StatefulWidget {
  const ColorPickerWidget({super.key});

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  Color selectedColor = Colors.blue;

  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.amber,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Color Picker',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              width: 100,
              height: 100,
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
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: colors.map((color) {
                final isSelected = color == selectedColor;
                return GestureDetector(
                  onTap: () => setState(() => selectedColor = color),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: isSelected
                          ? Border.all(color: Colors.white, width: 3)
                          : null,
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: color.withOpacity(0.6),
                                blurRadius: 8,
                              ),
                            ]
                          : null,
                    ),
                    child: isSelected
                        ? const Icon(Icons.check, color: Colors.white, size: 20)
                        : null,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// Expandable card with local state
class ExpandableCardWidget extends StatefulWidget {
  const ExpandableCardWidget({super.key});

  @override
  State<ExpandableCardWidget> createState() => _ExpandableCardWidgetState();
}

class _ExpandableCardWidgetState extends State<ExpandableCardWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            title: const Text(
              'Expandable Card',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Tap to expand or collapse'),
            trailing: Icon(
              isExpanded ? Icons.expand_less : Icons.expand_more,
            ),
            onTap: () => setState(() => isExpanded = !isExpanded),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey[100],
              child: const Text(
                'This is the expanded content! You can put any widgets here. '
                'The AnimatedCrossFade widget provides a smooth animation '
                'when transitioning between expanded and collapsed states.',
              ),
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SECTION 2: Lifted State
// ============================================================

class Section2LiftedState extends StatefulWidget {
  const Section2LiftedState({super.key});

  @override
  State<Section2LiftedState> createState() => _Section2LiftedStateState();
}

class _Section2LiftedStateState extends State<Section2LiftedState> {
  // State lifted to parent
  int sharedCount = 0;
  String selectedItem = 'None';

  void incrementCount() {
    setState(() => sharedCount++);
  }

  void decrementCount() {
    setState(() => sharedCount--);
  }

  void selectItem(String item) {
    setState(() => selectedItem = item);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Lifted State Example',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'State is owned by this parent widget and shared with children.',
        ),
        const SizedBox(height: 24),

        // Display widget receives state
        SharedCounterDisplay(count: sharedCount),
        const SizedBox(height: 16),

        // Control widget receives callbacks
        SharedCounterControls(
          onIncrement: incrementCount,
          onDecrement: decrementCount,
        ),
        const SizedBox(height: 24),

        const Divider(),
        const SizedBox(height: 24),

        // Item selector example
        const Text(
          'Item Selector',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text('Selected: $selectedItem'),
        const SizedBox(height: 16),

        // Item list passes selection back to parent
        ItemSelector(
          selectedItem: selectedItem,
          onItemSelected: selectItem,
        ),
      ],
    );
  }
}

class SharedCounterDisplay extends StatelessWidget {
  final int count;

  const SharedCounterDisplay({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text('Shared Counter Display'),
            Text(
              '$count',
              style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class SharedCounterControls extends StatelessWidget {
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const SharedCounterControls({
    super.key,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: onDecrement,
              icon: const Icon(Icons.remove),
              label: const Text('Decrement'),
            ),
            ElevatedButton.icon(
              onPressed: onIncrement,
              icon: const Icon(Icons.add),
              label: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemSelector extends StatelessWidget {
  final String selectedItem;
  final Function(String) onItemSelected;

  const ItemSelector({
    super.key,
    required this.selectedItem,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final items = ['Apple', 'Banana', 'Cherry', 'Date', 'Elderberry'];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: items.map((item) {
        final isSelected = item == selectedItem;
        return ChoiceChip(
          label: Text(item),
          selected: isSelected,
          onSelected: (selected) {
            if (selected) {
              onItemSelected(item);
            }
          },
        );
      }).toList(),
    );
  }
}

// ============================================================
// SECTION 3: Form State
// ============================================================

class Section3FormState extends StatefulWidget {
  const Section3FormState({super.key});

  @override
  State<Section3FormState> createState() => _Section3FormStateState();
}

class _Section3FormStateState extends State<Section3FormState> {
  // Form state
  String name = '';
  String email = '';
  String password = '';
  bool showPassword = false;
  bool agreedToTerms = false;
  bool isSubmitting = false;

  // Computed properties
  bool get isNameValid => name.length >= 2;
  bool get isEmailValid => email.contains('@') && email.contains('.');
  bool get isPasswordValid => password.length >= 8;
  bool get canSubmit =>
      isNameValid && isEmailValid && isPasswordValid && agreedToTerms && !isSubmitting;

  Future<void> submit() async {
    setState(() => isSubmitting = true);

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() => isSubmitting = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Welcome, $name!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Registration Form',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('Real-time validation with setState()'),
          const SizedBox(height: 24),

          // Name field
          TextField(
            onChanged: (value) => setState(() => name = value),
            decoration: InputDecoration(
              labelText: 'Name',
              prefixIcon: const Icon(Icons.person),
              border: const OutlineInputBorder(),
              errorText: name.isNotEmpty && !isNameValid
                  ? 'Name must be at least 2 characters'
                  : null,
              suffixIcon: name.isNotEmpty
                  ? Icon(
                      isNameValid ? Icons.check_circle : Icons.error,
                      color: isNameValid ? Colors.green : Colors.red,
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 16),

          // Email field
          TextField(
            onChanged: (value) => setState(() => email = value),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: const Icon(Icons.email),
              border: const OutlineInputBorder(),
              errorText: email.isNotEmpty && !isEmailValid
                  ? 'Please enter a valid email'
                  : null,
              suffixIcon: email.isNotEmpty
                  ? Icon(
                      isEmailValid ? Icons.check_circle : Icons.error,
                      color: isEmailValid ? Colors.green : Colors.red,
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 16),

          // Password field
          TextField(
            onChanged: (value) => setState(() => password = value),
            obscureText: !showPassword,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: const Icon(Icons.lock),
              border: const OutlineInputBorder(),
              errorText: password.isNotEmpty && !isPasswordValid
                  ? 'Password must be at least 8 characters'
                  : null,
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (password.isNotEmpty)
                    Icon(
                      isPasswordValid ? Icons.check_circle : Icons.error,
                      color: isPasswordValid ? Colors.green : Colors.red,
                    ),
                  IconButton(
                    icon: Icon(
                      showPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () => setState(() => showPassword = !showPassword),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Password strength indicator
          if (password.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: PasswordStrengthIndicator(password: password),
            ),

          // Terms checkbox
          CheckboxListTile(
            value: agreedToTerms,
            onChanged: (value) => setState(() => agreedToTerms = value ?? false),
            title: const Text('I agree to the Terms of Service'),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          ),
          const SizedBox(height: 24),

          // Submit button
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: canSubmit ? submit : null,
              child: isSubmitting
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text('Create Account'),
            ),
          ),

          // Debug info
          const SizedBox(height: 24),
          Card(
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Debug: Current State',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Name: "$name" (valid: $isNameValid)'),
                  Text('Email: "$email" (valid: $isEmailValid)'),
                  Text('Password: ${password.length} chars (valid: $isPasswordValid)'),
                  Text('Agreed to terms: $agreedToTerms'),
                  Text('Can submit: $canSubmit'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PasswordStrengthIndicator extends StatelessWidget {
  final String password;

  const PasswordStrengthIndicator({super.key, required this.password});

  int get strength {
    int score = 0;
    if (password.length >= 8) score++;
    if (password.contains(RegExp(r'[A-Z]'))) score++;
    if (password.contains(RegExp(r'[a-z]'))) score++;
    if (password.contains(RegExp(r'[0-9]'))) score++;
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) score++;
    return score;
  }

  String get label {
    if (strength <= 1) return 'Weak';
    if (strength <= 2) return 'Fair';
    if (strength <= 3) return 'Good';
    if (strength <= 4) return 'Strong';
    return 'Very Strong';
  }

  Color get color {
    if (strength <= 1) return Colors.red;
    if (strength <= 2) return Colors.orange;
    if (strength <= 3) return Colors.amber;
    if (strength <= 4) return Colors.lightGreen;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: LinearProgressIndicator(
                value: strength / 5,
                backgroundColor: Colors.grey[300],
                color: color,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}

// ============================================================
// SECTION 4: List State
// ============================================================

class Section4ListState extends StatefulWidget {
  const Section4ListState({super.key});

  @override
  State<Section4ListState> createState() => _Section4ListStateState();
}

class _Section4ListStateState extends State<Section4ListState> {
  final List<TodoItem> todos = [
    TodoItem(id: '1', title: 'Learn Flutter basics', isCompleted: true),
    TodoItem(id: '2', title: 'Build a simple app', isCompleted: true),
    TodoItem(id: '3', title: 'Master state management', isCompleted: false),
    TodoItem(id: '4', title: 'Deploy to app store', isCompleted: false),
  ];

  final TextEditingController _controller = TextEditingController();

  void addTodo() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      todos.add(TodoItem(
        id: DateTime.now().toString(),
        title: _controller.text.trim(),
      ));
      _controller.clear();
    });
  }

  void toggleTodo(String id) {
    setState(() {
      final todo = todos.firstWhere((t) => t.id == id);
      todo.isCompleted = !todo.isCompleted;
    });
  }

  void deleteTodo(String id) {
    setState(() {
      todos.removeWhere((t) => t.id == id);
    });
  }

  void clearCompleted() {
    setState(() {
      todos.removeWhere((t) => t.isCompleted);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final completedCount = todos.where((t) => t.isCompleted).length;
    final totalCount = todos.length;

    return Column(
      children: [
        // Header
        Container(
          padding: const EdgeInsets.all(16),
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Todo List',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text('$completedCount of $totalCount completed'),
            ],
          ),
        ),

        // Input
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Add a new todo...',
                    border: OutlineInputBorder(),
                  ),
                  onSubmitted: (_) => addTodo(),
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filled(
                onPressed: addTodo,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),

        // List
        Expanded(
          child: todos.isEmpty
              ? const Center(
                  child: Text('No todos yet. Add one above!'),
                )
              : ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return TodoListItem(
                      todo: todo,
                      onToggle: () => toggleTodo(todo.id),
                      onDelete: () => deleteTodo(todo.id),
                    );
                  },
                ),
        ),

        // Footer
        if (completedCount > 0)
          Container(
            padding: const EdgeInsets.all(16),
            child: TextButton.icon(
              onPressed: clearCompleted,
              icon: const Icon(Icons.delete_sweep),
              label: Text('Clear $completedCount completed'),
            ),
          ),
      ],
    );
  }
}

class TodoItem {
  final String id;
  final String title;
  bool isCompleted;

  TodoItem({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });
}

class TodoListItem extends StatelessWidget {
  final TodoItem todo;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const TodoListItem({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(todo.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete(),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: ListTile(
        leading: Checkbox(
          value: todo.isCompleted,
          onChanged: (_) => onToggle(),
        ),
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
            color: todo.isCompleted ? Colors.grey : null,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline),
          onPressed: onDelete,
        ),
      ),
    );
  }
}

// ============================================================
// SECTION 5: Complex State (Shopping Cart)
// ============================================================

class Section5ComplexState extends StatefulWidget {
  const Section5ComplexState({super.key});

  @override
  State<Section5ComplexState> createState() => _Section5ComplexStateState();
}

class _Section5ComplexStateState extends State<Section5ComplexState> {
  // Products catalog
  final List<Product> products = [
    Product(id: '1', name: 'Laptop', price: 999.99, emoji: '💻'),
    Product(id: '2', name: 'Headphones', price: 149.99, emoji: '🎧'),
    Product(id: '3', name: 'Mouse', price: 49.99, emoji: '🖱️'),
    Product(id: '4', name: 'Keyboard', price: 79.99, emoji: '⌨️'),
    Product(id: '5', name: 'Monitor', price: 299.99, emoji: '🖥️'),
    Product(id: '6', name: 'Webcam', price: 89.99, emoji: '📷'),
  ];

  // Cart state
  final Map<String, int> cart = {};

  int get cartItemCount {
    return cart.values.fold(0, (sum, qty) => sum + qty);
  }

  double get cartTotal {
    double total = 0;
    cart.forEach((productId, quantity) {
      final product = products.firstWhere((p) => p.id == productId);
      total += product.price * quantity;
    });
    return total;
  }

  void addToCart(String productId) {
    setState(() {
      cart[productId] = (cart[productId] ?? 0) + 1;
    });
  }

  void removeFromCart(String productId) {
    setState(() {
      if (cart.containsKey(productId)) {
        if (cart[productId]! > 1) {
          cart[productId] = cart[productId]! - 1;
        } else {
          cart.remove(productId);
        }
      }
    });
  }

  void clearCart() {
    setState(() {
      cart.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Cart summary bar
        Container(
          padding: const EdgeInsets.all(16),
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Row(
            children: [
              const Icon(Icons.shopping_cart),
              const SizedBox(width: 8),
              Text(
                '$cartItemCount items',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                '\$${cartTotal.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (cartItemCount > 0) ...[
                const SizedBox(width: 8),
                IconButton(
                  onPressed: clearCart,
                  icon: const Icon(Icons.delete_outline),
                  tooltip: 'Clear cart',
                ),
              ],
            ],
          ),
        ),

        // Product grid
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              final quantity = cart[product.id] ?? 0;
              return ProductCard(
                product: product,
                quantity: quantity,
                onAdd: () => addToCart(product.id),
                onRemove: () => removeFromCart(product.id),
              );
            },
          ),
        ),

        // Checkout button
        if (cartItemCount > 0)
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Order placed! Total: \$${cartTotal.toStringAsFixed(2)}',
                      ),
                      backgroundColor: Colors.green,
                    ),
                  );
                  clearCart();
                },
                icon: const Icon(Icons.payment),
                label: Text('Checkout (\$${cartTotal.toStringAsFixed(2)})'),
              ),
            ),
          ),
      ],
    );
  }
}

class Product {
  final String id;
  final String name;
  final double price;
  final String emoji;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.emoji,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const ProductCard({
    super.key,
    required this.product,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              product.emoji,
              style: const TextStyle(fontSize: 48),
            ),
            const SizedBox(height: 8),
            Text(
              product.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            const Spacer(),
            if (quantity > 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: onRemove,
                    icon: const Icon(Icons.remove_circle_outline),
                    iconSize: 28,
                  ),
                  Text(
                    '$quantity',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: onAdd,
                    icon: const Icon(Icons.add_circle_outline),
                    iconSize: 28,
                  ),
                ],
              )
            else
              FilledButton.tonal(
                onPressed: onAdd,
                child: const Text('Add to Cart'),
              ),
          ],
        ),
      ),
    );
  }
}
