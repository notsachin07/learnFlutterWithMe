# Lesson 2.2: Loops (Repetition)

## 1. The Standard `for` Loop
Used when you know exactly how many times to loop.
Syntax: `for (initialization; condition; increment)`

```dart
// Count 0 to 4
for (int i = 0; i < 5; i++) {
  print("Count: $i");
}
```
## 2.The `for-in` Loop (Python style)
Used to iterate over lists (arrays).
```dart
var students = ["Sachin", "Alex", "Sam"];
for (var student in students) {
  print(student);
}
```
## 3. The `while`  Loop
Used when you don't know how many times it will run (it runs while a condition is true).
```dart
int battery = 5;
while (battery > 0) {
  print("Battery: $battery%");
  battery--; // Decrease by 1
}
```
---