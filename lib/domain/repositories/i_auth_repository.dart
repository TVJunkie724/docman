import 'package:pocketbase/pocketbase.dart';

abstract class IAuthRepository {
  /// Logs in with email and password.
  Future<void> login(String email, String password);

  /// Logs out the current user.
  Future<void> logout();

  /// Stream of the current authenticated user (or null if logged out).
  Stream<RecordModel?> watchUser();
  
  /// Get the current user immediately
  RecordModel? get currentUser;

  /// Link an external provider (google, microsoft) to the current account.
  Future<void> linkProvider(String provider);

  /// Unlink an external provider.
  Future<void> unlinkProvider(String provider);
}
