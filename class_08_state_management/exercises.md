# Class 08 Exercises: State Management

Practice managing state in Flutter! These exercises progress from simple to complex.

---

## Exercise 1: Mood Tracker

**Objective:** Build a mood tracking widget with local state.

### Requirements

Create a widget that lets users:
1. Select their current mood from 5 emoji options
2. See which mood is currently selected (highlighted)
3. Display a message based on the selected mood

### Visual Reference

```
┌─────────────────────────────────────┐
│         How are you feeling?        │
│                                     │
│    😢   😕   😐   🙂   😄          │
│              [selected]             │
│                                     │
│        "You're feeling great!"      │
└─────────────────────────────────────┘
```

### Hints

- Use a `StatefulWidget` with a `selectedMood` state variable
- Store moods as a `List<String>` of emojis
- Use `GestureDetector` or `InkWell` for tap handling
- Show a border or scale effect for the selected mood

### Starter Code

```dart
class MoodTracker extends StatefulWidget {
  const MoodTracker({super.key});

  @override
  State<MoodTracker> createState() => _MoodTrackerState();
}

class _MoodTrackerState extends State<MoodTracker> {
  int? selectedMoodIndex;

  final moods = ['😢', '😕', '😐', '🙂', '😄'];
  final moodLabels = ['Terrible', 'Bad', 'Okay', 'Good', 'Great'];

  @override
  Widget build(BuildContext context) {
    // TODO: Implement the mood tracker
    return const Placeholder();
  }
}
```

### Expected Behavior

- Tapping an emoji selects it
- Only one mood can be selected at a time
- Message updates when selection changes

---

## Exercise 2: Theme Switcher

**Objective:** Build a settings panel with multiple toggles that lift state to control the app's appearance.

### Requirements

Create a settings screen with:
1. Dark mode toggle
2. Compact mode toggle (changes spacing)
3. Show labels toggle (shows/hides labels on icons)
4. Parent widget that applies these settings to a preview area

### Visual Reference

```
┌─────────────────────────────────────┐
│           Settings                  │
├─────────────────────────────────────┤
│ Dark Mode                    [ON]   │
│ Compact Mode                 [OFF]  │
│ Show Labels                  [ON]   │
├─────────────────────────────────────┤
│           Preview                   │
│  ┌───────────────────────────────┐  │
│  │  (Preview area that reflects  │  │
│  │   the current settings)       │  │
│  └───────────────────────────────┘  │
└─────────────────────────────────────┘
```

### Hints

- Parent widget holds all settings state
- Pass settings down to `SettingsPanel` and `PreviewArea`
- Use callbacks to update parent state
- `SwitchListTile` is perfect for toggle settings

### Starter Code

```dart
class ThemeSwitcherApp extends StatefulWidget {
  const ThemeSwitcherApp({super.key});

  @override
  State<ThemeSwitcherApp> createState() => _ThemeSwitcherAppState();
}

class _ThemeSwitcherAppState extends State<ThemeSwitcherApp> {
  bool isDarkMode = false;
  bool isCompactMode = false;
  bool showLabels = true;

  @override
  Widget build(BuildContext context) {
    // TODO: Build settings panel and preview area
    return const Placeholder();
  }
}

class SettingsPanel extends StatelessWidget {
  // TODO: Accept settings and callbacks
  
  const SettingsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Build toggle switches
    return const Placeholder();
  }
}

class PreviewArea extends StatelessWidget {
  // TODO: Accept settings and display preview
  
  const PreviewArea({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Show preview that reflects settings
    return const Placeholder();
  }
}
```

### Expected Behavior

- Toggling settings immediately updates the preview
- State is managed in parent, shared with children
- Preview area shows different UI based on settings

---

## Exercise 3: Quiz App

**Objective:** Build a simple quiz with state management for questions, answers, and scoring.

### Requirements

Create a quiz that:
1. Shows one question at a time
2. Has 4 multiple-choice options per question
3. Tracks correct/incorrect answers
4. Shows final score at the end
5. Has a "Try Again" button to restart

### Visual Reference

```
Question Screen:
┌─────────────────────────────────────┐
│      Question 2 of 5                │
├─────────────────────────────────────┤
│                                     │
│  What is the capital of France?     │
│                                     │
│  ┌─────────────────────────────┐    │
│  │ A) London                    │    │
│  └─────────────────────────────┘    │
│  ┌─────────────────────────────┐    │
│  │ B) Paris          ✓ Correct │    │
│  └─────────────────────────────┘    │
│  ┌─────────────────────────────┐    │
│  │ C) Berlin                    │    │
│  └─────────────────────────────┘    │
│  ┌─────────────────────────────┐    │
│  │ D) Madrid                    │    │
│  └─────────────────────────────┘    │
│                                     │
│           [Next Question]           │
└─────────────────────────────────────┘

Results Screen:
┌─────────────────────────────────────┐
│           Quiz Complete!            │
│                                     │
│              🎉                     │
│                                     │
│         You scored 4/5!             │
│            (80%)                    │
│                                     │
│         [Try Again]                 │
└─────────────────────────────────────┘
```

