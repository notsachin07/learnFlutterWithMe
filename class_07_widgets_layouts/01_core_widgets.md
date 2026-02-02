# Part 1: Core Widgets - Building Blocks of Flutter UI

## Introduction

Every Flutter UI is built from **widgets**. Think of widgets as LEGO blocks - each one has a specific purpose, and you combine them to create complex structures.

In this lesson, we'll master the foundational widgets that give your UI **structure, spacing, and style**.

---

## 1. Container - The Swiss Army Knife

`Container` is the most versatile widget in Flutter. It can:
- Add padding and margin
- Apply decoration (colors, borders, shadows)
- Constrain size
- Transform (rotate, scale)

### Basic Container

```dart
Container(
  child: Text('Hello'),
)
```

This creates an invisible container that wraps the text.

### Container with Styling

```dart
Container(
  width: 200,
  height: 100,
  padding: EdgeInsets.all(16),
  margin: EdgeInsets.all(8),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10,
        offset: Offset(0, 4),
      ),
    ],
  ),
  child: Text(
    'Styled Container',
    style: TextStyle(color: Colors.white),
  ),
)
```

### Key Container Properties

| Property | Purpose | Example |
|----------|---------|---------|
| `width` | Fixed width | `width: 200` |
| `height` | Fixed height | `height: 100` |
| `padding` | Space inside | `padding: EdgeInsets.all(16)` |
| `margin` | Space outside | `margin: EdgeInsets.all(8)` |
| `decoration` | Visual styling | `BoxDecoration(...)` |
| `alignment` | Position child | `alignment: Alignment.center` |
| `constraints` | Min/max size | `constraints: BoxConstraints(...)` |

### Padding vs Margin

```
┌─────────────────────────────┐
│         MARGIN              │  ← Space OUTSIDE the container
│  ┌─────────────────────┐    │
│  │      PADDING        │    │  ← Space INSIDE the container
│  │  ┌─────────────┐    │    │
│  │  │   CHILD     │    │    │  ← Your content
│  │  └─────────────┘    │    │
│  │                     │    │
│  └─────────────────────┘    │
│                             │
└─────────────────────────────┘
```

### BoxDecoration Options

```dart
BoxDecoration(
  // Solid color
  color: Colors.blue,
  
  // OR gradient (can't use both color and gradient)
  gradient: LinearGradient(
    colors: [Colors.blue, Colors.purple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  
  // Border
  border: Border.all(color: Colors.black, width: 2),
  
  // Rounded corners
  borderRadius: BorderRadius.circular(16),
  
  // Shadow
  boxShadow: [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 10,
      spreadRadius: 2,
      offset: Offset(0, 4),
    ),
  ],
  
  // Background image
  image: DecorationImage(
    image: NetworkImage('https://example.com/image.jpg'),
    fit: BoxFit.cover,
  ),
)
```

---

## 2. SizedBox - Simple Size Control

`SizedBox` is a lightweight widget for adding fixed dimensions or spacing.

### Fixed Size Box

```dart
SizedBox(
  width: 100,
  height: 50,
  child: Container(color: Colors.red),
)
```

### Spacing Between Widgets

```dart
Column(
  children: [
    Text('First'),
    SizedBox(height: 16),  // Vertical spacing
    Text('Second'),
    SizedBox(height: 16),
    Text('Third'),
  ],
)

Row(
  children: [
    Icon(Icons.star),
    SizedBox(width: 8),  // Horizontal spacing
    Text('Rating'),
  ],
)
```

### SizedBox.expand()

Fills all available space:

```dart
SizedBox.expand(
  child: Container(color: Colors.blue),
)
```

### SizedBox.shrink()

Takes minimum space (useful for conditional widgets):

```dart
showWidget ? MyWidget() : SizedBox.shrink()
```

### When to Use SizedBox vs Container

| Use Case | Widget |
|----------|--------|
| Just need spacing | `SizedBox` |
| Need decoration/styling | `Container` |
| Need constraints only | `SizedBox` or `ConstrainedBox` |
| Need padding only | `Padding` |

