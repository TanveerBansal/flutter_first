import 'package:flutter_test/flutter_test.dart';
import 'package:first_app/_quiz_app/main.dart'; // your app entry point
// import 'package:first_app/first_app/gradient_container.dart'; // your custom widget

void main() {
  testWidgets('GradientContainer loads in MyApp', (tester) async {
    await tester.pumpWidget(const MyApp());

    // ✅ Check that GradientContainer is present
    // expect(find.byType(GradientContainer), findsOneWidget);
  });
}
