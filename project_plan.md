# Mood Tracker Flutter Web App — Provider Version Plan

## Goal

Build a polished Flutter web application for the technical assessment using `provider` for state management.

The app must:

* Allow users to log moods
* Display the latest 7 mood entries
* Draw mood faces using `CustomPainter`
* Animate timeline items when tapped
* Be deployed to Firebase Hosting or Vercel
* Maintain clean architecture and natural Git commits

---

# Tech Stack

## Main Stack

* Flutter Web
* Dart
* Provider
* CustomPainter
* Material 3

## Packages

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.2
  intl: ^0.20.2
```

---

# Folder Structure

```txt id="r5s7rj"
lib/
├── main.dart
├── core/
│   ├── constants/
│   │   └── app_colors.dart
│   └── theme/
│       └── app_theme.dart
├── models/
│   └── mood_entry.dart
├── providers/
│   └── mood_provider.dart
├── painters/
│   └── mood_face_painter.dart
├── widgets/
│   ├── mood_selector_card.dart
│   ├── mood_face_widget.dart
│   ├── timeline_item.dart
│   └── animated_timeline_item.dart
└── screens/
    └── home_screen.dart
```

---

# State Management

## Provider Strategy

Use:

* `ChangeNotifier`
* `ChangeNotifierProvider`
* `Consumer`

Keep state management lightweight and simple.

---

# Data Model

## mood_entry.dart

```dart id="fw61gj"
enum MoodType {
  happy,
  neutral,
  sad,
}

class MoodEntry {
  final MoodType mood;
  final DateTime date;

  MoodEntry({
    required this.mood,
    required this.date,
  });
}
```

---

# Provider Implementation

## mood_provider.dart

Responsibilities:

* Store mood entries
* Add new mood
* Keep latest 7 only
* Notify listeners

---

## Logic Rules

```dart id="w7e4r4"
void addMood(MoodType mood) {
  _entries.insert(
    0,
    MoodEntry(
      mood: mood,
      date: DateTime.now(),
    ),
  );

  if (_entries.length > 7) {
    _entries.removeLast();
  }

  notifyListeners();
}
```

---

# main.dart Setup

Wrap app with provider.

```dart id="4m35if"
MultiProvider(
  providers: [
    ChangeNotifierProvider(
      create: (_) => MoodProvider(),
    ),
  ],
  child: const MyApp(),
)
```

---

# UI Features

## Mood Selector Section

Three selectable moods:

* Happy
* Neutral
* Sad

Each includes:

* Custom painted face
* Mood label
* Accent color

---

# Timeline Section

## Requirements

Horizontal scrolling timeline.

Each item contains:

* Date
* Painted mood face
* Accent color

Display latest 7 entries only.

Use:

```dart id="4zv75x"
ListView.separated(
  scrollDirection: Axis.horizontal,
)
```

---

# Animation Plan

## Timeline Tap Animation

When user taps a timeline item:

* Animate scale briefly
* Return smoothly

Recommended:

```dart id="9ovp42"
AnimatedScale
```

OR:

```dart id="bimvx6"
AnimationController
```

---

# CustomPainter Requirements

IMPORTANT:
Faces must be manually painted.

Do NOT use:

* Emoji
* SVG
* PNG
* Icon fonts

---

# CustomPainter Drawing Plan

## Head

```dart id="22pqqz"
canvas.drawCircle(...)
```

---

## Eyes

```dart id="8prm6o"
canvas.drawCircle(...)
```

---

## Happy Expression

Use upward arc:

```dart id="ysu1hl"
drawArc(...)
```

---

## Sad Expression

Use downward arc.

---

## Neutral Expression

Use straight line:

```dart id="ob8a2n"
drawLine(...)
```

---

# Responsive Layout

## Web Layout

Center the content.

Recommended:

```dart id="n7m52y"
Center(
  child: ConstrainedBox(
    constraints: const BoxConstraints(
      maxWidth: 900,
    ),
  ),
)
```

---

# UI Polish

## Add

* Rounded cards
* Smooth hover effects
* Consistent spacing
* Material 3 styling

## Avoid

* Empty screen layouts
* Default ugly widgets
* Tight spacing

---

# Home Screen Layout

```txt id="owmvj9"
Scaffold
 └── SafeArea
      └── Center
           └── ConstrainedBox
                └── Padding
                     └── Column
                          ├── Header
                          ├── Mood Buttons
                          ├── Timeline Label
                          └── Timeline List
```

---

# CustomPainter Design Details

## Happy Face

* Curved smile
* Relaxed eyebrows

## Neutral Face

* Straight mouth
* Flat eyebrows

## Sad Face

* Inverted mouth arc
* Angled eyebrows

Faces must clearly differ visually.

---

# Suggested Color Palette

## Happy

```dart id="4w6zhx"
Colors.orange
```

## Neutral

```dart id="ev7p87"
Colors.blueGrey
```

## Sad

```dart id="a0n0be"
Colors.indigo
```

---

# Commit Plan

DO NOT upload everything in one commit.

## Suggested Commits

```txt id="x3qkvy"
Initial Flutter web setup
Configure app theme
Add mood data model
Implement Provider state management
Create CustomPainter mood faces
Build mood selection UI
Implement horizontal timeline
Add timeline animations
Improve responsive design
Deploy to Firebase Hosting
Add README and Loom video info
```

---

# README Requirements

## Include

### Project Overview

Short explanation

### Features

List major features

### State Management

Explain why Provider was chosen

### CustomPainter Notes

Explain drawing logic

### Run Instructions

```bash id="ssmjlwm"
flutter pub get
flutter run -d chrome
```

### Deployment URL

Live hosted app

### Loom Link

Short walkthrough

---

# Firebase Hosting Deployment

Reference:
https://firebase.google.com/docs/hosting

---

# Deployment Commands

## Build

```bash id="86t94f"
flutter build web
```

---

## Initialize Hosting

```bash id="vb75rx"
firebase init hosting
```

Choose:

* Existing project
* Single-page app = YES

---

## Deploy

```bash id="1myohh"
firebase deploy
```

---

# Loom Video Structure

## Keep under 5 minutes

### 1. App Demo

* Log moods
* Tap animations
* Timeline behavior

### 2. Architecture

Explain:

* Folder structure
* Provider usage

### 3. CustomPainter

Explain:

* drawCircle
* drawArc
* drawLine

### 4. Future Improvements

Mention:

* Local persistence
* Accessibility
* Tests
* Analytics

---

# Final Checklist

## Functional

* [ ] Mood selection works
* [ ] Timeline scroll works
* [ ] Only latest 7 entries stored
* [ ] Animation works
* [ ] CustomPainter fully manual

## UI

* [ ] Responsive
* [ ] Proper spacing
* [ ] Consistent styling
* [ ] Smooth animations

## Code

* [ ] Reusable widgets
* [ ] Clean naming
* [ ] Small files
* [ ] No dead code

## Submission

* [ ] Public GitHub repo
* [ ] Natural commit history
* [ ] Firebase live URL
* [ ] Loom video
* [ ] README completed

```
```
