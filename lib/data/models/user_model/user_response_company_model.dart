class UserResponseCompanyModel {
  const UserResponseCompanyModel({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  final String? name;
  final String? catchPhrase;
  final String? bs;

  factory UserResponseCompanyModel.fromJson(Map<String, dynamic> json) {
    return UserResponseCompanyModel(
      catchPhrase: json["catchPhrase"] ?? '',
      name: json["name"] ?? '',
      bs: json["bs"] ?? '',
    );
  }
}
