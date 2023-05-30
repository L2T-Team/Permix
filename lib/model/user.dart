class User {
  final String email;
  final String name;
  final bool isAdmin;

  User({
    required this.email,
    required this.name,
    this.isAdmin = false,
  });
}
