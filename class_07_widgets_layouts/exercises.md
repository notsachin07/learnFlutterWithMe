# Class 07 Exercises: Widgets & Layouts

Practice building real-world layouts! Each exercise builds on the concepts from the lessons.

---

## Exercise 1: Product Card

**Objective:** Create a product card for an e-commerce app.

### Requirements

Build a card that displays:
1. Product image placeholder (use Container with color)
2. Product name
3. Price (with original price struck through)
4. Star rating row
5. "Add to Cart" button

### Visual Reference

```
┌─────────────────────────────┐
│                             │
│      [Product Image]        │
│         200x150             │
│                             │
├─────────────────────────────┤
│ Wireless Headphones         │
│                             │
│ $79.99  $99.99             │
│         ~~~~~~              │
│ ⭐⭐⭐⭐☆ (4.2)              │
│                             │
│ [    Add to Cart     ]      │
└─────────────────────────────┘
```

### Hints

- Use `Card` as the outer widget
- Use `Column` for vertical arrangement
- Use `Row` for the price and rating
- Use `TextDecoration.lineThrough` for original price
- Use `Icon(Icons.star)` for rating stars

### Starter Code

```dart
class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final double originalPrice;
  final double rating;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Implement the product card
    return Card(
      // Your implementation here
    );
  }
}
```

### Expected Output

A professional-looking product card with proper spacing, styling, and layout.

---

## Exercise 2: Chat Message Bubbles

**Objective:** Create chat message bubbles like WhatsApp or iMessage.

### Requirements

Build two types of message bubbles:
1. **Sent message** (right-aligned, blue background)
2. **Received message** (left-aligned, grey background)

Each bubble should show:
- Message text
- Timestamp
- For sent messages: delivery status (✓ or ✓✓)

### Visual Reference

```
┌─────────────────────────────────────┐
│                                     │
│ ┌──────────────────┐                │
│ │ Hey! How are you?│                │
│ │            10:30 │                │
│ └──────────────────┘                │
│                                     │
│          ┌────────────────────────┐ │
│          │ I'm good, thanks! How  │ │
│          │ about you?       10:31 ✓✓│ │
│          └────────────────────────┘ │
│                                     │
│ ┌──────────────────┐                │
│ │ Doing great!     │                │
│ │            10:32 │                │
│ └──────────────────┘                │
│                                     │
└─────────────────────────────────────┘
```

### Hints

- Use `Align` widget with `Alignment.centerLeft` or `Alignment.centerRight`
- Use `Container` with `BoxDecoration` for bubble styling
- Use `BorderRadius.only()` for chat bubble corners
- Use `Row` with `MainAxisSize.min` for timestamp and checkmarks
- Use `ConstrainedBox` to limit bubble width to ~70% of screen

### Starter Code

```dart
class ChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isSent;
  final bool isRead;

  const ChatBubble({
    super.key,
    required this.message,
    required this.time,
    required this.isSent,
    this.isRead = false,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Implement chat bubble
    return Align(
      // Your implementation here
    );
  }
}
```

### Bonus Challenge

- Add a tail to the bubble (the little triangle)
- Add different background colors for different message states
- Animate the checkmarks when message is read

---

## Exercise 3: Dashboard Grid

**Objective:** Create a dashboard with stat cards in a responsive grid.

### Requirements

Build a dashboard with:
1. Header with greeting and date
2. 4 stat cards in a 2x2 grid
3. Each card shows: icon, title, value, and trend indicator

### Visual Reference

```
┌─────────────────────────────────────┐
│ Good Morning, John!                 │
│ Monday, February 2, 2026            │
├─────────────────────────────────────┤
│                                     │
│ ┌───────────┐  ┌───────────┐       │
│ │ 💰        │  │ 👥        │       │
│ │ Revenue   │  │ Users     │       │
│ │ $12,450   │  │ 1,234     │       │
│ │ ↑ 12%     │  │ ↑ 8%      │       │
│ └───────────┘  └───────────┘       │
│                                     │
│ ┌───────────┐  ┌───────────┐       │
│ │ 📦        │  │ 📊        │       │
│ │ Orders    │  │ Conversion│       │
│ │ 456       │  │ 3.2%      │       │
│ │ ↓ 3%      │  │ ↑ 0.5%    │       │
│ └───────────┘  └───────────┘       │
│                                     │
└─────────────────────────────────────┘
```

