import 'dart:convert';

class User {
  String? email;
  String? password;

  User({
    this.email,
    this.password,
  }) {
    email ??= "";
    password ??= "";
  }

  User copyWith({
    String? email,
    String? password,
  }) {
    return User(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Email': email,
      'Password': password,
    };
  }

  Map<String, dynamic> signUpMap(String passwordRetry) {
    return {
      'Email': email,
      'Password': password,
      'PasswordRetry': passwordRetry,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['Email'] ?? '',
      password: map['Password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(email: $email, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
