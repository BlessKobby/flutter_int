import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_int/screens/home_screen.dart';

void main() {
  testWidgets('Logout button redirects to login page',
      (WidgetTester tester) async {
    // Build the HomeScreen widget
    await tester.pumpWidget(
      MaterialApp(
        home: HomeScreen(),
        routes: {
          '/login': (context) => const Scaffold(body: Text('Login Page'))
        },
      ),
    );

    // Verify the logout button is present
    final logoutButton = find.byIcon(Icons.logout);
    expect(logoutButton, findsOneWidget);

    // Tap the logout button
    await tester.tap(logoutButton);
    await tester.pumpAndSettle();

    // Verify the redirection to the login page
    expect(find.text('Login Page'), findsOneWidget);
  });
}