### Hints

- Use `GridView.count` with `crossAxisCount: 2`
- Create a reusable `StatCard` widget
- Use `Row` for the trend indicator with icon and percentage
- Use colors: green for positive trends, red for negative

### Starter Code

```dart
class StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final double changePercent;
  final bool isPositive;

  const StatCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.changePercent,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Implement stat card
    return Card(
      // Your implementation here
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Implement dashboard with header and grid
    return Scaffold(
      // Your implementation here
    );
  }
}
```

### Bonus Challenge

- Make the grid responsive (1 column on narrow screens, 2 on wider)
- Add a line chart below the stat cards
- Add pull-to-refresh functionality

---

## Exercise 4: Music Player UI

**Objective:** Create a music player "Now Playing" screen with layered layout.

### Requirements

Build a Now Playing screen with:
1. Album art as background (blurred, use Stack)
2. Album art in center (smaller, with shadow)
3. Song title and artist name
4. Progress bar with timestamps
5. Playback controls (previous, play/pause, next)
6. Additional controls (shuffle, repeat)

### Visual Reference

```
┌─────────────────────────────────────┐
│ ╔═══════════════════════════════╗   │
│ ║                               ║   │
│ ║   (Blurred Album Art BG)      ║   │
│ ║                               ║   │
│ ║      ┌─────────────┐          ║   │
│ ║      │             │          ║   │
│ ║      │ Album Art   │          ║   │
│ ║      │             │          ║   │
│ ║      └─────────────┘          ║   │
│ ║                               ║   │
│ ║      Song Title               ║   │
│ ║      Artist Name              ║   │
│ ║                               ║   │
│ ║   1:23 ════════○───── 3:45    ║   │
│ ║                               ║   │
│ ║   🔀    ⏮️   ▶️   ⏭️    🔁     ║   │
│ ║                               ║   │
│ ╚═══════════════════════════════╝   │
└─────────────────────────────────────┘
```

### Hints

- Use `Stack` for the layered background effect
- Use `Container` with `BoxDecoration` and gradient for overlay
- Use `Slider` widget for progress bar
- Use `IconButton` for controls
- Use `Column` for overall layout
- Consider using `SafeArea` to avoid notches

### Starter Code

```dart
class NowPlayingScreen extends StatefulWidget {
  const NowPlayingScreen({super.key});

  @override
  State<NowPlayingScreen> createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen> {
  bool isPlaying = false;
  double progress = 0.3;

  @override
  Widget build(BuildContext context) {
    // TODO: Implement Now Playing screen
    return Scaffold(
      // Your implementation here
    );
  }
}
```

### Bonus Challenge

- Add animation when play/pause is tapped
- Add a lyrics section that scrolls
- Add volume slider
- Add "like" heart button that animates when tapped

---

## Submission Checklist

For each exercise, make sure you have:

- [ ] All required UI elements present
- [ ] Proper spacing and alignment
- [ ] Colors and styling applied
- [ ] No overflow errors
- [ ] Code is clean and well-organized
- [ ] Widgets are reusable where appropriate

---

## Tips for Success

1. **Plan before coding**: Sketch the layout on paper first
2. **Build outside-in**: Start with the outermost container, then add children
3. **Use debug borders**: Add `Container(decoration: BoxDecoration(border: ...))` to see widget bounds
4. **Test different screen sizes**: Use Flutter Inspector to resize
5. **Extract widgets**: If a section gets complex, make it a separate widget

---

## How to Test Your Solutions

1. Create a new Flutter project: `flutter create layout_exercises`
2. Replace `lib/main.dart` with your exercise code
3. Run: `flutter run`
4. Test on different screen sizes using device emulators

---

**Good luck! Remember: Every complex UI is just a combination of simple layouts.** 🎨
