# Class 06 Exercises: Flutter Setup & First App 🎯

**Builds on:** Class 04 (Classes & Constructors), Class 05 (Inheritance & Polymorphism)

## Setup Before Starting

Make sure you:
1. ✅ Completed Classes 01-05 (Dart fundamentals)
2. ✅ Installed Flutter SDK (`flutter --version` works)
3. ✅ Ran `flutter doctor` successfully
4. ✅ Created a test project: `flutter create test_app`
5. ✅ Got an emulator or simulator running

---

## Exercise 1: Customizing the Default App 📱

### 🎯 Objective

Modify the default Flutter counter app to create a personalized version. Practice:
- Understanding StatefulWidget
- Using `setState()` to update UI
- Customizing colors and text
- Using hot reload for rapid development

### 📋 Requirements

1. **Change the app title** in `MaterialApp`:
   - From: "Flutter Demo"
   - To: "My Personal App"

2. **Change the theme color**:
   - Change from blue to your favorite color
   - Options: Colors.red, Colors.purple, Colors.teal, Colors.indigo, etc.

3. **Update the counter display text**:
   - From: "You have pushed the button this many times:"
   - To: "Button Clicks Counter:" or similar

4. **Add an emoji** to the counter text:
   - Example: "🔢 Button Clicks Counter 🔢"

5. **Change the floating action button**:
   - From: Icon(Icons.add)
   - To: Icon(Icons.favorite) or any other icon

6. **Add a second text widget** that displays:
   - "You have clicked {count} times" (with actual count)
   - Style it differently from the counter number

### 💡 Implementation Hints

- The app title is in `MaterialApp(title: ...)`
- The theme color is in `ThemeData(primarySwatch: ...)`
- The counter text is in the `Column` children
- Icons are from `Icons.*` (hundreds available)
- Use `SizedBox(height: 16)` to add space between widgets

### 📊 Expected Output

```
┌─────────────────────────────────────────┐
│ ← My Personal App                   ☰   │
├─────────────────────────────────────────┤
│                                         │
│     🔢 Button Clicks Counter 🔢         │
│                                         │
│              42                         │
│     (in large purple text)              │
│                                         │
│    You have clicked 42 times            │
│     (in smaller gray text)              │
│                                         │
│                                     ❤️  │
│                                (floating│
│                              button)    │
└─────────────────────────────────────────┘
```

### 💪 Challenges (Optional Bonus)

**Level 1 - More changes:**
- Add a "Reset" button that sets counter back to 0
- Change the button text from showing icon to showing text
- Add multiple buttons for different increments (+1, +5, +10)

**Level 2 - New widgets:**
- Add a `Text` widget showing "Last pressed: [timestamp]"
- Add a `SnackBar` that shows when button is pressed
- Add a `Dialog` that asks for confirmation before resetting

**Level 3 - Advanced:**
- Create a custom widget (like the `StudentCard` in main.dart)
- Use `Row` and `Column` to create a multi-button interface
- Store a list of all clicks and display them

---

## Exercise 2: Create a Simple To-Do List App 📝

### 🎯 Objective

Build your first functional app from scratch! Create a to-do list that:
- Displays a list of tasks
- Has a working counter for completed tasks
- Demonstrates understanding of StatefulWidget and lists

### 📋 Requirements

1. **Create `TodoItem` StatelessWidget** with:
   - Properties: `title` (String), `isCompleted` (bool)
   - Display task title and completion status
   - Use `Card` widget for visual separation

2. **Create `TodoListApp` StatefulWidget** with:
   - List of at least 5 sample to-do items
   - Display all items using `Column` or `ListView`
   - Counter for completed tasks

3. **In main.dart:**
   - Import the new widget
   - Replace default app with your `TodoListApp`
   - Use `Scaffold` with `AppBar` showing title

4. **Styling requirements:**
   - Completed tasks should have strikethrough text
   - Different colors for completed vs incomplete
   - Use `Icons.check_circle` for completed items
   - Use `Icons.radio_button_unchecked` for incomplete items

