# Lesson 4.1: The Blueprint

A **Class** is a blueprint for creating objects.
An **Object** is a specific instance of that class.

## Defining a Class
We use PascalCase (CapitalizeFirstLetter) for class names.

```dart
class Robot {
  // Properties (Variables)
  String name = "Droid";
  int batteryLevel = 100;

  // Methods (Functions)
  void sayHello() {
    print("Beep boop. I am $name.");
  }
  
  void useBattery() {
    batteryLevel -= 10;
    print("Battery is now $batteryLevel%");
  }
}
```
## Using the Class
```dart
void main() {
  // Create an Object (Instance)
  // No need to write 'new Robot()' anymore.
  var myBot = Robot(); 
  
  // Modify properties
  myBot.name = "R2-D2";
  
  // Call methods
  myBot.sayHello(); // Output: Beep boop. I am R2-D2.
}
```
---