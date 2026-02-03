# Lesson 02: Lifting State Up

When multiple widgets need access to the same state, we use a pattern called **"lifting state up"**. Instead of each widget managing its own copy of the data, we move the state to a common ancestor and pass it down.

---

## The Problem: Sibling Widgets Can't Share State

Imagine you're building a shopping cart. You have:
- A **ProductList** widget showing available products
- A **CartSummary** widget showing cart total
- Both need to know what's in the cart

```
App
├── ProductList (wants to add to cart)
└── CartSummary (wants to show cart total)
```

If `ProductList` owns the cart state, `CartSummary` can't access it!

---

## The Solution: Lift State to Common Ancestor

Move the cart state to the parent (`App`), and pass it down to both children:

```
App (owns cart state)
├── ProductList (receives cart, can add items)
└── CartSummary (receives cart, shows total)
```

Now both widgets can access the same cart data.

---

## How to Lift State

### Step 1: Identify the Shared State

What data needs to be shared?
```dart
List<CartItem> cartItems = [];
```

### Step 2: Move State to Common Ancestor

The lowest widget in the tree that is an ancestor of ALL widgets that need the state:

```dart
class ShoppingApp extends StatefulWidget {
  @override
  State<ShoppingApp> createState() => _ShoppingAppState();
}

class _ShoppingAppState extends State<ShoppingApp> {
  // State lives here
  List<CartItem> cartItems = [];
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductList(/* need to pass cart somehow */),
        CartSummary(/* need to pass cart somehow */),
      ],
    );
  }
}
```

### Step 3: Pass State Down as Props

Children receive state through their constructors:

```dart
class _ShoppingAppState extends State<ShoppingApp> {
  List<CartItem> cartItems = [];
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductList(cartItems: cartItems),
        CartSummary(cartItems: cartItems),
      ],
    );
  }
}

class CartSummary extends StatelessWidget {
  final List<CartItem> cartItems;
  
  const CartSummary({super.key, required this.cartItems});
  
  @override
  Widget build(BuildContext context) {
    final total = cartItems.fold(0.0, (sum, item) => sum + item.price);
    return Text('Total: \$${total.toStringAsFixed(2)}');
  }
}
```

### Step 4: Pass Callbacks for Modifications

Children can't modify state directly—they need callback functions:

```dart
class _ShoppingAppState extends State<ShoppingApp> {
  List<CartItem> cartItems = [];
  
  // Callback to add item
  void addToCart(CartItem item) {
    setState(() {
      cartItems.add(item);
    });
  }
  
  // Callback to remove item
  void removeFromCart(CartItem item) {
    setState(() {
      cartItems.remove(item);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductList(
          cartItems: cartItems,
          onAddToCart: addToCart,  // Pass callback
        ),
        CartSummary(
          cartItems: cartItems,
          onRemoveFromCart: removeFromCart,  // Pass callback
        ),
      ],
    );
  }
}
```

---

## Complete Example: Counter with Multiple Controls

Let's build a counter that can be incremented and decremented from different widgets:

```dart
// Parent widget owns the state
class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      count--;
    });
  }

  void reset() {
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shared Counter')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display receives count
          CounterDisplay(count: count),
          const SizedBox(height: 32),
          // Controls receive callbacks
          CounterControls(
            onIncrement: increment,
            onDecrement: decrement,
            onReset: reset,
          ),
        ],
      ),
    );
  }
}

// Child widget displays count (stateless - just receives data)
class CounterDisplay extends StatelessWidget {
  final int count;

  const CounterDisplay({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$count',
      style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
    );
  }
}

// Child widget has controls (stateless - just calls callbacks)
class CounterControls extends StatelessWidget {
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onReset;

  const CounterControls({
    super.key,
    required this.onIncrement,
    required this.onDecrement,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: onDecrement,
        ),
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: onReset,
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: onIncrement,
        ),
      ],
    );
  }
}
```

### Data Flow

