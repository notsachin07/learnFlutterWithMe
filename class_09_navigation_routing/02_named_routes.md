# Lesson 02: Named Routes

Named routes provide a cleaner, more maintainable way to handle navigation in larger Flutter apps. Instead of creating `MaterialPageRoute` objects everywhere, you define routes once and navigate using simple string names.

---

## Why Named Routes?

### Problems with Anonymous Routes

```dart
// Repeated code everywhere
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => HomeScreen()),
);

Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => ProfileScreen(userId: 123)),
);

Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SettingsScreen()),
);
```

**Issues:**
- Repetitive boilerplate
- Hard to refactor screen names
- No central place to see all routes
- Difficult to implement deep linking

### Named Routes Solution

```dart
// Define once
MaterialApp(
  routes: {
    '/': (context) => HomeScreen(),
    '/profile': (context) => ProfileScreen(),
    '/settings': (context) => SettingsScreen(),
  },
);

// Use everywhere
Navigator.pushNamed(context, '/profile');
Navigator.pushNamed(context, '/settings');
```

**Benefits:**
- Cleaner navigation code
- Central route configuration
- Easier to implement navigation guards
- Better for deep linking

---

## Setting Up Named Routes

### Step 1: Define Routes in MaterialApp

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      // Initial route (optional, defaults to '/')
      initialRoute: '/',
      
      // Define all routes
      routes: {
        '/': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}
```

### Step 2: Navigate Using Route Names

```dart
// Push a named route
Navigator.pushNamed(context, '/profile');

// Push and replace
Navigator.pushReplacementNamed(context, '/home');

// Push and remove all previous
Navigator.pushNamedAndRemoveUntil(
  context,
  '/home',
  (route) => false,
);

// Pop back
Navigator.pop(context);
```

---

## Passing Arguments to Named Routes

Named routes require a different approach to passing data.

### Method 1: Using RouteSettings Arguments

```dart
// Define route that expects arguments
MaterialApp(
  routes: {
    '/product': (context) => const ProductScreen(),
  },
);

// Navigate with arguments
Navigator.pushNamed(
  context,
  '/product',
  arguments: {
    'id': 123,
    'name': 'Laptop',
    'price': 999.99,
  },
);

// Receive arguments in the screen
class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Extract arguments
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final id = args['id'] as int;
    final name = args['name'] as String;
    final price = args['price'] as double;

    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Product ID: $id'),
            Text('Name: $name'),
            Text('Price: \$${price.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
```

### Method 2: Type-Safe Arguments with Custom Class

```dart
// Create argument class
class ProductArguments {
  final int id;
  final String name;
  final double price;

  ProductArguments({
    required this.id,
    required this.name,
    required this.price,
  });
}

// Navigate with typed arguments
Navigator.pushNamed(
  context,
  '/product',
  arguments: ProductArguments(
    id: 123,
    name: 'Laptop',
    price: 999.99,
  ),
);

// Receive typed arguments
class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ProductArguments;

    return Scaffold(
      appBar: AppBar(title: Text(args.name)),
      body: Center(
        child: Text('Price: \$${args.price.toStringAsFixed(2)}'),
      ),
    );
  }
}
```

---

## The onGenerateRoute Method

For more complex apps, use `onGenerateRoute` for dynamic route generation:

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      onGenerateRoute: (settings) {
        // settings.name is the route name
        // settings.arguments contains the arguments

        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            );

          case '/profile':
            final userId = settings.arguments as int?;
            return MaterialPageRoute(
              builder: (context) => ProfileScreen(userId: userId ?? 0),
            );

          case '/product':
            final args = settings.arguments as ProductArguments;
            return MaterialPageRoute(
              builder: (context) => ProductScreen(
                id: args.id,
                name: args.name,
                price: args.price,
              ),
            );

          default:
            // Unknown route
            return MaterialPageRoute(
              builder: (context) => const NotFoundScreen(),
            );
        }
      },
    );
  }
}
```

### Benefits of onGenerateRoute:

1. **Type-safe arguments**: Extract and validate arguments in one place
2. **Custom transitions**: Apply different animations per route
3. **Route guards**: Check authentication before navigation
4. **404 handling**: Show error page for unknown routes
5. **Deep linking**: Parse URLs and navigate accordingly

---

## Route Guards

Prevent navigation to certain screens based on conditions:

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        // Check authentication status
        final isLoggedIn = AuthService.instance.isLoggedIn;

        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            );

          case '/profile':
            // Guard: Requires authentication
            if (!isLoggedIn) {
              return MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              );
            }
            return MaterialPageRoute(
              builder: (context) => const ProfileScreen(),
            );

          case '/admin':
            // Guard: Requires admin role
            if (!isLoggedIn || !AuthService.instance.isAdmin) {
              return MaterialPageRoute(
                builder: (context) => const UnauthorizedScreen(),
              );
            }
            return MaterialPageRoute(
              builder: (context) => const AdminScreen(),
            );

          default:
            return MaterialPageRoute(
              builder: (context) => const NotFoundScreen(),
            );
        }
      },
    );
  }
}
```

---

## Custom Route Transitions

Create custom animations when navigating between screens:

```dart
Route createSlideRoute(Widget screen) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); // Start from right
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      final tween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve),
      );

      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

