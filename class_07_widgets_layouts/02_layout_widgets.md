# Part 2: Layout Widgets - Arranging Your UI

## Introduction

Now that you know the core building blocks, let's learn how to **arrange** them. Layout widgets control how children are positioned relative to each other.

The three most important layout widgets are:
1. **Column** - Arranges children vertically (↓)
2. **Row** - Arranges children horizontally (→)
3. **Stack** - Overlaps children (layers)

---

## 1. Column - Vertical Arrangement

`Column` arranges its children in a vertical line, from top to bottom.

### Basic Column

```dart
Column(
  children: [
    Text('First'),
    Text('Second'),
    Text('Third'),
  ],
)
```

Result:
```
First
Second
Third
```

### Understanding Main Axis and Cross Axis

For Column:
- **Main Axis** = Vertical (↓)
- **Cross Axis** = Horizontal (→)

```
        Cross Axis →
            ↓
    ┌───────────────────┐
    │    [Widget 1]     │  
    │    [Widget 2]     │ Main Axis ↓
    │    [Widget 3]     │
    └───────────────────┘
```

### MainAxisAlignment (Vertical Positioning)

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.start,  // Default
  children: [...],
)
```

| Value | Description | Visual |
|-------|-------------|--------|
| `start` | Top | `[1][2][3]____` |
| `end` | Bottom | `____[1][2][3]` |
| `center` | Middle | `__[1][2][3]__` |
| `spaceBetween` | Space between | `[1]__[2]__[3]` |
| `spaceAround` | Space around | `_[1]_[2]_[3]_` |
| `spaceEvenly` | Equal space | `_[1]_[2]_[3]_` |

### CrossAxisAlignment (Horizontal Positioning)

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,  // Left align
  children: [...],
)
```

| Value | Description |
|-------|-------------|
| `start` | Left edge |
| `end` | Right edge |
| `center` | Center (default) |
| `stretch` | Stretch to fill width |
| `baseline` | Align text baselines |

### Complete Column Example

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisSize: MainAxisSize.min,  // Shrink to fit children
  children: [
    Text('Header', style: TextStyle(fontSize: 24)),
    SizedBox(height: 8),
    Text('Subtitle'),
    SizedBox(height: 16),
    ElevatedButton(
      onPressed: () {},
      child: Text('Action'),
    ),
  ],
)
```

### MainAxisSize

Controls how much vertical space the Column takes:

```dart
Column(
  mainAxisSize: MainAxisSize.max,  // Default: take all available space
  // OR
  mainAxisSize: MainAxisSize.min,  // Shrink to fit children
  children: [...],
)
```

---

## 2. Row - Horizontal Arrangement

`Row` arranges its children in a horizontal line, from left to right.

### Basic Row

```dart
Row(
  children: [
    Icon(Icons.star),
    Text('Rating'),
    Text('4.5'),
  ],
)
```

Result: `⭐ Rating 4.5`

### Understanding Main Axis and Cross Axis

For Row:
- **Main Axis** = Horizontal (→)
- **Cross Axis** = Vertical (↓)

```
    Main Axis →
        ↓
┌───────────────────────────┐
│                           │
│ [W1] [W2] [W3]            │ Cross Axis ↓
│                           │
└───────────────────────────┘
```

### MainAxisAlignment (Horizontal Positioning)

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text('Left'),
    Text('Center'),
    Text('Right'),
  ],
)
```

### CrossAxisAlignment (Vertical Positioning)

```dart
Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Container(height: 50, width: 50, color: Colors.red),
    Container(height: 100, width: 50, color: Colors.blue),
    Container(height: 75, width: 50, color: Colors.green),
  ],
)
```

