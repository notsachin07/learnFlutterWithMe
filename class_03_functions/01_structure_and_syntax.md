# Lesson 3.1: Structure & Arrow Syntax

## Standard Function
A standard function in Dart looks like C or Java.

```dart
// Returns an integer
int add(int a, int b) {
  return a + b;
}

// Returns nothing (void)
void greet() {
  print("Hello!");
}
```
## Arrow Syntax (`=>`)
If a function contains only one line of code (one expression), you can remove the curly braces {} and the return keyword. This is heavily used in Flutter.
### Standard:
```dart
int square(int number) {
  return number * number;
}
```
### Arrow Version
```dart
int square(int number) => number * number;
```
Read `=>` as "returns".