---

## 3. Padding - Adding Internal Space

`Padding` adds space around its child. It's simpler than Container when you only need padding.

### Basic Padding

```dart
Padding(
  padding: EdgeInsets.all(16),
  child: Text('Padded text'),
)
```

### EdgeInsets Options

```dart
// All sides equal
EdgeInsets.all(16)

// Symmetric (horizontal and vertical)
EdgeInsets.symmetric(horizontal: 20, vertical: 10)

// Individual sides
EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 5)

// Left, Top, Right, Bottom (clockwise from left)
EdgeInsets.fromLTRB(10, 20, 10, 5)

// Zero padding
EdgeInsets.zero
```

### Visual Example

```dart
Container(
  color: Colors.grey[300],
  child: Padding(
    padding: EdgeInsets.all(24),
    child: Container(
      color: Colors.blue,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text('Nested Padding'),
      ),
    ),
  ),
)
```

---

## 4. Center - Centering Made Easy

`Center` places its child in the middle of available space.

```dart
Center(
  child: Text('I am centered!'),
)
```

This is equivalent to:

```dart
Align(
  alignment: Alignment.center,
  child: Text('I am centered!'),
)
```

### Center with Size Factor

```dart
Center(
  widthFactor: 2,   // Takes 2x the child's width
  heightFactor: 2,  // Takes 2x the child's height
  child: Container(
    width: 50,
    height: 50,
    color: Colors.blue,
  ),
)
// Result: 100x100 area with 50x50 blue box in center
```

---

## 5. Align - Precise Positioning

`Align` positions its child at a specific location.

### Predefined Alignments

```dart
Align(
  alignment: Alignment.topLeft,
  child: Text('Top Left'),
)

Align(
  alignment: Alignment.bottomRight,
  child: Text('Bottom Right'),
)

Align(
  alignment: Alignment.center,
  child: Text('Center'),
)
```

### All Alignment Options

```
topLeft      topCenter      topRight
   ●────────────●────────────●
   │                         │
   │                         │
centerLeft   center      centerRight
   ●────────────●────────────●
   │                         │
   │                         │
bottomLeft  bottomCenter  bottomRight
   ●────────────●────────────●
```

### Custom Alignment with Coordinates

```dart
Align(
  alignment: Alignment(0.5, -0.5),  // x, y from -1 to 1
  child: Text('Custom position'),
)
```

Coordinate system:
- `(-1, -1)` = top-left
- `(1, 1)` = bottom-right
- `(0, 0)` = center

---

## 6. Card - Material Design Cards

`Card` creates a Material Design card with elevation and rounded corners.

### Basic Card

```dart
Card(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text('Simple Card'),
  ),
)
```

### Styled Card

```dart
Card(
  elevation: 8,
  shadowColor: Colors.blue.withOpacity(0.5),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
  color: Colors.white,
  child: Padding(
    padding: EdgeInsets.all(20),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, size: 48, color: Colors.amber),
        SizedBox(height: 12),
        Text(
          'Featured Item',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'This is a beautifully styled card',
          textAlign: TextAlign.center,
        ),
      ],
    ),
  ),
)
```

### Card Properties

| Property | Purpose | Example |
|----------|---------|---------|
| `elevation` | Shadow depth | `elevation: 8` |
| `color` | Background color | `color: Colors.white` |
| `shadowColor` | Shadow color | `shadowColor: Colors.black26` |
| `shape` | Border shape | `RoundedRectangleBorder(...)` |
| `margin` | Outer spacing | `margin: EdgeInsets.all(8)` |

---

## 7. Divider - Visual Separators

`Divider` creates a horizontal line to separate content.

```dart
Column(
  children: [
    ListTile(title: Text('Item 1')),
    Divider(),
    ListTile(title: Text('Item 2')),
    Divider(
      height: 32,        // Total height including space
      thickness: 2,      // Line thickness
      indent: 16,        // Left padding
      endIndent: 16,     // Right padding
      color: Colors.grey,
    ),
    ListTile(title: Text('Item 3')),
  ],
)
```

