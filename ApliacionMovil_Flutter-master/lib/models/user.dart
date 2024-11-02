class User{
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? imagePath;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.imagePath,
  });

  factory User.fromJson(Map<String, Object> json){
    return User(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email
    };
  }

}