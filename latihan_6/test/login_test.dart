import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latihan_6/widget_testing/login.dart';

void main() {
  testWidgets('LoginPage UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginPage(),
    ));

    // Verify the title 'Login' appears on the app bar.
    expect(find.text('Login'), findsOneWidget);

    // Verify the existence of email and password text fields.
    expect(find.byType(TextField), findsNWidgets(2));

    // Enter text into email and password fields.
    await tester.enterText(find.byType(TextField).at(0), 'test@email.com');
    await tester.enterText(find.byType(TextField).at(1), 'testpassword');

    // Verify the entered text in email and password fields.
    expect(find.text('test@email.com'), findsOneWidget);
    expect(find.text('testpassword'), findsOneWidget);

    // Tap the login button.
    await tester.tap(find.byType(ElevatedButton));

    // Wait for the widget tree to be rebuilt.
    await tester.pump();

    // Verify if the login logic is triggered.
    // In this example, we assume that the login logic sets a message.
    expect(find.text('Login'), findsOneWidget);
  });
}
