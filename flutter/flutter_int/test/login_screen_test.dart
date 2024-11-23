import 'package:flutter/material.dart';
import 'package:flutter_int/screens/login_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('LoginScreen Tests', () {
    late MockNavigatorObserver mockObserver;

    setUp(() {
      mockObserver = MockNavigatorObserver();
    });

    testWidgets('Renders all widgets correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginScreen(),
      ));

      // Check for AppBar
      expect(find.text('Login'), findsOneWidget);

      // Check for welcome text
      expect(find.text('Welcome to CoinSwipe'), findsOneWidget);

      // Check for username field
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('Username'), findsOneWidget);

      // Check for login button
      expect(find.text('Login'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('Displays validation message when username is empty',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginScreen(),
      ));

      // Tap the login button without entering a username
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      // Expect validation error
      expect(find.text('Please enter your username'), findsOneWidget);
    });

    testWidgets('Simulates successful login', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginScreen(),
        navigatorObservers: [mockObserver],
        routes: {'/splash': (context) => const SizedBox.shrink()},
      ));

      // Enter valid username
      await tester.enterText(find.byType(TextFormField), 'testuser');

      // Tap login button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump(); // Start async process

      // Show loading indicator
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Wait for simulated login delay
      await tester.pump(const Duration(seconds: 2));

      // Verify success state
      expect(find.text('Success'), findsOneWidget);
      verify(mockObserver.didReplace(
          oldRoute: anyNamed('oldRoute'), newRoute: anyNamed('newRoute')));
    });

    testWidgets('Simulates failed login', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginScreen(),
      ));

      // Do not enter username and tap login button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      // Expect validation error
      expect(find.text('Please enter your username'), findsOneWidget);

      // Simulate failed login state
      await tester.pump(const Duration(seconds: 2));
      expect(find.text('Failed'), findsOneWidget);
    });

    testWidgets('Applies correct button styles', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginScreen(),
      ));

      // Before any action, button color should be blue-grey
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.style?.backgroundColor?.resolve(<WidgetState>{}),
          equals(Colors.blueGrey));

      // Simulate login success
      await tester.enterText(find.byType(TextFormField), 'testuser');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump(const Duration(seconds: 2));

      // Button color should change to green for success
      expect(button.style?.backgroundColor?.resolve(<WidgetState>{}),
          equals(Colors.green));
    });
  });
}