### Real-World Row Example: App Bar

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    IconButton(icon: Icon(Icons.menu), onPressed: () {}),
    Text('My App', style: TextStyle(fontSize: 20)),
    IconButton(icon: Icon(Icons.search), onPressed: () {}),
  ],
)
```

---

## 3. Stack - Layered Arrangement

`Stack` places children on top of each other, like layers in Photoshop.

### Basic Stack

```dart
Stack(
  children: [
    Container(width: 200, height: 200, color: Colors.red),    // Bottom layer
    Container(width: 150, height: 150, color: Colors.green),  // Middle layer
    Container(width: 100, height: 100, color: Colors.blue),   // Top layer
  ],
)
```

Result: Blue square on green square on red square (all top-left aligned).

### Stack Alignment

```dart
Stack(
  alignment: Alignment.center,  // All children centered
  children: [
    Container(width: 200, height: 200, color: Colors.red),
    Container(width: 100, height: 100, color: Colors.blue),
  ],
)
```

### Positioned Widget

For precise control within a Stack:

```dart
Stack(
  children: [
    // Background
    Container(color: Colors.grey[200]),
    
    // Top-left badge
    Positioned(
      top: 10,
      left: 10,
      child: Container(
        padding: EdgeInsets.all(8),
        color: Colors.red,
        child: Text('NEW'),
      ),
    ),
    
    // Bottom-right button
    Positioned(
      bottom: 20,
      right: 20,
      child: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    ),
    
    // Centered content
    Center(
      child: Text('Main Content'),
    ),
  ],
)
```

### Positioned Properties

```dart
Positioned(
  top: 10,      // Distance from top
  bottom: 10,   // Distance from bottom
  left: 10,     // Distance from left
  right: 10,    // Distance from right
  width: 100,   // Fixed width
  height: 50,   // Fixed height
  child: Widget(),
)
```

### Stack.fit Property

```dart
Stack(
  fit: StackFit.loose,      // Children use their own size (default)
  // OR
  fit: StackFit.expand,     // Children expand to fill Stack
  // OR
  fit: StackFit.passthrough, // Pass parent constraints
  children: [...],
)
```

### Real-World Stack Example: Profile Card with Badge

```dart
Stack(
  children: [
    // Profile picture
    CircleAvatar(
      radius: 50,
      backgroundImage: NetworkImage('profile_url'),
    ),
    
    // Online status badge
    Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 3),
        ),
      ),
    ),
  ],
)
```

---

## 4. Expanded - Filling Available Space

`Expanded` makes a child fill available space in a Row or Column.

### Basic Expanded

```dart
Row(
  children: [
    Container(width: 50, color: Colors.red),  // Fixed width
    Expanded(
      child: Container(color: Colors.blue),   // Fills remaining space
    ),
    Container(width: 50, color: Colors.green), // Fixed width
  ],
)
```

### Multiple Expanded with Flex

```dart
Row(
  children: [
    Expanded(
      flex: 2,  // Takes 2 parts
      child: Container(color: Colors.red),
    ),
    Expanded(
      flex: 1,  // Takes 1 part
      child: Container(color: Colors.blue),
    ),
  ],
)
// Red takes 2/3, Blue takes 1/3
```

### Expanded in Column

```dart
Column(
  children: [
    Container(height: 100, color: Colors.red),    // Fixed height
    Expanded(
      child: Container(color: Colors.blue),       // Fills remaining height
    ),
    Container(height: 50, color: Colors.green),   // Fixed height
  ],
)
```

---

## 5. Flexible - Flexible Sizing

`Flexible` is like `Expanded` but allows the child to be smaller than available space.

### Expanded vs Flexible

```dart
Row(
  children: [
    // Expanded: MUST fill available space
    Expanded(child: Container(color: Colors.red, width: 50)),
    
    // Flexible: CAN fill available space, but doesn't have to
    Flexible(child: Container(color: Colors.blue, width: 50)),
  ],
)
```

### FlexFit Options

```dart
Flexible(
  fit: FlexFit.loose,  // Child can be smaller (default for Flexible)
  // OR
  fit: FlexFit.tight,  // Child must fill space (same as Expanded)
  child: Widget(),
)
```

---

## 6. Wrap - Overflow to Next Line

When children don't fit in one line, `Wrap` moves them to the next line.

### Basic Wrap

```dart
Wrap(
  spacing: 8,          // Horizontal spacing between children
  runSpacing: 8,       // Vertical spacing between lines
  children: [
    Chip(label: Text('Flutter')),
    Chip(label: Text('Dart')),
    Chip(label: Text('Widgets')),
    Chip(label: Text('Layouts')),
    Chip(label: Text('State')),
    Chip(label: Text('Navigation')),
  ],
)
```

### Wrap Properties

```dart
Wrap(
  direction: Axis.horizontal,      // or Axis.vertical
  alignment: WrapAlignment.start,  // Main axis alignment
  runAlignment: WrapAlignment.start, // Cross axis alignment
  spacing: 8,
  runSpacing: 8,
  children: [...],
)
```

### Use Case: Tag Cloud

```dart
Wrap(
  spacing: 8,
  runSpacing: 4,
  children: tags.map((tag) => Chip(
    label: Text(tag),
    backgroundColor: Colors.blue[100],
  )).toList(),
)
```

---

## 7. ListView - Scrollable Lists

`ListView` creates a scrollable list of widgets.

### Basic ListView

```dart
ListView(
  children: [
    ListTile(title: Text('Item 1')),
    ListTile(title: Text('Item 2')),
    ListTile(title: Text('Item 3')),
  ],
)
```

### ListView.builder (For Large Lists)

```dart
ListView.builder(
  itemCount: 100,
  itemBuilder: (context, index) {
    return ListTile(
      leading: CircleAvatar(child: Text('$index')),
      title: Text('Item $index'),
      subtitle: Text('Description for item $index'),
    );
  },
)
```

### ListView.separated (With Dividers)

```dart
ListView.separated(
  itemCount: 20,
  separatorBuilder: (context, index) => Divider(),
  itemBuilder: (context, index) {
    return ListTile(title: Text('Item $index'));
  },
)
```

### ListView Properties

```dart
ListView(
  scrollDirection: Axis.vertical,  // or Axis.horizontal
  padding: EdgeInsets.all(16),
  physics: BouncingScrollPhysics(), // iOS-style bounce
  // OR physics: ClampingScrollPhysics(), // Android-style
  children: [...],
)
```

---

## 8. GridView - Grid Layouts

`GridView` creates a 2D scrollable grid.

### GridView.count (Fixed Column Count)

```dart
GridView.count(
  crossAxisCount: 2,  // 2 columns
  mainAxisSpacing: 10,
  crossAxisSpacing: 10,
  padding: EdgeInsets.all(10),
  children: [
    Container(color: Colors.red),
    Container(color: Colors.blue),
    Container(color: Colors.green),
    Container(color: Colors.yellow),
  ],
)
```

### GridView.builder (For Large Grids)

```dart
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    mainAxisSpacing: 8,
    crossAxisSpacing: 8,
    childAspectRatio: 1,  // Width / Height ratio
  ),
  itemCount: 50,
  itemBuilder: (context, index) {
    return Container(
      color: Colors.primaries[index % Colors.primaries.length],
      child: Center(child: Text('$index')),
    );
  },
)
```

### GridView.extent (Fixed Item Width)

```dart
GridView.extent(
  maxCrossAxisExtent: 150,  // Maximum item width
  mainAxisSpacing: 10,
  crossAxisSpacing: 10,
  children: [...],
)
```

---

## 9. Common Layout Patterns

### Pattern 1: Card with Image and Text

```dart
Card(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Image at top
      Image.network(
        'https://example.com/image.jpg',
        height: 150,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      // Content below
      Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Description text goes here'),
          ],
        ),
      ),
    ],
  ),
)
```

### Pattern 2: List Item with Icon

```dart
Row(
  children: [
    Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(Icons.settings, color: Colors.blue),
    ),
    SizedBox(width: 16),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('App preferences', style: TextStyle(color: Colors.grey)),
        ],
      ),
    ),
    Icon(Icons.chevron_right, color: Colors.grey),
  ],
)
```

### Pattern 3: Bottom Navigation Style

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.home),
        Text('Home', style: TextStyle(fontSize: 12)),
      ],
    ),
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.search),
        Text('Search', style: TextStyle(fontSize: 12)),
      ],
    ),
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.person),
        Text('Profile', style: TextStyle(fontSize: 12)),
      ],
    ),
  ],
)
```

