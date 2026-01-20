# Lesson 2.2: Loops - Repeating Code Automatically

**Builds on:** Class 01 (Variables, Types) & Lesson 2.1 (Conditionals)

Loops let you repeat code multiple times without writing it repeatedly. Instead of printing 1, 2, 3... 100, write a loop that does it automatically!

## 🎯 What You'll Learn
- Use `for` loops when you know how many repetitions
- Use `for-in` loops to iterate through lists
- Use `while` loops when repetition depends on a condition
- Control loops with `break` and `continue`
- Combine loops with conditionals from Lesson 2.1

## 1. The Standard `for` Loop

Use when you know exactly how many times to loop.

**Syntax:** `for (initialization; condition; increment)`

### Basic Example: Counting
```dart
// Count from 0 to 4
for (int i = 0; i < 5; i++) {
  print("Count: $i");
}
```

**Breaking it down:**
- `int i = 0` — Start at 0
- `i < 5` — Continue while i is less than 5
- `i++` — Increase i by 1 each time

### Counting Backward
```dart
// Count down: 3, 2, 1, Liftoff!
for (int i = 3; i > 0; i--) {
  print(i);
}
print("Liftoff!");
```

### Multiplication Table (Real-World Example)
```dart
// Print the 5x table
int table = 5;
for (int i = 1; i <= 10; i++) {
  int result = table * i;
  print("$table x $i = $result");
}
```

### For Loop with Conditionals (from Lesson 2.1)
```dart
// Print only even numbers from 1 to 10
for (int i = 1; i <= 10; i++) {
  if (i % 2 == 0) {  // Check if even
    print(i);
  }
}
```

## 2. The `for-in` Loop (Python Style)

Used to iterate over items in a list. Perfect when you don't care about the index, just the items.

### Basic Example: Iterating a List
```dart
var students = ["Sachin", "Alex", "Sam"];

for (var student in students) {
  print(student);
}
```

**Output:**
```
Sachin
Alex
Sam
```

### Iterating a List of Numbers
```dart
List<int> scores = [85, 90, 78, 95];

for (var score in scores) {
  if (score >= 90) {
    print("Great job! Score: $score");
  }
}
```

### Real-World Example: Processing Data
```dart
List<String> servers = ["AWS", "Azure", "Google Cloud"];

print("Available cloud providers:");
for (var server in servers) {
  print("• $server");
}
```

## 3. The `while` Loop

Use when you don't know how many times it will run. The loop continues **while** a condition is true.

### Basic Example: Battery Drain
```dart
int battery = 5;

while (battery > 0) {
  print("Battery: $battery%");
  battery--;  // Decrease by 1 each time
}
print("Battery dead!");
```

**Output:**
```
Battery: 5%
Battery: 4%
Battery: 3%
Battery: 2%
Battery: 1%
Battery dead!
```

### Real-World Example: Process Until Ready
```dart
// Wait until the system is ready
int retries = 0;
bool isReady = false;

while (!isReady && retries < 5) {
  print("Attempt $retries: Connecting...");
  retries++;
  
  // Simulate checking if system is ready
  if (retries == 3) {
    isReady = true;
  }
}

if (isReady) {
  print("System ready!");
} else {
  print("Failed after 5 attempts");
}
```

## 4. The `do-while` Loop

Similar to `while`, but the code runs **at least once** before checking the condition.

```dart
int count = 0;

do {
  print("Count: $count");
  count++;
} while (count < 3);
```

## 5. Loop Control: `break` and `continue`

### `break` - Exit the loop early
```dart
for (int i = 1; i <= 10; i++) {
  if (i == 5) {
    break;  // Exit the loop when i is 5
  }
  print(i);
}
// Output: 1, 2, 3, 4 (stops before 5)
```

### `continue` - Skip to the next iteration
```dart
for (int i = 1; i <= 5; i++) {
  if (i == 3) {
    continue;  // Skip when i is 3
  }
  print(i);
}
// Output: 1, 2, 4, 5 (skips 3)
```

## 📊 Loop Comparison

| Loop Type | When to Use |
|-----------|-----------|
| `for` | Know exact number of iterations |
| `for-in` | Iterate through list items |
| `while` | Iterate while condition is true |
| `do-while` | Must run at least once |

## 💡 Common Patterns

### Pattern 1: Sum All Numbers
```dart
int sum = 0;
for (int i = 1; i <= 10; i++) {
  sum = sum + i;
}
print("Sum: $sum");  // Output: 55
```

### Pattern 2: Find Item in List
```dart
List<String> fruits = ["Apple", "Banana", "Cherry"];
bool found = false;

for (var fruit in fruits) {
  if (fruit == "Banana") {
    found = true;
    break;
  }
}
print("Found: $found");
```

### Pattern 3: Nested Loops (Loop inside a loop)
```dart
// Multiplication table 1-5 x 1-5
for (int i = 1; i <= 5; i++) {
  for (int j = 1; j <= 5; j++) {
    print("$i x $j = ${i * j}");
  }
  print("---");
}
```

## 🔄 Connection to Other Classes

- **Class 01:** Loops use variables and types from Class 01
- **Lesson 2.1:** Loops often contain conditionals (if/else) inside them
- **Class 03:** Functions can contain loops to process data
- **Class 04:** Class methods use loops to work with collections

---

**Next:** Move to Class 03 (Functions) where you'll learn to organize code into reusable blocks