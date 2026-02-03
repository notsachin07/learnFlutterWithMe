# Lesson 01: Local State with setState()

Local state is data that belongs to a **single widget** and doesn't need to be shared with other parts of your app. This is the most common type of state you'll manage in Flutter.

---

## What is Local State?

Local state includes:
- Whether a checkbox is checked
- The current value of a text field
- Whether a dropdown is expanded
- The current step in a stepper
- Animation progress

If only ONE widget needs to know about this data, it's local state.

---

## The setState() Method

`setState()` is Flutter's way of telling the framework: **"Hey, my data changed—please rebuild my widget!"**

### Basic Syntax

```dart
setState(() {
  // Update your state variables here
  myVariable = newValue;
});
```

### How It Works

1. You call `setState()` with a callback function
2. Inside the callback, you modify state variables
3. Flutter marks the widget as "dirty" (needs rebuild)
4. Flutter calls `build()` again with the new state
5. UI updates to reflect the changes

---

## Example: Simple Counter

Let's build a counter that increments when you tap a button.

```dart
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  // Step 1: Declare state variable
  int count = 0;

  // Step 2: Create method to update state
  void increment() {
    setState(() {
      count = count + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Step 3: Use state in build method
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Count: $count',
          style: const TextStyle(fontSize: 48),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: increment,  // Step 4: Connect to UI
          child: const Text('Increment'),
        ),
      ],
    );
  }
}
```

### What Happens When Button is Pressed?

1. User taps "Increment" button
2. `onPressed` calls `increment()`
3. `increment()` calls `setState()`
4. Inside `setState()`, `count` becomes `count + 1`
5. Flutter rebuilds the widget
6. `Text` now shows the updated `count`

---

## Common setState() Patterns

### Pattern 1: Toggle Boolean

```dart
class _ToggleExampleState extends State<ToggleExample> {
  bool isOn = false;

  void toggle() {
    setState(() {
      isOn = !isOn;  // Flip the boolean
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(isOn ? 'ON' : 'OFF'),
        Switch(
          value: isOn,
          onChanged: (value) {
            setState(() {
              isOn = value;
            });
          },
        ),
      ],
    );
  }
}
```

### Pattern 2: Update String

```dart
class _TextInputExampleState extends State<TextInputExample> {
  String userInput = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            setState(() {
              userInput = value;
            });
          },
          decoration: const InputDecoration(
            labelText: 'Type something',
          ),
        ),
        const SizedBox(height: 16),
        Text('You typed: $userInput'),
      ],
    );
  }
}
```

### Pattern 3: Modify List

```dart
class _ListExampleState extends State<ListExample> {
  List<String> items = ['Apple', 'Banana'];

  void addItem(String item) {
    setState(() {
      items.add(item);  // Modifies the list
    });
  }

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => removeItem(index),
          ),
        );
      },
    );
  }
}
```

### Pattern 4: Update Object Property

```dart
class User {
  String name;
  int age;
  
  User({required this.name, required this.age});
}

class _UserExampleState extends State<UserExample> {
  User user = User(name: 'John', age: 25);

  void celebrateBirthday() {
    setState(() {
      user.age = user.age + 1;
    });
  }

  void changeName(String newName) {
    setState(() {
      user.name = newName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Name: ${user.name}'),
        Text('Age: ${user.age}'),
        ElevatedButton(
          onPressed: celebrateBirthday,
          child: const Text('Happy Birthday!'),
        ),
      ],
    );
  }
}
```

---

## setState() Rules and Best Practices

### Rule 1: Only Modify State Inside setState()

```dart
// ❌ BAD: State change outside setState
void increment() {
  count++;  // UI won't update!
}

// ✅ GOOD: State change inside setState
void increment() {
  setState(() {
    count++;
  });
}
```

### Rule 2: Don't Do Heavy Work Inside setState()

```dart
// ❌ BAD: Expensive operation inside setState
void loadData() {
  setState(() {
    data = expensiveComputation();  // Blocks UI
  });
}

// ✅ GOOD: Compute first, then setState
void loadData() async {
  final result = await expensiveComputation();  // Async
  setState(() {
    data = result;  // Just assignment
  });
}
```

### Rule 3: Check if Widget is Mounted

When using `setState()` after an async operation, always check if the widget is still in the tree:

```dart
void fetchData() async {
  final data = await api.getData();
  
  // Widget might have been disposed during await
  if (!mounted) return;  // Safety check!
  
  setState(() {
    this.data = data;
  });
}
```

### Rule 4: Don't Call setState() in build()

