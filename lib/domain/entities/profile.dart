import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    required String id,
    required String name,
    String? avatarUrl,
    /// The ID of the PocketBase User linked to this profile (if any).
    /// Children will have this as null.
    String? linkedUserId,
    
    /// List of Profile IDs that have permission to manage this profile.
    /// e.g. [MomID, DadID]
    @Default([]) List<String> managers,
    
    String? passportNumber,
    String? socialSecurityNumber,
    
    /// Flexible metadata for other fields.
    @Default({}) Map<String, dynamic> metadata,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
}