### Hints

- State: `currentQuestionIndex`, `selectedAnswer`, `score`, `isQuizComplete`
- Create a `Question` class with question text, options, and correct answer
- Disable options after an answer is selected
- Use different colors for correct (green) and incorrect (red) answers

### Starter Code

```dart
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
    // Add more questions...
  ];

  int currentQuestionIndex = 0;
  int? selectedAnswer;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: Implement quiz UI
    return const Placeholder();
  }
}
```

### Expected Behavior

- Questions appear one at a time
- Selecting an answer shows if it's correct
- Can only answer once per question
- Score accumulates
- Final screen shows results

---

## Exercise 4: Shopping List with Categories

**Objective:** Build a shopping list app with categories and item management.

### Requirements

Create an app that:
1. Has multiple categories (Produce, Dairy, Bakery, etc.)
2. Each category can be expanded/collapsed
3. Items can be added to each category
4. Items can be marked as purchased (checkbox)
5. Items can be deleted (swipe or button)
6. Shows total items and purchased count

### Visual Reference

```
┌─────────────────────────────────────┐
│     🛒 Shopping List                │
│     12 items • 5 purchased          │
├─────────────────────────────────────┤
│ ▼ Produce (3)                       │
│   ☐ Apples                          │
│   ☑ Bananas                         │
│   ☐ Carrots                         │
│ ▶ Dairy (2)                         │
│ ▼ Bakery (1)                        │
│   ☑ Bread                           │
├─────────────────────────────────────┤
│ ┌─────────────────────────────────┐ │
│ │ Add item to: [Produce ▼]        │ │
│ │ Item name: [___________] [+]   │ │
│ └─────────────────────────────────┘ │
└─────────────────────────────────────┘
```

### Hints

- Create `Category` and `ShoppingItem` classes
- Use `ExpansionTile` for collapsible categories
- Track expanded state for each category
- Use `Dismissible` for swipe-to-delete
- Lift all state to the parent widget

### Starter Code

```dart
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
  final String name;
  final String emoji;
  final List<ShoppingItem> items;
  bool isExpanded;

  Category({
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
    Category(name: 'Produce', emoji: '🥬'),
    Category(name: 'Dairy', emoji: '🥛'),
    Category(name: 'Bakery', emoji: '🍞'),
    Category(name: 'Meat', emoji: '🥩'),
    Category(name: 'Frozen', emoji: '🧊'),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: Implement shopping list
    return const Placeholder();
  }
}
```

### Expected Behavior

- Categories expand/collapse on tap
- Items can be added to specific categories
- Checkboxes toggle purchase status
- Swipe left deletes item
- Header updates with counts

---

## Submission Checklist

For each exercise, make sure you have:

- [ ] All required UI elements present
- [ ] State properly managed with `setState()`
- [ ] Callbacks working correctly (for lifted state)
- [ ] No console errors
- [ ] Smooth user experience

---

## Tips for Success

1. **Plan your state first**: What data changes? Who needs it?
2. **Start with static UI**: Build the layout before adding interactivity
3. **Add one feature at a time**: Don't try to implement everything at once
4. **Use print statements**: Debug state changes by printing values
5. **Check mounted**: Always check `mounted` after async operations

---

## Common Mistakes to Avoid

1. **Forgetting `setState()`**: UI won't update without it
2. **Calling `setState()` in build()**: Causes infinite loops
3. **Not disposing controllers**: Memory leaks
4. **Modifying state directly**: Always use callbacks from parent
5. **Complex state in one variable**: Split into multiple variables

---

## How to Test Your Solutions

1. Create a new Flutter project: `flutter create state_exercises`
2. Replace `lib/main.dart` with your exercise code
3. Run: `flutter run`
4. Test all interactions thoroughly

---

## Bonus Challenges

### For Exercise 1:
- Add animation when mood changes
- Save mood to local storage
- Show mood history for the week

### For Exercise 2:
- Add font size setting with slider
- Add primary color picker
- Persist settings between app launches

### For Exercise 3:
- Add timer for each question
- Add different difficulty levels
- Show answer explanations

### For Exercise 4:
- Add drag to reorder items
- Add item quantity
- Add total estimated cost

---

**Good luck! Remember: State management is a skill that improves with practice.** 🎯
