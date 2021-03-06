// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:coconut_island_app/app/data_providers/data_providers.dart';
import 'package:coconut_island_app/app/repositories/repositories.dart';
import 'package:coconut_island_app/ios/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Home page showing', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester
        .pumpWidget(App(AppRepository(), ProduceRepository(ApiClient())));

    // Verify that our counter starts at 0.
    expect(find.text('Coconut Island'), findsOneWidget);
  });
}