// Use in onGenerateRoute
onGenerateRoute: (settings) {
  if (settings.name == '/details') {
    return createSlideRoute(const DetailsScreen());
  }
  // ... other routes
}
```

### Common Transitions

**Fade Transition:**
```dart
return PageRouteBuilder(
  pageBuilder: (context, animation, secondaryAnimation) => screen,
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return FadeTransition(opacity: animation, child: child);
  },
);
```

**Scale Transition:**
```dart
return PageRouteBuilder(
  pageBuilder: (context, animation, secondaryAnimation) => screen,
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animation, curve: Curves.easeOut),
      ),
      child: child,
    );
  },
);
```

**Rotation Transition:**
```dart
return PageRouteBuilder(
  pageBuilder: (context, animation, secondaryAnimation) => screen,
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return RotationTransition(
      turns: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
      child: child,
    );
  },
);
```

---

## Complete Example: E-commerce App

```dart
// Main app with named routes
class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            );

          case '/products':
            final category = settings.arguments as String?;
            return MaterialPageRoute(
              builder: (context) => ProductsScreen(category: category),
            );

          case '/product-detail':
            final product = settings.arguments as Product;
            return MaterialPageRoute(
              builder: (context) => ProductDetailScreen(product: product),
            );

          case '/cart':
            return MaterialPageRoute(
              builder: (context) => const CartScreen(),
            );

          case '/checkout':
            // Guard: Check if cart is not empty
            if (CartService.instance.isEmpty) {
              return MaterialPageRoute(
                builder: (context) => const CartScreen(),
              );
            }
            return MaterialPageRoute(
              builder: (context) => const CheckoutScreen(),
            );

          default:
            return MaterialPageRoute(
              builder: (context) => const NotFoundScreen(),
            );
        }
      },
    );
  }
}

// Home screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        children: [
          _buildCategoryCard(context, 'Electronics', '📱'),
          _buildCategoryCard(context, 'Clothing', '👕'),
          _buildCategoryCard(context, 'Books', '📚'),
          _buildCategoryCard(context, 'Home', '🏠'),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String category, String emoji) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/products',
            arguments: category,
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 48)),
            const SizedBox(height: 8),
            Text(
              category,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// Product class
class Product {
  final int id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});
}

// Products screen
class ProductsScreen extends StatelessWidget {
  final String? category;

  const ProductsScreen({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category ?? 'All Products'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Laptop'),
            subtitle: const Text('\$999.99'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/product-detail',
                arguments: Product(id: 1, name: 'Laptop', price: 999.99),
              );
            },
          ),
          // More products...
        ],
      ),
    );
  }
}

// Product detail screen
class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('\$${product.price.toStringAsFixed(2)}'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Add to cart
                CartService.instance.add(product);
                
                // Navigate to cart
                Navigator.pushNamed(context, '/cart');
              },
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## Best Practices

### 1. Use Constants for Route Names

```dart
// routes.dart
class Routes {
  static const home = '/';
  static const profile = '/profile';
  static const settings = '/settings';
  static const productDetail = '/product-detail';
}

// Usage
Navigator.pushNamed(context, Routes.profile);
```

### 2. Create a Centralized Route Generator

```dart
// route_generator.dart
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      
      case Routes.profile:
        final userId = settings.arguments as int?;
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(userId: userId ?? 0),
        );
      
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}

// Usage in MaterialApp
MaterialApp(
  onGenerateRoute: RouteGenerator.generateRoute,
);
```

### 3. Type-Safe Argument Extraction

```dart
// Helper method
T? getRouteArguments<T>(BuildContext context) {
  final args = ModalRoute.of(context)?.settings.arguments;
  return args is T ? args : null;
}

// Usage
class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = getRouteArguments<Product>(context);
    
    if (product == null) {
      return const Scaffold(
        body: Center(child: Text('Invalid product')),
      );
    }
    
    // Use product safely
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      // ...
    );
  }
}
```

### 4. Navigation Service for Testability

```dart
// navigation_service.dart
class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }
}

// In MaterialApp
MaterialApp(
  navigatorKey: NavigationService.navigatorKey,
  // ...
);

// Usage (no context needed!)
NavigationService().navigateTo('/profile');
```

---

## Comparison: Anonymous vs Named Routes

| Feature | Anonymous Routes | Named Routes |
|---------|------------------|--------------|
| **Syntax** | Verbose | Clean |
| **Type Safety** | Better (constructor params) | Requires casting |
| **Maintainability** | Harder to refactor | Easy to refactor |
| **Deep Linking** | Hard to implement | Easy to implement |
| **Route Guards** | Difficult | Easy with `onGenerateRoute` |
| **Best For** | Small apps, quick prototypes | Large apps, production |

---

## When to Use Each Approach

### Use Anonymous Routes When:
- Building small apps or prototypes
- You need strong type safety for arguments
- You have only a few screens

### Use Named Routes When:
- Building production apps
- You need deep linking support
- You want centralized route management
- You need route guards or middleware

---

## Summary

1. **Named routes** provide cleaner navigation code
2. **Define routes** in `MaterialApp.routes` or `onGenerateRoute`
3. **Navigate** using `Navigator.pushNamed(context, '/route')`
4. **Pass arguments** using `arguments` parameter
5. **Extract arguments** with `ModalRoute.of(context)!.settings.arguments`
6. **Use `onGenerateRoute`** for route guards and custom logic
7. **Create constants** for route names to avoid typos
8. **Custom transitions** with `PageRouteBuilder`

---

## Next Steps

You now understand both basic and named routing in Flutter! Practice with the exercises in `exercises.md` to build multi-screen apps with clean navigation patterns.

Continue to [exercises.md](./exercises.md) →
