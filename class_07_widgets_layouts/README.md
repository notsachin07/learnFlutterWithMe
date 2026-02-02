# Class 07: Widgets & Layouts

## 🎯 Learning Objectives

By the end of this class, you will be able to:

1. **Understand Widget Categories** - Distinguish between layout, structural, and interactive widgets
2. **Master Core Layout Widgets** - Use Container, Row, Column, Stack, and Expanded effectively
3. **Apply Spacing & Alignment** - Control widget positioning with MainAxisAlignment and CrossAxisAlignment
4. **Build Responsive Layouts** - Create UIs that adapt to different screen sizes
5. **Compose Complex UIs** - Combine multiple widgets to create professional interfaces
6. **Debug Layout Issues** - Identify and fix common layout overflow problems

---

## 🧠 Prerequisites

Before starting this class, make sure you're comfortable with:

- ✅ **Class 06**: Flutter Setup (creating/running Flutter projects)
- ✅ **Class 04-05**: OOP concepts (classes, objects, inheritance)
- ✅ Basic understanding of StatelessWidget and StatefulWidget
- ✅ Flutter SDK installed and working

---

## 📚 What's in This Class

| File | Description |
|------|-------------|
| `01_core_widgets.md` | Container, SizedBox, Padding, and structural widgets |
| `02_layout_widgets.md` | Row, Column, Stack, Expanded, Flexible, and alignment |
| `exercises.md` | 4 hands-on layout challenges |
| `main.dart` | Runnable examples demonstrating all concepts |
| `solutions/solution_07.dart` | Reference implementations for exercises |

---

## 🌍 Real-World Context

**Every app screen is built with layouts!**

Think about the apps you use daily:
- **Instagram**: Profile screen = Column of Rows (stats) + GridView (photos)
- **Twitter/X**: Feed = Column of Cards, each Card = Row (avatar + Column of text)
- **Spotify**: Now Playing = Stack (album art background + Column of controls)
- **Settings App**: ListView of Rows (icon + text + chevron)

Layout widgets are the **skeleton** of your app. Master these, and you can build ANY UI.

---

## 🔑 Key Concepts Preview

### The Widget Tree Mental Model
```
Scaffold
├── AppBar
│   └── Text (title)
└── Body
    └── Column
        ├── Row
        │   ├── Icon
        │   └── Text
        ├── SizedBox (spacing)
        └── Container
            └── Text
```

### The Three Layout Questions
When building any UI, ask:
1. **Horizontal or Vertical?** → Row or Column
2. **Overlapping elements?** → Stack
3. **Need constraints?** → Container, SizedBox, Expanded

### Main Axis vs Cross Axis
```
Column (vertical):        Row (horizontal):
  Main Axis: ↓              Main Axis: →
  Cross Axis: →             Cross Axis: ↓
```

---

## ⏱️ Estimated Time

| Section | Time |
|---------|------|
| Core Widgets (01) | 30-40 minutes |
| Layout Widgets (02) | 40-50 minutes |
| Exercises | 60-90 minutes |
| **Total** | **2-3 hours** |

---

## 🛠️ How to Use This Class

1. **Read `01_core_widgets.md`** - Understand Container, SizedBox, Padding
2. **Read `02_layout_widgets.md`** - Master Row, Column, Stack, alignment
3. **Run `main.dart`** - See all concepts in action
4. **Complete `exercises.md`** - Build real layouts from scratch
5. **Compare with `solutions/`** - Check your implementations

---

## 💡 Pro Tips

1. **Start simple**: Build the outer structure first, then fill in details
2. **Use DevTools**: Flutter Inspector shows the widget tree visually
3. **Add borders for debugging**: Wrap widgets in Container with border to see bounds
4. **Think in boxes**: Every widget occupies a rectangular area
5. **Experiment with alignment**: Change MainAxisAlignment values to see effects

---

## 🔗 Connections to Other Classes

| Previous | Current | Next |
|----------|---------|------|
| Class 06: Flutter Setup | **Class 07: Widgets & Layouts** | Class 08: Navigation & Routing |
| Created first app | Building UI structure | Moving between screens |

---

## 📖 Quick Reference

```dart
// Vertical arrangement
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [Widget1(), Widget2()],
)

// Horizontal arrangement
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [Widget1(), Widget2()],
)

// Overlapping widgets
Stack(
  children: [BackgroundWidget(), ForegroundWidget()],
)

// Flexible sizing
Row(
  children: [
    Expanded(flex: 2, child: Widget1()),
    Expanded(flex: 1, child: Widget2()),
  ],
)
```

---

## ✅ Success Criteria

You've mastered this class when you can:
- [ ] Build a profile card with image, text, and buttons
- [ ] Create a navigation bar with evenly spaced icons
- [ ] Design a settings list with icons and labels
- [ ] Fix layout overflow errors confidently
- [ ] Explain when to use Row vs Column vs Stack

---

**Let's build beautiful UIs! 🎨**
