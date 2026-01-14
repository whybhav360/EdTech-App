# Test App

**This project is currently under development.**

This is a Flutter-based mobile application that provides a platform for students to prepare for their exams. The app includes features such as a question of the day, test series, doubt hub, and study materials.

## Features

- **Question of the Day:** A daily question to keep users engaged.
- **Test Center:** A dedicated section for mock tests and practice papers.
- **Doubt Hub:** A forum for students to ask questions and get answers from experts.
- **Study Hub:** A collection of study materials, including notes and video lectures.
- **Help Center:** A dedicated section for support and FAQs.

## Tech Stack

- **Flutter:** The UI toolkit used to build the app.
- **flutter_widget_from_html:** To render HTML content in the app.
- **shared_preferences:** To store simple data on the device.
- **flutter_native_splash:** To create a native splash screen.
- **flutter_svg:** To render SVG files.

## Project Structure

```
lib
├── QOTD
│   └── question_of_the_day.dart
├── HomeScreen
│   └── home_screen.dart
├── ProfileScreen
│   ├── profile_list.dart
│   └── profile_page.dart
├── doubt_hub.dart
├── help_center.dart
├── test_center.dart
├── study_center.dart
├── global_variables.dart
└── main.dart
```

## Getting Started

To get started with this project, you will need to have Flutter installed on your machine. For more information on how to install Flutter, please refer to the [official documentation](https://docs.flutter.dev/).

Once you have Flutter installed, you can clone this repository and run the following command to install the dependencies:

```
flutter pub get
```

After the dependencies have been installed, you can run the app on an emulator or a physical device using the following command:

```
flutter run
```
