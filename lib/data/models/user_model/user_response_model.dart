import 'package:test_projcet_invan/data/models/user_model/user_response_address_model.dart';
import 'package:test_projcet_invan/data/models/user_model/user_response_company_model.dart';

class UserResponseModel {
  UserResponseModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final UserResponseAddressModel address;
  final String? phone;
  final String? website;
  final UserResponseCompanyModel company;

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      UserResponseModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        username: json["username"] ?? '',
        email: json["email"] ?? '',
        address: UserResponseAddressModel.fromJson(json["address"]),
        phone: json["phone"] ?? '',
        website: json["website"] ?? '',
        company: UserResponseCompanyModel.fromJson(json["company"]),
      );
}