```
┌─────────────────────────────────────────────────┐
│                 CounterApp                       │
│              (owns count state)                  │
│                                                  │
│    count: 5                                      │
│    increment() { setState(() => count++) }       │
│    decrement() { setState(() => count--) }       │
│                                                  │
│         │                      │                 │
│         │ count: 5             │ onIncrement     │
│         ▼                      │ onDecrement     │
│  ┌──────────────┐      ┌───────▼────────┐       │
│  │CounterDisplay│      │CounterControls │       │
│  │   shows 5    │      │ calls callbacks│       │
│  └──────────────┘      └────────────────┘       │
└─────────────────────────────────────────────────┘
```

---

## Passing Data with Callbacks

### Pattern 1: VoidCallback (No Data)

When the child just needs to trigger an action:

```dart
// Parent
void handleTap() {
  print('Button was tapped');
}

// In build:
MyButton(onTap: handleTap)

// Child
class MyButton extends StatelessWidget {
  final VoidCallback onTap;  // Takes no parameters
  
  const MyButton({super.key, required this.onTap});
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: const Text('Tap Me'),
    );
  }
}
```

### Pattern 2: Callback with Data

When the child needs to send data back to parent:

```dart
// Parent
void handleColorSelected(Color color) {
  setState(() {
    selectedColor = color;
  });
}

// In build:
ColorPicker(onColorSelected: handleColorSelected)

// Child
class ColorPicker extends StatelessWidget {
  final Function(Color) onColorSelected;  // Takes Color parameter
  
  const ColorPicker({super.key, required this.onColorSelected});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => onColorSelected(Colors.red),
          child: Container(width: 50, height: 50, color: Colors.red),
        ),
        GestureDetector(
          onTap: () => onColorSelected(Colors.blue),
          child: Container(width: 50, height: 50, color: Colors.blue),
        ),
      ],
    );
  }
}
```

### Pattern 3: ValueChanged<T>

Flutter provides `ValueChanged<T>` typedef for single-value callbacks:

```dart
// This:
final Function(String) onChanged;

// Is the same as:
final ValueChanged<String> onChanged;
```

Example:

```dart
class RatingWidget extends StatelessWidget {
  final int rating;
  final ValueChanged<int> onRatingChanged;
  
  const RatingWidget({
    super.key,
    required this.rating,
    required this.onRatingChanged,
  });
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
          onPressed: () => onRatingChanged(index + 1),
        );
      }),
    );
  }
}

// Parent usage:
RatingWidget(
  rating: currentRating,
  onRatingChanged: (newRating) {
    setState(() {
      currentRating = newRating;
    });
  },
)
```

---

## Complete Example: Todo List

A more complex example with adding, completing, and deleting items:

```dart
class Todo {
  final String id;
  final String title;
  bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<Todo> todos = [];

  void addTodo(String title) {
    setState(() {
      todos.add(Todo(
        id: DateTime.now().toString(),
        title: title,
      ));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Column(
        children: [
          // Add todo form
          TodoInput(onAdd: addTodo),
          const Divider(),
          // Todo list
          Expanded(
            child: TodoList(
              todos: todos,
              onToggle: toggleTodo,
              onDelete: deleteTodo,
            ),
          ),
          // Summary
          TodoSummary(todos: todos),
        ],
      ),
    );
  }
}

class TodoInput extends StatefulWidget {
  final Function(String) onAdd;

  const TodoInput({super.key, required this.onAdd});

  @override
  State<TodoInput> createState() => _TodoInputState();
}

class _TodoInputState extends State<TodoInput> {
  final controller = TextEditingController();

  void submit() {
    if (controller.text.isNotEmpty) {
      widget.onAdd(controller.text);
      controller.clear();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Add a todo...',
              ),
              onSubmitted: (_) => submit(),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: submit,
          ),
        ],
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function(String) onToggle;
  final Function(String) onDelete;

  const TodoList({
    super.key,
    required this.todos,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (todos.isEmpty) {
      return const Center(
        child: Text('No todos yet. Add one above!'),
      );
    }

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoItem(
          todo: todo,
          onToggle: () => onToggle(todo.id),
          onDelete: () => onDelete(todo.id),
        );
      },
    );
  }
}

class TodoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (_) => onToggle(),
      ),
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isCompleted
              ? TextDecoration.lineThrough
              : null,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}

class TodoSummary extends StatelessWidget {
  final List<Todo> todos;

  const TodoSummary({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    final completed = todos.where((t) => t.isCompleted).length;
    final total = todos.length;

    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$completed / $total completed'),
          if (completed > 0)
            TextButton(
              onPressed: () {}, // Would need clearCompleted callback
              child: const Text('Clear completed'),
            ),
        ],
      ),
    );
  }
}
```