### VerticalDivider

For horizontal layouts:

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text('Left'),
    VerticalDivider(
      width: 32,
      thickness: 2,
      color: Colors.grey,
    ),
    Text('Right'),
  ],
)
```

---

## 8. Spacer - Flexible Spacing

`Spacer` fills available space in Row/Column. It's like a spring that pushes widgets apart.

```dart
Row(
  children: [
    Text('Left'),
    Spacer(),  // Fills all available space
    Text('Right'),
  ],
)
// Result: "Left" on left edge, "Right" on right edge
```

### Multiple Spacers with Flex

```dart
Row(
  children: [
    Text('A'),
    Spacer(flex: 1),  // 1 part of space
    Text('B'),
    Spacer(flex: 2),  // 2 parts of space
    Text('C'),
  ],
)
// Result: More space between B and C than between A and B
```

---

## 9. AspectRatio - Maintaining Proportions

`AspectRatio` forces its child to maintain a specific width-to-height ratio.

```dart
AspectRatio(
  aspectRatio: 16 / 9,  // Width / Height
  child: Container(color: Colors.blue),
)
```

Common aspect ratios:
- `16/9` - Widescreen video
- `4/3` - Classic TV/photos
- `1/1` - Square (Instagram posts)
- `9/16` - Portrait video (TikTok, Reels)

### Use Case: Profile Picture

```dart
AspectRatio(
  aspectRatio: 1,  // Square
  child: ClipOval(
    child: Image.network(
      'https://example.com/profile.jpg',
      fit: BoxFit.cover,
    ),
  ),
)
```

---

## 10. ConstrainedBox & UnconstrainedBox

### ConstrainedBox

Adds constraints to its child:

```dart
ConstrainedBox(
  constraints: BoxConstraints(
    minWidth: 100,
    maxWidth: 300,
    minHeight: 50,
    maxHeight: 200,
  ),
  child: Container(color: Colors.blue),
)
```

### Common BoxConstraints

```dart
// Fixed size
BoxConstraints.tight(Size(200, 100))

// Minimum size
BoxConstraints(minWidth: 100, minHeight: 50)

// Maximum size
BoxConstraints(maxWidth: 300, maxHeight: 200)

// Expand to fill
BoxConstraints.expand()

// Expand with fixed dimension
BoxConstraints.expand(height: 100)
```

### UnconstrainedBox

Removes parent constraints (use carefully!):

```dart
UnconstrainedBox(
  child: Container(
    width: 500,  // Can exceed parent width
    height: 100,
    color: Colors.red,
  ),
)
```

---

## Summary: When to Use Each Widget

| Widget | Primary Use |
|--------|-------------|
| `Container` | Styling, constraints, decoration |
| `SizedBox` | Fixed spacing, fixed dimensions |
| `Padding` | Internal spacing only |
| `Center` | Centering content |
| `Align` | Precise positioning |
| `Card` | Material Design cards |
| `Divider` | Visual separators |
| `Spacer` | Flexible spacing in Row/Column |
| `AspectRatio` | Maintaining proportions |
| `ConstrainedBox` | Size constraints |

---

## Practice Exercise

Try building this profile header:

```
┌────────────────────────────────────────┐
│  ┌──────┐                              │
│  │ FOTO │  John Doe                    │
│  │      │  Software Developer          │
│  └──────┘  San Francisco, CA           │
│                                        │
│  ────────────────────────────────────  │
│                                        │
│  Following: 250  │  Followers: 1.2K    │
│                                        │
└────────────────────────────────────────┘
```

Hints:
- Outer: Card or Container with decoration
- Top section: Row (image + Column of text)
- Divider in the middle
- Stats: Row with VerticalDivider

---

**Next: Layout Widgets (Row, Column, Stack) →**
