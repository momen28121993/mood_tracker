# Mood Tracker

A simple Flutter web app for logging moods. Users can choose Happy, Neutral, or Sad, then see the latest seven mood entries in a horizontal timeline.

## Features

- Provider state management with `ChangeNotifier`
- Latest seven mood entries only
- Manual mood faces using `CustomPainter`
- Horizontal timeline
- Tap animation for timeline items
- Responsive centered web layout

## State Management

Provider is used because the app state is small and clear. `MoodProvider` stores the entries, adds a new mood, removes old entries after seven, and notifies the UI.

## CustomPainter Notes

The mood faces are drawn manually with canvas methods. The painter uses `drawCircle` for the head and eyes, `drawArc` for happy and sad mouths, and `drawLine` for the neutral mouth and eyebrows.

## Run

```bash
flutter pub get
flutter run -d chrome
```

## Build Web

```bash
flutter build web
```

## Deployment

Deployment URL: add the hosted link here after publishing to Firebase Hosting or Vercel.

## Loom

Loom link: add the walkthrough link here after recording.