```dart
// ❌ BAD: Causes infinite loop!
@override
Widget build(BuildContext context) {
  setState(() {
    count++;  // NEVER do this!
  });
  return Text('$count');
}

// ✅ GOOD: setState in event handlers only
@override
Widget build(BuildContext context) {
  return TextButton(
    onPressed: () {
      setState(() {
        count++;  // This is fine
      });
    },
    child: Text('$count'),
  );
}
```

### Rule 5: setState() Should Be Synchronous

```dart
// ❌ BAD: async callback
void update() {
  setState(() async {  // Don't do this!
    await someAsyncWork();
    count++;
  });
}

// ✅ GOOD: await first, then setState
void update() async {
  await someAsyncWork();
  setState(() {
    count++;
  });
}
```

---

## Understanding Widget Rebuilds

When you call `setState()`, Flutter rebuilds the **entire widget subtree**. Understanding this helps you write efficient code.

### What Gets Rebuilt?

```dart
class ParentWidget extends StatefulWidget {
  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    print('ParentWidget building...');  // Prints on every setState
    
    return Column(
      children: [
        Text('Count: $count'),           // Rebuilds
        const ExpensiveWidget(),         // Doesn't rebuild (const)
        ChildWidget(value: count),       // Rebuilds
      ],
    );
  }
}
```

### Optimization: Use const Constructors

```dart
// ❌ Creates new instance on every rebuild
children: [
  MyWidget(),
  AnotherWidget(),
]

// ✅ Reuses same instance (no rebuild needed)
children: [
  const MyWidget(),
  const AnotherWidget(),
]
```

---

## Example: Interactive Form

Let's build a form that shows live validation:

```dart
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String email = '';
  String password = '';
  bool showPassword = false;
  bool isLoading = false;

  bool get isEmailValid => email.contains('@') && email.contains('.');
  bool get isPasswordValid => password.length >= 8;
  bool get canSubmit => isEmailValid && isPasswordValid && !isLoading;

  void submit() async {
    setState(() {
      isLoading = true;
    });

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Login successful!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Email field
          TextField(
            onChanged: (value) => setState(() => email = value),
            decoration: InputDecoration(
              labelText: 'Email',
              errorText: email.isNotEmpty && !isEmailValid
                  ? 'Please enter a valid email'
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
              errorText: password.isNotEmpty && !isPasswordValid
                  ? 'Password must be at least 8 characters'
                  : null,
              suffixIcon: IconButton(
                icon: Icon(
                  showPassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () => setState(() => showPassword = !showPassword),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Submit button
          ElevatedButton(
            onPressed: canSubmit ? submit : null,
            child: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Login'),
          ),
        ],
      ),
    );
  }
}
```

### Key Points in This Example:

1. **Multiple state variables**: `email`, `password`, `showPassword`, `isLoading`
2. **Computed properties**: `isEmailValid`, `isPasswordValid`, `canSubmit`
3. **Conditional UI**: Error messages appear only when needed
4. **Loading state**: Button shows spinner while submitting
5. **Mounted check**: Safety before setState after async

---

## Example: Expandable List Item

```dart
class ExpandableItem extends StatefulWidget {
  final String title;
  final String content;

  const ExpandableItem({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  State<ExpandableItem> createState() => _ExpandableItemState();
}

class _ExpandableItemState extends State<ExpandableItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          // Header (always visible)
          ListTile(
            title: Text(widget.title),
            trailing: Icon(
              isExpanded ? Icons.expand_less : Icons.expand_more,
            ),
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
          ),
          
          // Content (conditionally visible)
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(widget.content),
            ),
        ],
      ),
    );
  }
}
```

---

## When to Use Local State

Use local state when:

| Scenario | Example |
|----------|---------|
| Data affects only one widget | Checkbox checked state |
| No other widget needs the data | Form field value |
| Data is temporary/UI-only | Whether a tooltip is visible |
| State resets when widget is removed | Scroll position |

**Don't** use local state when:

- Multiple widgets need the same data
- Data should persist across navigation
- Data comes from or goes to an external source (API, database)

---

## Summary

1. **`setState()`** tells Flutter to rebuild your widget with new data
2. **Always** modify state variables inside `setState()`
3. **Never** call `setState()` inside `build()`
4. **Check `mounted`** before `setState()` after async operations
5. **Use `const`** constructors for widgets that don't depend on state
6. **Local state** is for data that only one widget needs

---

## Next Steps

In the next lesson, we'll learn how to **share state between widgets** using the "lifting state up" pattern. This is essential when multiple widgets need to read or modify the same data.

Continue to [02_lifting_state.md](./02_lifting_state.md) →
