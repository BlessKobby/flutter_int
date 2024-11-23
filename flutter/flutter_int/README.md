A Flutter application that includes a login screen (LoginScreen) for the CoinSwipe platform. This app demonstrates testing for UI components and user interactions with fetched coins from an API.

Table of Contents

Introduction
Features
Prerequisites
Installation
Running the App
Running Tests
File Structure
Contributing
License
Introduction

This project is a Flutter-based login application with a focus on UI/UX and API integration. The LoginScreen includes:

A username input field.
A login button with validation and simulated login scenarios.
Features

Username validation.
Navigation to a splash screen upon successful login.
Loading and success/failure states for login attempts.
Widget tests for various states and interactions.
Home screen with coin swiping feature.

To get started, ensure you have the following installed:

Flutter SDK (Installation Guide)
Dart SDK (comes with Flutter)
An IDE (e.g., Visual Studio Code, Android Studio)
A mobile emulator or physical device for running the app.
Installation

Clone the repository:
git clone https://github.com/your-username/coSwipe-login-app.git
cd coSwipe-login-app
Install dependencies: Run the following command to install the required Flutter dependencies:
flutter pub get
Running the App

Start a device emulator or connect a physical device.
Run the app: Use the following command to launch the app:
flutter run
Open the app on your connected device or emulator to interact with the application.
Running Tests

The project includes a set of widget tests to validate the functionality of the login screen.

Run all tests:
flutter test NB: Not all test cases are passing currently.
Test example: Ensure that all widgets render correctly:
flutter test test/login_screen_test.dart
File Structure

Below is the key structure of the project:

lib/
├── main.dart                  # Entry point of the application
├── screens/
│   ├── login_screen.dart      # Login screen widget
│   ├── splash_screen.dart     # Placeholder for splash screen
test/
├── login_screen_test.dart     # Widget tests for login screen
Contributing

Contributions to improve the app are welcomed. To contribute:

Fork the repository.
Create a new branch for your feature or bug fix.
git checkout -b feature-name
Commit your changes and push them to your fork.
git push origin feature-name
Submit a pull request for review.
License

This project is not licensed under the MIT License.

Additional Notes

Ensure all new features are covered by tests.
For any issues, please open a ticket in the GitHub Issues section.

