import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final DateTime? emailVerifiedAt;
  final DateTime? createdAt;

  const User({
    required this.id,
    required this.email,
    this.emailVerifiedAt,
    this.createdAt,
  });

  User copyWith({
    String? id,
    String? email,
    DateTime? emailVerifiedAt,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  bool get isEmailVerified => emailVerifiedAt != null;

  @override
  List<Object?> get props => [id, email, emailVerifiedAt, createdAt];

  @override
  String toString() =>
      'User(id: $id, email: $email, verified: $isEmailVerified)';
}
