# Lesson 3.2: Parameters (Positional vs. Named)

This is the most important concept for Flutter widgets.

## 1. Positional Parameters (The Standard)
Order matters. If `name` is first, you must pass the name first.

```dart
void introduce(String name, int age) {
  print("$name is $age");
}
// Usage: introduce("Sachin", 20);
```
## 2. Named Parameters (The Flutter Way)
By wrapping arguments in curly braces `{}`, you can pass them in any order by name. This makes code readable.
### Defination:
```dart
// 'required' means the user MUST provide this value.
void createUser({required String username, int? age}) {
  print("User: $username, Age: $age");
}
```
### Usage:
```dart
createUser(username: "sachin_dev"); 
// OR
createUser(age: 25, username: "sachin_dev");
```
## Why does this matter?
### Flutter widgets look like this:
```dart
// This is actually a constructor function using named parameters!
Container(
  width: 100,
  color: Colors.red,
  child: Text("Hello"),
)
```
---