import 'package:uuid/uuid.dart';

abstract interface class IdGenerator {
  String generate();
}

class UuidIdGenerator implements IdGenerator {
  const UuidIdGenerator();

  static const _uuid = Uuid();

  @override
  String generate() => _uuid.v4();
}
