import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterbloclog/app.dart';

void main() {
  testWidgets('test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Hello'), findsOneWidget);
    expect(find.text('Bye'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);

    expect(find.text('Bye'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
