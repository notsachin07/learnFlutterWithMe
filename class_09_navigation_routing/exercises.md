# Class 09 Exercises: Navigation & Routing

Practice building multi-screen apps with various navigation patterns!

---

## Exercise 1: User Profile Flow

**Objective:** Build a simple user profile app with view and edit screens.

### Requirements

Create an app with three screens:
1. **User List Screen**: Shows a list of users
2. **User Detail Screen**: Shows user info (receives user data)
3. **Edit User Screen**: Edit user info and return updated data

### Visual Reference

```
User List Screen:
┌─────────────────────────────────────┐
│           Users                     │
├─────────────────────────────────────┤
│ 👤 John Doe                      → │
│ 👤 Jane Smith                    → │
│ 👤 Bob Johnson                   → │
└─────────────────────────────────────┘

User Detail Screen:
┌─────────────────────────────────────┐
│         ← John Doe                  │
├─────────────────────────────────────┤
│                                     │
│              👤                     │
│           John Doe                  │
│       john@email.com                │
│                                     │
│        [Edit Profile]               │
└─────────────────────────────────────┘

Edit User Screen:
┌─────────────────────────────────────┐
│         ← Edit Profile              │
├─────────────────────────────────────┤
│                                     │
│  Name: [John Doe________]           │
│  Email: [john@email.com_]           │
│                                     │
│        [Save Changes]               │
└─────────────────────────────────────┘
```

### Hints

- Create a `User` class with `id`, `name`, and `email` properties
- Use `Navigator.push()` to pass user data forward
- Use `Navigator.pop()` with data to return edited user
- Update the UI when returning from edit screen

### Starter Code

```dart
class User {
  final int id;
  String name;
  String email;

  User({required this.id, required this.name, required this.email});
}

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final users = [
    User(id: 1, name: 'John Doe', email: 'john@email.com'),
    User(id: 2, name: 'Jane Smith', email: 'jane@email.com'),
    User(id: 3, name: 'Bob Johnson', email: 'bob@email.com'),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: Implement user list with navigation
    return const Placeholder();
  }
}
```

### Expected Behavior

- Tapping a user opens their detail screen
- Tapping "Edit" opens the edit screen with current data
- Saving returns the updated user to detail screen
- Detail screen shows updated information

---

## Exercise 2: Onboarding Flow

**Objective:** Build a multi-step onboarding wizard that uses `pushReplacement()`.

### Requirements

