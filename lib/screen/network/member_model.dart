class MemberModel {
  String email;
  String description;

  MemberModel({required this.email, required this.description});

  @override
  String toString() {
    return 'MemberModel{email: $email, description: $description}';
  }
}