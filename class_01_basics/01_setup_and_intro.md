# Lesson 1.1: Setup and Your First Dart Program

## What is Dart?

Dart is a programming language. Think of it like English—it's a way to communicate with computers. When you write Dart code, you're giving instructions to the computer. Dart was created by Google and is the language that powers Flutter (which we'll use to build mobile apps).

## Before You Start: Setting Up Dart

Before you can write Dart programs, you need to install the Dart SDK (Software Development Kit). The SDK is like a toolbox that lets your computer understand Dart code.

### Installation Steps:

**Windows:**
1. Go to https://dart.dev/get-dart
2. Download the Windows installer
3. Run the installer and follow the steps
4. Open Command Prompt and type: `dart --version` to verify it's installed

**macOS:**
1. Use Homebrew: `brew tap dart-lang/dart` then `brew install dart`
2. Or download from https://dart.dev/get-dart
3. Open Terminal and type: `dart --version` to verify

**Linux:**
1. Use apt-get: `sudo apt-get update` then `sudo apt-get install dart`
2. Open Terminal and type: `dart --version` to verify

If you see a version number, congratulations! Dart is installed. 🎉

## Understanding the Main Function

Every Dart program has a special function called `main()`. This is the **entry point**—the place where your program starts executing when you run it.

Think of it like this: If your program is a story, `main()` is the opening paragraph. The computer reads the code inside `main()` from top to bottom, line by line.

### The Basic Structure

```dart
void main() {
  // Code here runs when you execute the program
  print("Hello, Flutter Developer!");
}
```

Let's break this down:
- **`void`** - This keyword means "this function doesn't return any value" (we'll learn more about this later)
- **`main()`** - The name of the function. It's special because Dart looks for it automatically
- **`{ }`** - These curly braces contain the code that should run inside the function
- **`print()`** - A built-in function that displays text on the screen
- **`;`** - A semicolon marks the end of a statement (sentence). Every statement in Dart should end with one

## Comments: Talking to Your Future Self

Comments are text that the computer ignores. They're just notes for humans (including yourself!) to understand what the code does.

```dart
// This is a single-line comment. Everything after // is ignored

/* This is a multi-line comment.
   You can write multiple lines here.
   Useful for longer explanations. */
```

## Your First Program: Hello World

Create a new file called `hello_world.dart` with this code:

```dart
void main() {
  print("Hello, Flutter Developer!");
}
```

### Running the Program

Open your terminal/command prompt:

```bash
dart hello_world.dart
```

You should see:
```
Hello, Flutter Developer!
```

Congratulations! You've written and run your first Dart program! 🎊

## The Print Function

`print()` is your way of showing information to the user. It displays text (or other information) on the screen and automatically adds a new line at the end.

```dart
void main() {
  print("Line 1");
  print("Line 2");
  print("Line 3");
}
```

Output:
```
Line 1
Line 2
Line 3
```

## Practice Exercise: Try It Yourself

1. Create a file called `greetings.dart`
2. Write a program that prints your name and favorite color
3. Run it and see the output
4. Try printing 5 different lines

Example output:
```
My name is Alex
My favorite color is blue
```