### Pattern 4: Overlay Badge

```dart
Stack(
  children: [
    Icon(Icons.notifications, size: 32),
    Positioned(
      right: 0,
      top: 0,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Text(
          '5',
          style: TextStyle(color: Colors.white, fontSize: 10),
        ),
      ),
    ),
  ],
)
```

---

## 10. Debugging Layout Issues

### Common Error: RenderFlex Overflow

```
A RenderFlex overflowed by 42 pixels on the right.
```

**Solutions:**
1. Wrap in `SingleChildScrollView` for scrolling
2. Use `Expanded` or `Flexible` to share space
3. Use `Wrap` instead of `Row` for wrapping
4. Reduce content size

### Debug Technique: Add Borders

```dart
Container(
  decoration: BoxDecoration(
    border: Border.all(color: Colors.red, width: 2),
  ),
  child: YourWidget(),
)
```

### Use Flutter Inspector

1. Run app in debug mode
2. Open DevTools (browser window opens)
3. Click "Flutter Inspector" tab
4. Select widgets to see their bounds

---

## Layout Decision Flowchart

```
Need to arrange widgets?
├── Vertically? → Column
├── Horizontally? → Row
├── Overlapping? → Stack
├── Scrolling vertically? → ListView or SingleChildScrollView
├── Scrolling in grid? → GridView
└── Wrapping when overflow? → Wrap

Need to control size?
├── Fixed size → SizedBox or Container with width/height
├── Fill available space → Expanded
├── Flexible size → Flexible
└── Aspect ratio → AspectRatio

Need spacing?
├── Fixed gap → SizedBox
├── Flexible gap → Spacer
└── Around content → Padding or Container with padding
```

---

## Summary

| Widget | Use Case |
|--------|----------|
| `Column` | Vertical list of widgets |
| `Row` | Horizontal list of widgets |
| `Stack` | Overlapping widgets |
| `Expanded` | Fill remaining space |
| `Flexible` | Flexible sizing |
| `Wrap` | Wrap to next line |
| `ListView` | Scrollable vertical list |
| `GridView` | Scrollable grid |
| `Positioned` | Precise positioning in Stack |

---

**Next: Practice with Exercises →**
