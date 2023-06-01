class User {
  final String id;
  final String? email;
  final String? name;
  final bool isAdmin;

  const User({
    required this.id,
    this.email,
    this.name,
    this.isAdmin = false,
  });
}
