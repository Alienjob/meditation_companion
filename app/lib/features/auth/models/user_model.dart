import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final DateTime? emailVerifiedAt;
  final DateTime createdAt;

  User({
    required this.id,
    required this.email,
    this.emailVerifiedAt,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory User.create({
    required String id,
    required String email,
    DateTime? emailVerifiedAt,
    DateTime? createdAt,
  }) {
    return User(
      id: id,
      email: email,
      emailVerifiedAt: emailVerifiedAt,
      createdAt: createdAt,
    );
  }

  bool get isEmailVerified => emailVerifiedAt != null;

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

  @override
  List<Object?> get props => [id, email, emailVerifiedAt, createdAt];

  @override
  String toString() =>
      'User(id: $id, email: $email, verified: $isEmailVerified)';
}
