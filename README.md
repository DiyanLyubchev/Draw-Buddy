# Draw Buddy

A tablet-friendly drawing lesson app for children. It contains local SVG lessons, guided tracing animation, and a simple offline experience.

## Run locally

From the project root, run:

```bash
flutter pub get && flutter run -d chrome

```

If you prefer to run the steps separately:

```bash
flutter pub get
flutter run -d chrome

```

## Notes

- Works without internet access.
- Keeps each final preview and its cumulative drawing steps under `assets/lessons/<name>/`.
- Designed for tablet-sized screens and child-friendly interaction.
