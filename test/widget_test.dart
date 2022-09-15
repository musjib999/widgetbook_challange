import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_challenge/app.dart';
import 'package:widgetbook_challenge/widgets/app_button.dart';

void main() {
  testWidgets('$App contains reminder', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('Hello Flutter enthusiast!'), findsOneWidget);

    expect(find.byType(SizedBox), findsWidgets);

    final textFormField = find.byType(TextFormField);

    expect(textFormField, findsOneWidget);

    await tester.enterText(textFormField, 'John Doe');
    expect(find.text('John Doe'), findsOneWidget);
    print('John Doe');

    expect(find.widgetWithText(AppButton, 'Submit'), findsOneWidget);
  });
}
