import 'dart:async';
import 'package:pocketbase/pocketbase.dart';
import '../../domain/repositories/i_auth_repository.dart';

class PocketbaseAuthRepository implements IAuthRepository {
  final PocketBase _pb;
  final StreamController<RecordModel?> _userStreamController = StreamController.broadcast();

  PocketbaseAuthRepository(this._pb) {
    // Listen to auth store changes
    _pb.authStore.onChange.listen((event) {
      _userStreamController.add(event.model as RecordModel?);
    });
  }

  @override
  RecordModel? get currentUser => _pb.authStore.model as RecordModel?;

  @override
  Stream<RecordModel?> watchUser() {
    return _userStreamController.stream;
  }

  @override
  Future<void> login(String email, String password) async {
    await _pb.collection('users').authWithPassword(email, password);
  }

  @override
  Future<void> logout() async {
    _pb.authStore.clear();
  }

  @override
  Future<void> linkProvider(String provider) async {
    // This usually requires a web flow (url_launcher).
    // For now, we assume the UI handles the OAuth2 flow and we just get the result.
    // However, PocketBase SDK handles 'authWithOAuth2' which does the login.
    // Linking an *existing* account is slightly different (unlink/link).
    
    // NOTE: Linking a NEW provider to an EXISTING account usually involves
    // logging in with that provider and then merging, or using a specific API.
    // PocketBase currently simplifies this by allowing multiple auth methods for the same email.
    // If you mean "Add Microsoft to my Google Account", you usually just "Login with Microsoft"
    // and if the email matches, it works (if configured).
    // Explicit linking might require custom backend logic or manual record updates.
    
    // For this MVP, we will assume 'authWithOAuth2' is sufficient for the login part.
    // True "Linking" often happens automatically by email in PocketBase.
    throw UnimplementedError("OAuth2 Linking requires UI integration (url_launcher)");
  }

  @override
  Future<void> unlinkProvider(String provider) async {
    // PocketBase doesn't have a direct "unlink" SDK method for users.
    // You would typically remove the entry from the 'externalAuths' collection.
    final user = currentUser;
    if (user == null) return;
    
    // Find the external auth record for this provider and user
    // await _pb.collection('externalAuths').delete(...)
    throw UnimplementedError("Unlinking requires finding the externalAuth record ID");
  }
}