---

## When to Lift State

### Lift State When:

| Scenario | Solution |
|----------|----------|
| Sibling widgets need same data | Lift to common parent |
| Child affects parent's UI | Lift to parent + callback |
| Form data needs validation | Lift to form container |
| Selection affects multiple areas | Lift to shared ancestor |

### Don't Lift When:

| Scenario | Better Solution |
|----------|-----------------|
| Only one widget needs data | Keep as local state |
| Data needed by whole app | Use Provider/InheritedWidget |
| Too many levels of passing | Consider state management package |

---

## The "Prop Drilling" Problem

When you lift state high in the tree, you might need to pass it through many intermediate widgets that don't use it:

```
App (has theme)
└── HomePage (passes theme)
    └── ProductSection (passes theme)
        └── ProductCard (passes theme)
            └── PriceTag (finally uses theme!)
```

Each intermediate widget needs to accept and pass the `theme` parameter. This is called **prop drilling**.

### Solutions:

1. **Accept it** for small apps (it's not that bad)
2. **InheritedWidget** (built-in Flutter solution)
3. **Provider package** (popular, easy to use)
4. **Riverpod, Bloc, etc.** (for complex apps)

We'll cover these in future classes!

---

## Debugging State Issues

### Common Problems:

**1. UI Not Updating**
- Forgot to call `setState()`
- Modified state outside `setState()`
- Created new list/object instead of modifying

**2. Callback Not Working**
- Forgot to pass callback to child
- Wrong callback signature
- Callback is null

**3. Data Not Reaching Child**
- Forgot to pass data through intermediate widget
- Typo in parameter name
- Constructor missing `required`

### Debug Tips:

```dart
// Add print statements to trace data flow
void addItem(String item) {
  print('addItem called with: $item');  // Debug
  setState(() {
    items.add(item);
    print('items is now: $items');  // Debug
  });
}
```

---

## Summary

1. **Lift state** to the lowest common ancestor of widgets that need it
2. **Pass data down** through constructor parameters
3. **Pass callbacks** to let children modify state
4. Use **VoidCallback** for actions, **ValueChanged<T>** for data
5. **Prop drilling** can be mitigated with InheritedWidget or packages
6. State flows **down**, events flow **up**

---

## Key Takeaways

```
┌────────────────────────────────────────────────────┐
│                    STATE FLOW                       │
│                                                     │
│                    Parent                           │
│                 (owns state)                        │
│                      │                              │
│          ┌──────────┼──────────┐                   │
│          │          │          │                   │
│          ▼          ▼          ▼                   │
│       ChildA     ChildB     ChildC                 │
│     (receives)  (receives) (receives)              │
│                                                     │
│               DATA FLOWS DOWN                       │
│               (via constructors)                    │
├────────────────────────────────────────────────────┤
│                   EVENT FLOW                        │
│                                                     │
│       ChildA     ChildB     ChildC                 │
│     (emits)     (emits)    (emits)                 │
│          │          │          │                   │
│          └──────────┼──────────┘                   │
│                     │                              │
│                     ▼                              │
│                  Parent                            │
│              (handles events)                      │
│                                                     │
│              EVENTS FLOW UP                         │
│              (via callbacks)                        │
└────────────────────────────────────────────────────┘
```

---

## Next Steps

You now understand the fundamentals of state management in Flutter! Practice with the exercises in `exercises.md` to solidify these concepts.

In future classes, we'll explore:
- **Navigation**: Passing state between screens
- **Forms**: Managing complex form state
- **Provider**: Scalable state management

Continue to [exercises.md](./exercises.md) →
