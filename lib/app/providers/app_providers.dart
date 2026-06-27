import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/id/id_generator.dart';
import '../../core/time/clock.dart';

final clockProvider = Provider<Clock>((ref) => const SystemClock());

final idGeneratorProvider = Provider<IdGenerator>(
  (ref) => const UuidIdGenerator(),
);
