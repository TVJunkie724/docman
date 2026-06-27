import 'package:docman/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('app starts on the R2 foundation status surface', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: DocManApp()));

    expect(find.text('R2 Technical Foundation'), findsOneWidget);
    expect(find.text('SQLite + Drift'), findsOneWidget);
    expect(find.text('Not paired'), findsOneWidget);
  });
}