Create an onboarding flow with:
1. **Welcome Screen**: Introduction with "Get Started" button
2. **Step 1**: Enter name
3. **Step 2**: Select interests (checkboxes)
4. **Step 3**: Summary of choices
5. **Home Screen**: Final destination (can't go back to onboarding)

### Visual Reference

```
Welcome Screen:
┌─────────────────────────────────────┐
│                                     │
│              🚀                     │
│         Welcome to App!             │
│                                     │
│      Let's get you started          │
│                                     │
│        [Get Started]                │
└─────────────────────────────────────┘

Step 1 (Name):
┌─────────────────────────────────────┐
│       Step 1 of 3                   │
│  ════════════░░░░░░░░░░░            │
├─────────────────────────────────────┤
│                                     │
│      What's your name?              │
│                                     │
│      [________________]             │
│                                     │
│              [Next]                 │
└─────────────────────────────────────┘

Final Home (after onboarding):
┌─────────────────────────────────────┐
│           Home                      │
├─────────────────────────────────────┤
│                                     │
│      Welcome, John!                 │
│                                     │
│      Your interests:                │
│      • Sports                       │
│      • Music                        │
│                                     │
└─────────────────────────────────────┘
```

### Hints

- Use `pushReplacement()` between onboarding steps
- Use `pushAndRemoveUntil()` when going to Home
- Store collected data and pass it through each step
- The back button should not work after reaching Home

### Starter Code

```dart
class OnboardingData {
  String name = '';
  List<String> interests = [];
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Show welcome and navigate to Step 1
    return const Placeholder();
  }
}

class Step1NameScreen extends StatefulWidget {
  final OnboardingData data;
  
  const Step1NameScreen({super.key, required this.data});

  @override
  State<Step1NameScreen> createState() => _Step1NameScreenState();
}
```

### Expected Behavior

- Welcome → Step 1 → Step 2 → Step 3 → Home
- Each step passes data to the next
- At Home screen, back button exits app (not back to onboarding)
- Progress indicator updates with each step

---

## Exercise 3: Shopping App with Named Routes

**Objective:** Build a shopping app using named routes and `onGenerateRoute`.

### Requirements

Create an e-commerce flow:
1. **Home Screen** (`/`): Category list
2. **Category Screen** (`/category`): Products in a category
3. **Product Screen** (`/product`): Product details
4. **Cart Screen** (`/cart`): Shopping cart
5. **Checkout Screen** (`/checkout`): Order summary

### Route Structure

```dart
routes:
  '/'          → HomeScreen
  '/category'  → CategoryScreen (args: categoryName)
  '/product'   → ProductScreen (args: Product)
  '/cart'      → CartScreen
  '/checkout'  → CheckoutScreen (guard: cart not empty)
```

### Visual Reference

```
Home:
┌─────────────────────────────────────┐
│         🛒 Shop         🛒(2)      │
├─────────────────────────────────────┤
│  ┌─────────┐  ┌─────────┐          │
│  │Electronics│  │ Clothing │          │
│  └─────────┘  └─────────┘          │
│  ┌─────────┐  ┌─────────┐          │
│  │  Books   │  │  Home   │          │
│  └─────────┘  └─────────┘          │
└─────────────────────────────────────┘

Product:
┌─────────────────────────────────────┐
│         ← Laptop                    │
├─────────────────────────────────────┤
│              💻                     │
│            Laptop                   │
│           $999.99                   │
│                                     │
│   A powerful laptop for work...     │
│                                     │
│        [Add to Cart]                │
│         [Buy Now]                   │
└─────────────────────────────────────┘
```

### Hints

- Define a `Routes` class with static const strings
- Use `onGenerateRoute` for routes that need arguments
- Implement a route guard for `/checkout` (check cart not empty)
- Use a simple singleton or global list for cart state

### Starter Code

```dart
class Routes {
  static const home = '/';
  static const category = '/category';
  static const product = '/product';
  static const cart = '/cart';
  static const checkout = '/checkout';
}

class Product {
  final String id;
  final String name;
  final double price;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
  });
}

// Simple cart storage
class CartService {
  static final List<Product> items = [];
  
  static void add(Product product) => items.add(product);
  static void clear() => items.clear();
  static bool get isEmpty => items.isEmpty;
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.home,
      onGenerateRoute: (settings) {
        // TODO: Implement route generation
        return null;
      },
    );
  }
}
```

### Expected Behavior

- Navigate between screens using `Navigator.pushNamed()`
- Pass category name and product data through arguments
- Cart icon in app bar shows item count
- Cannot access checkout with empty cart

---

## Exercise 4: Tab Navigation with Nested Routes

**Objective:** Build an app with bottom tabs and nested navigation in each tab.

### Requirements

Create an app with:
1. **Bottom Navigation**: 3 tabs (Home, Search, Profile)
2. **Each tab has its own navigation stack**
3. **Navigating within a tab doesn't affect other tabs**

### Visual Reference

```
Home Tab:
┌─────────────────────────────────────┐
│           Home                      │
├─────────────────────────────────────┤
│                                     │
│        [Go to Details]              │
│                                     │
├─────────────────────────────────────┤
│   🏠        🔍        👤           │
│  Home    Search    Profile          │
└─────────────────────────────────────┘

Home → Details (still in Home tab):
┌─────────────────────────────────────┐
│         ← Details                   │
├─────────────────────────────────────┤
│                                     │
│      Home Details Screen            │
│                                     │
├─────────────────────────────────────┤
│   🏠        🔍        👤           │
│  Home    Search    Profile          │
└─────────────────────────────────────┘
```

### Hints

- Use `IndexedStack` or separate `Navigator` widgets per tab
- Each tab should maintain its own navigation history
- Switching tabs should preserve state in each tab
- Back button should pop within current tab first

### Starter Code

```dart
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;

  // Navigator keys for each tab
  final _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: Implement tab navigation with nested navigators
    return const Placeholder();
  }
}
```

### Expected Behavior

- Bottom tabs switch between Home, Search, Profile
- Each tab can navigate to sub-screens
- Switching tabs preserves navigation state
- Back button works within current tab

---

## Submission Checklist

For each exercise, make sure you have:

- [ ] All required screens implemented
- [ ] Navigation working correctly
- [ ] Data passing between screens
- [ ] Proper back button behavior
- [ ] No crashes when navigating

---

## Tips for Success

1. **Plan your navigation flow**: Draw the screen flow before coding
2. **Keep track of data**: Know what data each screen needs
3. **Test back navigation**: Make sure back button works as expected
4. **Handle null arguments**: Check for null when extracting route arguments
5. **Use constants**: Define route names as constants to avoid typos

---

## Common Mistakes to Avoid

1. **Forgetting to await navigation**: Use `await` when expecting return data
2. **Not checking mounted**: Check `context.mounted` after async navigation
3. **Wrong argument types**: Cast arguments to correct type
4. **Missing routes**: Make sure all routes are defined
5. **Infinite navigation**: Avoid navigation in `build()` method

---

## How to Test Your Solutions

1. Create a new Flutter project: `flutter create navigation_exercises`
2. Replace `lib/main.dart` with your exercise code
3. Run: `flutter run`
4. Test all navigation paths thoroughly

---

## Bonus Challenges

### For Exercise 1:
- Add delete user functionality
- Implement undo for deletions
- Add user avatar image picker

### For Exercise 2:
- Add skip functionality
- Save progress to shared preferences
- Add back navigation with confirmation

### For Exercise 3:
- Add search with results screen
- Implement wishlist functionality
- Add order history screen

### For Exercise 4:
- Persist tab state between app restarts
- Add badges to tab icons
- Implement deep linking to specific tabs

---

**Good luck! Navigation is a fundamental skill—master it well!** 🚀
