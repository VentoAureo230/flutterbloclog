import 'package:flutter_test/flutter_test.dart';
import 'package:flutterbloclog/app.dart';

void main() {
  testWidgets('test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Hello'), findsOneWidget);
  });
}
