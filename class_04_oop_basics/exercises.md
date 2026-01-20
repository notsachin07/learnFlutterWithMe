# Class 04 Exercises

Create `solution_04.dart`.

## Exercise 1: The Smartphone Class
1. Create a class `Smartphone`.
2. Properties: `brand` (String), `storage` (int), `batteryPercentage` (int).
3. Create a **Constructor** to initialize `brand` and `storage`. Set `batteryPercentage` to 100 by default.
4. Method `useApp()`: Reduces battery by 10 and prints "Using app... Battery at X%".
5. In `main`, create a phone and use it twice.

## Exercise 2: The Rectangle (Constructor Logic)
1. Create a class `Rectangle`.
2. Properties: `width`, `height`.
3. Method `getArea()`: Returns `width * height`.
4. Create a **Named Constructor** called `Rectangle.square(double size)` that sets both width and height to the same `size`.
5. Test both a standard rectangle and a square.

## Exercise 3: Flutter Simulation
Create a class called `TextWidget`.
1. It should have properties: `String text`, `String color`, `int fontSize`.
2. Use **Named Parameters** in the constructor. `text` is required. `color` defaults to "Black". `fontSize` defaults to 14.
3. Instantiate it exactly like this:
   ```dart
   var header = TextWidget(
     text: "Welcome Home",
     fontSize: 24,
   );