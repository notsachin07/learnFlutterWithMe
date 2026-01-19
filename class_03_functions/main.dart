// Class 03 - Source Code
// Run this using: dart main.dart

void main() {
  print("--- SECTION 1: Basic Functions ---");
  greetUser("Sachin");
  
  int result = add(10, 20);
  print("Result of addition: $result");

  print("\n--- SECTION 2: Arrow Functions ---");
  print("Square of 5 is ${getSquare(5)}");

  print("\n--- SECTION 3: Named Parameters (Crucial) ---");
  
  // Notice we must use the parameter names here
  describeDevice(brand: "Dell", ram: 16);
  
  // Order doesn't matter!
  describeDevice(ram: 8, brand: "Raspberry Pi");
  
  // Using a function with mixed parameters
  print("\n--- Mixed Parameters ---");
  uploadFile("data.csv", destination: "/server/uploads");
}

// 1. Standard Function
void greetUser(String name) {
  print("Welcome, $name!");
}

int add(int a, int b) {
  return a + b;
}

// 2. Arrow Function (Short syntax)
int getSquare(int n) => n * n;

// 3. Named Parameters
// putting {} makes them named. 
// 'required' means it cannot be skipped.
void describeDevice({required String brand, required int ram}) {
  print("Device: $brand with ${ram}GB RAM");
}

// 4. Mixed (Positional + Named)
// 'fileName' is required and positional. 'destination' is named.
void uploadFile(String fileName, {required String destination}) {
  print("Uploading $fileName to $destination...");
}