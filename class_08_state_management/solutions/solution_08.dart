// Class 08 - Solutions
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
      title: 'Class 08 Exercise Solutions',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
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
        title: const Text('Class 08 Solutions'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSolutionCard(
            context,
            'Exercise 1',
            'Mood Tracker',
            'Local state with emoji selection',
            const Exercise1Solution(),
          ),
          _buildSolutionCard(
            context,
            'Exercise 2',
            'Theme Switcher',
            'Lifted state with settings panel',
            const Exercise2Solution(),
          ),
          _buildSolutionCard(
            context,
            'Exercise 3',
            'Quiz App',
            'Multi-screen state management',
            const Exercise3Solution(),
          ),
          _buildSolutionCard(
            context,
            'Exercise 4',
            'Shopping List',
            'Complex list state with categories',
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
// EXERCISE 1 SOLUTION: Mood Tracker
// ============================================================

class Exercise1Solution extends StatelessWidget {
  const Exercise1Solution({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 1: Mood Tracker')),
      body: const Center(
        child: MoodTracker(),
      ),
    );
  }
}

class MoodTracker extends StatefulWidget {
  const MoodTracker({super.key});

  @override
  State<MoodTracker> createState() => _MoodTrackerState();
}

class _MoodTrackerState extends State<MoodTracker> {
  int? selectedMoodIndex;

  final moods = ['😢', '😕', '😐', '🙂', '😄'];
  final moodLabels = ['Terrible', 'Bad', 'Okay', 'Good', 'Great'];
  final moodColors = [
    Colors.red[300]!,
    Colors.orange[300]!,
    Colors.amber[300]!,
    Colors.lightGreen[300]!,
    Colors.green[400]!,
  ];

  String get moodMessage {
    if (selectedMoodIndex == null) return 'Select how you\'re feeling';
    return 'You\'re feeling ${moodLabels[selectedMoodIndex!].toLowerCase()}!';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(24),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'How are you feeling?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),

            // Mood selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(moods.length, (index) {
                final isSelected = selectedMoodIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedMoodIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isSelected ? moodColors[index] : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected ? moodColors[index] : Colors.grey[300]!,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        AnimatedScale(
                          scale: isSelected ? 1.2 : 1.0,
                          duration: const Duration(milliseconds: 200),
                          child: Text(
                            moods[index],
                            style: const TextStyle(fontSize: 36),
                          ),
                        ),
                        if (isSelected) ...[
                          const SizedBox(height: 4),
                          Text(
                            moodLabels[index],
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 32),

            // Message
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                moodMessage,
                key: ValueKey(selectedMoodIndex),
                style: TextStyle(
                  fontSize: 18,
                  color: selectedMoodIndex != null
                      ? moodColors[selectedMoodIndex!]
                      : Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Reset button
            if (selectedMoodIndex != null) ...[
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedMoodIndex = null;
                  });
                },
                child: const Text('Reset'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ============================================================
// EXERCISE 2 SOLUTION: Theme Switcher
// ============================================================

class Exercise2Solution extends StatefulWidget {
  const Exercise2Solution({super.key});

  @override
  State<Exercise2Solution> createState() => _Exercise2SolutionState();
}

class _Exercise2SolutionState extends State<Exercise2Solution> {
  // Lifted state
  bool isDarkMode = false;
  bool isCompactMode = false;
  bool showLabels = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 2: Theme Switcher')),
      body: Column(
        children: [
          // Settings panel
          SettingsPanel(
            isDarkMode: isDarkMode,
            isCompactMode: isCompactMode,
            showLabels: showLabels,
            onDarkModeChanged: (value) => setState(() => isDarkMode = value),
            onCompactModeChanged: (value) => setState(() => isCompactMode = value),
            onShowLabelsChanged: (value) => setState(() => showLabels = value),
          ),

          const Divider(),

          // Preview area
          Expanded(
            child: PreviewArea(
              isDarkMode: isDarkMode,
              isCompactMode: isCompactMode,
              showLabels: showLabels,
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsPanel extends StatelessWidget {
  final bool isDarkMode;
  final bool isCompactMode;
  final bool showLabels;
  final ValueChanged<bool> onDarkModeChanged;
  final ValueChanged<bool> onCompactModeChanged;
  final ValueChanged<bool> onShowLabelsChanged;

  const SettingsPanel({
    super.key,
    required this.isDarkMode,
    required this.isCompactMode,
    required this.showLabels,
    required this.onDarkModeChanged,
    required this.onCompactModeChanged,
    required this.onShowLabelsChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTile(
          title: Text(
            'Settings',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        SwitchListTile(
          title: const Text('Dark Mode'),
          subtitle: const Text('Use dark theme colors'),
          secondary: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
          value: isDarkMode,
          onChanged: onDarkModeChanged,
        ),
        SwitchListTile(
          title: const Text('Compact Mode'),
          subtitle: const Text('Reduce spacing and padding'),
          secondary: Icon(isCompactMode ? Icons.compress : Icons.expand),
          value: isCompactMode,
          onChanged: onCompactModeChanged,
        ),
        SwitchListTile(
          title: const Text('Show Labels'),
          subtitle: const Text('Display text labels on icons'),
          secondary: Icon(showLabels ? Icons.label : Icons.label_off),
          value: showLabels,
          onChanged: onShowLabelsChanged,
        ),
      ],
    );
  }
}

class PreviewArea extends StatelessWidget {
  final bool isDarkMode;
  final bool isCompactMode;
  final bool showLabels;

  const PreviewArea({
    super.key,
    required this.isDarkMode,
    required this.isCompactMode,
    required this.showLabels,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isDarkMode ? Colors.grey[900] : Colors.grey[100];
    final cardColor = isDarkMode ? Colors.grey[800] : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final padding = isCompactMode ? 8.0 : 16.0;
    final spacing = isCompactMode ? 8.0 : 16.0;

    return Container(
      color: bgColor,
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(padding),
            child: Text(
              'Preview',
              style: TextStyle(
                fontSize: isCompactMode ? 16 : 20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),

          // Sample card
          Card(
            color: cardColor,
            margin: EdgeInsets.all(padding),
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sample Card',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  SizedBox(height: spacing),
                  Text(
                    'This preview reflects your current settings.',
                    style: TextStyle(color: textColor.withOpacity(0.7)),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: spacing),

          // Sample buttons
          Padding(
            padding: EdgeInsets.all(padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconButton(Icons.home, 'Home', isDarkMode, showLabels),
                _buildIconButton(Icons.search, 'Search', isDarkMode, showLabels),
                _buildIconButton(Icons.favorite, 'Favorites', isDarkMode, showLabels),
                _buildIconButton(Icons.person, 'Profile', isDarkMode, showLabels),
              ],
            ),
          ),

          // Status bar
          Padding(
            padding: EdgeInsets.all(padding),
            child: Container(
              padding: EdgeInsets.all(padding),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[700] : Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: isCompactMode ? 16 : 20,
                    color: textColor.withOpacity(0.6),
                  ),
                  SizedBox(width: spacing / 2),
                  Expanded(
                    child: Text(
                      'Dark: $isDarkMode | Compact: $isCompactMode | Labels: $showLabels',
                      style: TextStyle(
                        fontSize: isCompactMode ? 11 : 13,
                        color: textColor.withOpacity(0.6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(
    IconData icon,
    String label,
    bool isDark,
    bool showLabel,
  ) {
    final color = isDark ? Colors.white : Colors.black87;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        if (showLabel) ...[
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: color),
          ),
        ],
      ],
    );
  }
}

// ============================================================
// EXERCISE 3 SOLUTION: Quiz App
// ============================================================

class Exercise3Solution extends StatelessWidget {
  const Exercise3Solution({super.key});

  @override
  Widget build(BuildContext context) {
    return const QuizApp();
  }
}

class Question {
  final String question;
  final List<String> options;
  final int correctIndex;

  Question({
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  final questions = [
    Question(
      question: 'What is the capital of France?',
      options: ['London', 'Paris', 'Berlin', 'Madrid'],
      correctIndex: 1,
    ),
    Question(
      question: 'Which planet is known as the Red Planet?',
      options: ['Venus', 'Jupiter', 'Mars', 'Saturn'],
      correctIndex: 2,
    ),
    Question(
      question: 'What is the largest mammal?',
      options: ['Elephant', 'Blue Whale', 'Giraffe', 'Polar Bear'],
      correctIndex: 1,
    ),
    Question(
      question: 'In which year did World War II end?',
      options: ['1943', '1944', '1945', '1946'],
      correctIndex: 2,
    ),
    Question(
      question: 'What programming language is Flutter built with?',
      options: ['Java', 'Kotlin', 'Swift', 'Dart'],
      correctIndex: 3,
    ),
  ];

  int currentQuestionIndex = 0;
  int? selectedAnswer;
  int score = 0;
  bool get isQuizComplete => currentQuestionIndex >= questions.length;

  void selectAnswer(int index) {
    if (selectedAnswer != null) return; // Already answered

    setState(() {
      selectedAnswer = index;
      if (index == questions[currentQuestionIndex].correctIndex) {
        score++;
      }
    });
  }

  void nextQuestion() {
    setState(() {
      currentQuestionIndex++;
      selectedAnswer = null;
    });
  }

  void restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      selectedAnswer = null;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 3: Quiz App'),
      ),
      body: isQuizComplete
          ? _buildResultsScreen()
          : _buildQuestionScreen(),
    );
  }

  Widget _buildQuestionScreen() {
    final question = questions[currentQuestionIndex];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Progress indicator
          LinearProgressIndicator(
            value: (currentQuestionIndex + 1) / questions.length,
          ),
          const SizedBox(height: 8),
          Text(
            'Question ${currentQuestionIndex + 1} of ${questions.length}',
            style: const TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          // Question
          Text(
            question.question,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          // Options
          ...List.generate(question.options.length, (index) {
            final isSelected = selectedAnswer == index;
            final isCorrect = index == question.correctIndex;
            final showResult = selectedAnswer != null;

            Color? backgroundColor;
            Color? borderColor;
            IconData? trailingIcon;

            if (showResult) {
              if (isCorrect) {
                backgroundColor = Colors.green[50];
                borderColor = Colors.green;
                trailingIcon = Icons.check_circle;
              } else if (isSelected && !isCorrect) {
                backgroundColor = Colors.red[50];
                borderColor = Colors.red;
                trailingIcon = Icons.cancel;
              }
            } else if (isSelected) {
              borderColor = Theme.of(context).primaryColor;
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                onTap: selectedAnswer == null ? () => selectAnswer(index) : null,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    border: Border.all(
                      color: borderColor ?? Colors.grey[300]!,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: borderColor?.withOpacity(0.1) ?? Colors.grey[100],
                        ),
                        child: Center(
                          child: Text(
                            String.fromCharCode(65 + index), // A, B, C, D
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: borderColor ?? Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          question.options[index],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      if (trailingIcon != null)
                        Icon(
                          trailingIcon,
                          color: borderColor,
                        ),
                    ],
                  ),
                ),
              ),
            );
          }),

          const Spacer(),

          // Next button
          if (selectedAnswer != null)
            FilledButton(
              onPressed: nextQuestion,
              child: Text(
                currentQuestionIndex < questions.length - 1
                    ? 'Next Question'
                    : 'See Results',
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildResultsScreen() {
    final percentage = (score / questions.length * 100).round();
    final emoji = percentage >= 80 ? '🎉' : percentage >= 60 ? '😊' : '😅';

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 64),
            ),
            const SizedBox(height: 24),
            const Text(
              'Quiz Complete!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'You scored $score/${questions.length}',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              '($percentage%)',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              percentage >= 80
                  ? 'Excellent work!'
                  : percentage >= 60
                      ? 'Good job!'
                      : 'Keep practicing!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: restartQuiz,
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// EXERCISE 4 SOLUTION: Shopping List with Categories
// ============================================================

class Exercise4Solution extends StatelessWidget {
  const Exercise4Solution({super.key});

  @override
  Widget build(BuildContext context) {
    return const ShoppingListApp();
  }
}

class ShoppingItem {
  final String id;
  final String name;
  bool isPurchased;

  ShoppingItem({
    required this.id,
    required this.name,
    this.isPurchased = false,
  });
}

class Category {
  final String id;
  final String name;
  final String emoji;
  final List<ShoppingItem> items;
  bool isExpanded;

  Category({
    required this.id,
    required this.name,
    required this.emoji,
    List<ShoppingItem>? items,
    this.isExpanded = true,
  }) : items = items ?? [];
}

class ShoppingListApp extends StatefulWidget {
  const ShoppingListApp({super.key});

  @override
  State<ShoppingListApp> createState() => _ShoppingListAppState();
}

class _ShoppingListAppState extends State<ShoppingListApp> {
  final categories = [
    Category(
      id: '1',
      name: 'Produce',
      emoji: '🥬',
      items: [
        ShoppingItem(id: '1a', name: 'Apples'),
        ShoppingItem(id: '1b', name: 'Bananas', isPurchased: true),
        ShoppingItem(id: '1c', name: 'Carrots'),
      ],
    ),
    Category(
      id: '2',
      name: 'Dairy',
      emoji: '🥛',
      items: [
        ShoppingItem(id: '2a', name: 'Milk'),
        ShoppingItem(id: '2b', name: 'Cheese', isPurchased: true),
      ],
    ),
    Category(
      id: '3',
      name: 'Bakery',
      emoji: '🍞',
      items: [
        ShoppingItem(id: '3a', name: 'Bread', isPurchased: true),
      ],
    ),
    Category(id: '4', name: 'Meat', emoji: '🥩'),
    Category(id: '5', name: 'Frozen', emoji: '🧊'),
  ];

  String? selectedCategoryId;
  final TextEditingController _itemController = TextEditingController();

  int get totalItems =>
      categories.fold(0, (sum, cat) => sum + cat.items.length);

  int get purchasedItems => categories.fold(
      0, (sum, cat) => sum + cat.items.where((i) => i.isPurchased).length);

  void toggleCategory(String categoryId) {
    setState(() {
      final category = categories.firstWhere((c) => c.id == categoryId);
      category.isExpanded = !category.isExpanded;
    });
  }

  void toggleItem(String categoryId, String itemId) {
    setState(() {
      final category = categories.firstWhere((c) => c.id == categoryId);
      final item = category.items.firstWhere((i) => i.id == itemId);
      item.isPurchased = !item.isPurchased;
    });
  }

  void deleteItem(String categoryId, String itemId) {
    setState(() {
      final category = categories.firstWhere((c) => c.id == categoryId);
      category.items.removeWhere((i) => i.id == itemId);
    });
  }

  void addItem() {
    if (_itemController.text.trim().isEmpty || selectedCategoryId == null) {
      return;
    }

    setState(() {
      final category =
          categories.firstWhere((c) => c.id == selectedCategoryId);
      category.items.add(ShoppingItem(
        id: DateTime.now().toString(),
        name: _itemController.text.trim(),
      ));
      _itemController.clear();

      // Expand the category if collapsed
      if (!category.isExpanded) {
        category.isExpanded = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    selectedCategoryId = categories.first.id;
  }

  @override
  void dispose() {
    _itemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 4: Shopping List'),
      ),
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Row(
              children: [
                const Text(
                  '🛒',
                  style: TextStyle(fontSize: 28),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Shopping List',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '$totalItems items • $purchasedItems purchased',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                if (purchasedItems > 0)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        for (final category in categories) {
                          category.items.removeWhere((i) => i.isPurchased);
                        }
                      });
                    },
                    child: const Text('Clear Done'),
                  ),
              ],
            ),
          ),

          // Categories list
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Column(
                    children: [
                      // Category header
                      ListTile(
                        leading: Text(
                          category.emoji,
                          style: const TextStyle(fontSize: 24),
                        ),
                        title: Text(
                          category.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (category.items.isNotEmpty)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  '${category.items.length}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            Icon(
                              category.isExpanded
                                  ? Icons.expand_less
                                  : Icons.expand_more,
                            ),
                          ],
                        ),
                        onTap: () => toggleCategory(category.id),
                      ),

                      // Items
                      if (category.isExpanded && category.items.isNotEmpty)
                        ...category.items.map((item) {
                          return Dismissible(
                            key: Key(item.id),
                            direction: DismissDirection.endToStart,
                            onDismissed: (_) =>
                                deleteItem(category.id, item.id),
                            background: Container(
                              color: Colors.red,
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 16),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.only(
                                left: 56,
                                right: 16,
                              ),
                              leading: Checkbox(
                                value: item.isPurchased,
                                onChanged: (_) =>
                                    toggleItem(category.id, item.id),
                              ),
                              title: Text(
                                item.name,
                                style: TextStyle(
                                  decoration: item.isPurchased
                                      ? TextDecoration.lineThrough
                                      : null,
                                  color:
                                      item.isPurchased ? Colors.grey : null,
                                ),
                              ),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.delete_outline,
                                  size: 20,
                                ),
                                onPressed: () =>
                                    deleteItem(category.id, item.id),
                              ),
                            ),
                          );
                        }),

                      // Empty state
                      if (category.isExpanded && category.items.isEmpty)
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            'No items in ${category.name}',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Add item form
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                // Category dropdown
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedCategoryId,
                      items: categories.map((cat) {
                        return DropdownMenuItem(
                          value: cat.id,
                          child: Text('${cat.emoji} ${cat.name}'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCategoryId = value;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // Item name field
                Expanded(
                  child: TextField(
                    controller: _itemController,
                    decoration: const InputDecoration(
                      hintText: 'Add item...',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    onSubmitted: (_) => addItem(),
                  ),
                ),
                const SizedBox(width: 8),

                // Add button
                IconButton.filled(
                  onPressed: addItem,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
