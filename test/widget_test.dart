import 'package:docman/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('app starts on the Mappm foundation surface', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MappmApp()));

    expect(find.text('Mappm'), findsOneWidget);
    expect(find.text('Foundation'), findsOneWidget);
    expect(find.text('Local-first baseline'), findsOneWidget);
    expect(find.text('SQLite + Drift'), findsOneWidget);
    expect(find.text('Not paired'), findsOneWidget);
  });
}