### 📊 Expected UI Structure

```
┌─────────────────────────────────────────┐
│ ← My To-Do List                     ☰   │
├─────────────────────────────────────────┤
│ Completed: 2 / 5                        │
├─────────────────────────────────────────┤
│ ✅ Buy groceries ~~Buy groceries~~    │ (strikethrough)
│                                         │
│ ⭕ Study Flutter                        │
│                                         │
│ ✅ Call Mom ~~Call Mom~~              │
│                                         │
│ ⭕ Exercise                             │
│                                         │
│ ⭕ Read a book                          │
└─────────────────────────────────────────┘
```

### 💡 Implementation Hints

- Use `TextDecoration.lineThrough` for strikethrough
- Use `Cards` to wrap each todo item
- Use `Row` to combine icon and text
- Use `Text` with `style` parameter for styling
- Create a separate class for each widget

### 📝 Sample Code Structure

```dart
class TodoItem extends StatelessWidget {
  final String title;
  final bool isCompleted;
  
  const TodoItem({
    required this.title,
    required this.isCompleted,
  });
  
  @override
  Widget build(BuildContext context) {
    // Build your UI here
  }
}
```

### 💪 Challenges (Optional Bonus)

**Level 1 - Add interactivity:**
- Make items tappable to toggle completion status
- Convert to `StatefulWidget` to allow toggling
- Show/hide completed items with a button

**Level 2 - Add features:**
- Add input field to create new to-do items
- Add delete button for each item
- Add priority levels (High, Medium, Low)

**Level 3 - Advanced:**
- Save to-do list data (using `SharedPreferences`)
- Add due dates to items
- Sort items by priority or due date

---

## Exercise 3: Build a Simple Counter App with Multiple Operations ➕➖

### 🎯 Objective

Create an app with:
- Multiple buttons for different operations
- Display current count
- Show operation history
- Practice widget composition and state management

### 📋 Requirements

1. **Create calculator-style interface** with buttons:
   - `+1` — Increment by 1
   - `-1` — Decrement by 1
   - `+5` — Increment by 5
   - `Reset` — Set counter to 0
   - `Double` — Multiply by 2

2. **Display current count** prominently:
   - Large font (size 48 or more)
   - Centered on screen
   - Change color based on value (green if positive, red if negative)

3. **Show operation history**:
   - Display last 5 operations performed
   - Example: ["+5", "-1", "+1", "Reset", "+5"]
   - Use a list or Row with limited items

4. **Button layout**:
   - Use `GridView` or multiple `Row`s
   - All buttons should have consistent styling
   - Show button label clearly

### 📊 Expected Output

```
┌─────────────────────────────────────────┐
│ ← Advanced Counter                  ☰   │
├─────────────────────────────────────────┤
│                                         │
│              42                         │
│          (large number)                 │
│                                         │
│   Recent: [+5] [-1] [+1] [Reset]      │
│                                         │
│   ┌──────┬──────┬──────┐               │
│   │ +1   │ -1   │ +5   │               │
│   ├──────┼──────┼──────┤               │
│   │Reset │Double│Clear │               │
│   └──────┴──────┴──────┘               │
└─────────────────────────────────────────┘
```

### 💡 Implementation Hints

- Use `Row` and `Column` for button layout
- Use `setState()` to update counter and history
- Create helper methods like `increment()`, `decrement()`, etc.
- Use `List<String>` to store operation history
- Use `.take(5)` to show only last 5 operations

### 📝 Sample Structure

```dart
class _AdvancedCounterState extends State<AdvancedCounter> {
  int counter = 0;
  List<String> history = [];

  void _addOperation(String op, int value) {
    setState(() {
      counter += value;
      history.add(op);
      if (history.length > 5) {
        history.removeAt(0);  // Keep only last 5
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build your UI
  }
}
```

