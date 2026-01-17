# Lesson 2.1: Conditionals (Making Decisions)

## If / Else
This allows your code to branch based on boolean conditions.

```dart
int age = 20;

if (age >= 18) {
  print("You are an adult.");
} else if (age > 12) {
  print("You are a teenager.");
} else {
  print("You are a child.");
}
```
## Switch Statement
When you have many specific values to check, if/else gets messy. Use switch.
```dart
String command = "OPEN";

switch (command) {
  case "OPEN":
    print("Opening the door...");
    break; // vital!
  case "CLOSE":
    print("Closing the door...");
    break;
  default:
    print("Unknown command.");
}
```
---