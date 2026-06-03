# Static Data Showcase

A simple Flutter mobile application that displays a small hardcoded list of local data on a single screen. The app is fully offline, uses Material Design, and focuses on clean structure, maintainability, and a polished visual presentation.

## Project Overview

This project was built for a basic data display task where the app retrieves 5 predefined items from a local source and renders them in a modern list layout. It uses Flutter best practices with a clear folder structure, reusable widgets, and a professional UI that feels lightweight but refined.

## Features

- Single-screen Flutter app
- Hardcoded local data only
- `ListView.builder` for efficient rendering
- Material Design UI with a modern color palette
- AppBar with application title
- Each item includes a title, description, and icon
- No API calls, database, Firebase, forms, or authentication
- Clean and reusable code structure

## Project Structure

```text
lib/
	main.dart
	data/
		local_items.dart
	models/
		local_item.dart
	screens/
		home_screen.dart
	widgets/
		item_card.dart
test/
	widget_test.dart
```

## File Guide

### `lib/main.dart`
App entry point. Sets up the Material 3 theme, app colors, and starts the home screen.

### `lib/models/local_item.dart`
Defines the immutable model used for each static list item.

### `lib/data/local_items.dart`
Contains the hardcoded list of 5 local items shown on the screen.

### `lib/screens/home_screen.dart`
Builds the single-screen layout, hero section, and `ListView.builder` list.

### `lib/widgets/item_card.dart`
Reusable card widget used to display each item with icon, title, and description.

### `test/widget_test.dart`
Basic widget test to verify the app renders and the static content is available.

## Design Notes

- The app uses a modern blue, teal, and warm accent palette.
- A gradient hero section adds a more creative and premium feel.
- Item cards use subtle shadows, rounded corners, and accent indicators for a polished look.
- The layout is intentionally simple and focused so the content remains the priority.

## Proposal

I understand you need a simple Flutter mobile app that displays a small hardcoded list of static local data on one clean screen. I will build it with Flutter using clean, maintainable code, a modern Material Design UI, and a professional structure that is easy to review and submit. The app will be lightweight, fully offline, and delivered quickly without unnecessary complexity. I’ll focus on quality, readability, and a polished user experience so the final result is client-ready. Let’s discuss the details and I’ll get started.

## Summary

This project is a simple Flutter mobile application that shows static local data from a hardcoded list on a single screen. It includes a modern AppBar, a hero section, reusable item cards, and a `ListView.builder` for clean rendering of all 5 items. Each item includes a title, description, and icon, and the app works fully offline with no API, database, Firebase, forms, or authentication.

## How to Run

1. Install Flutter if it is not already available.
2. Open the project in VS Code or Android Studio.
3. Run `flutter pub get`.
4. Start the app with `flutter run`.

## Notes for Client Delivery

- The project is ready to submit as a lightweight offline Flutter app.
- The code is organized for easy review and future maintenance.
- The UI is intentionally modern and suitable for a simple freelance delivery.