### 💪 Challenges (Optional Bonus)

**Level 1 - Improvements:**
- Add `Undo` button that removes last operation
- Add operation descriptions instead of just symbols
- Add animations when counter changes

**Level 2 - Features:**
- Add custom increment value input
- Show statistics (highest value, lowest value, total operations)
- Add themes (dark mode toggle)

**Level 3 - Advanced:**
- Create custom `OperationButton` widget
- Add keyboard support for operations
- Persist counter state using `SharedPreferences`

---

## Exercise 4: Create a Personal Profile Screen 👤

### 🎯 Objective

Build a realistic profile screen like in Instagram, LinkedIn, etc. Practice:
- Creating reusable widgets
- Using images and icons
- Building complex layouts
- Understanding StatelessWidget

### 📋 Requirements

1. **Profile Header** with:
   - Profile image (circular) - use placeholder or any available asset
   - Name
   - Bio/Description
   - Location with icon

2. **Statistics Section** showing:
   - Posts: [number]
   - Followers: [number]
   - Following: [number]
   - Each stat in its own box/container

3. **Action Buttons** with:
   - "Follow" button
   - "Message" button
   - "More" button (three dots menu)
   - All buttons same width, different colors

4. **About Section** containing:
   - User bio/description (multiple lines)
   - Join date
   - Links (if available)

5. **Additional Sections** (choose at least 2):
   - Recent activity
   - Skills/interests as tags
   - Social media links
   - Contact information

### 📊 Expected UI Layout

```
┌─────────────────────────────────────────┐
│ ← Back                              ⋮   │
├─────────────────────────────────────────┤
│           ┌─────────────┐               │
│           │             │               │
│           │   Profile   │ John Doe      │
│           │             │ iOS Developer │
│           └─────────────┘               │
│                        📍 San Francisco │
├─────────────────────────────────────────┤
│  150 Posts    1.2K Followers   500 Fol. │
├─────────────────────────────────────────┤
│ ┌─────────────┬─────────────┬──────────┐│
│ │   Follow    │   Message   │   More   ││
│ └─────────────┴─────────────┴──────────┘│
├─────────────────────────────────────────┤
│ Passionate iOS developer, travel       │
│ enthusiast, and coffee lover ☕        │
│                                         │
│ Joined March 2020                       │
│ github.com • twitter.com/john          │
└─────────────────────────────────────────┘
```

### 💡 Implementation Hints

- Use `CircleAvatar` for profile image
- Use `Card` for stat boxes
- Use `Row` for stats, buttons, links
- Use `Column` for overall layout
- Create separate widgets for Profile Header, Stats, Buttons
- Use `Icon` widgets for decorations

### 📝 Sample Component

```dart
class StatBox extends StatelessWidget {
  final String label;
  final String value;

  const StatBox({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Build stat box UI
    );
  }
}
```

### 💪 Challenges (Optional Bonus)

**Level 1 - Polish:**
- Add followers list (show below stats)
- Add edit profile button for profile owner
- Add different profile states (loading, error, success)

**Level 2 - Features:**
- Add follow/unfollow toggle button
- Show activity feed section
- Add profile completion percentage

**Level 3 - Advanced:**
- Multiple profile screens in navigation
- Search/filter profiles
- Implement as StatefulWidget with follow/unfollow logic

---

## Summary

These exercises progress from:
1. **Customizing** → Modify existing app
2. **Creating** → Build from scratch (to-do list)
3. **Building** → More complex component (counter with history)
4. **Designing** → Professional UI (profile screen)

**Key Skills Practiced:**
✅ StatelessWidget vs StatefulWidget
✅ Using `setState()` to update UI
✅ Widget composition (nesting widgets)
✅ Lists and collections
✅ Styling and theming
✅ Hot reload workflow
✅ Understanding widget tree

---

**Next:** Review [solutions/solution_06.dart](solutions/solution_06.dart) for reference implementations 📚
