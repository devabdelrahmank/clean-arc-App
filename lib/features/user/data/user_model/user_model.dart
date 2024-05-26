import 'package:clean_arc_api/core/database/apis/end_points.dart';
import 'package:clean_arc_api/features/user/data/user_model/sub_model/address_model.dart';
import 'package:clean_arc_api/features/user/domain/entities/user_entites.dart';
import 'sub_model/company_model.dart';

class UserModel extends UserEntity {
  int id;
  final String username;
  final String website;
  final CompanyModel company;

  UserModel({
    required super.name,
    required super.phone,
    required super.email,
    required super.address,
    required this.id,
    required this.username,
    required this.website,
    required this.company,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json[ApiKey.name],
      phone: json[ApiKey.phone],
      email: json[ApiKey.email],
      id: json[ApiKey.id],
      username: json[ApiKey.username],
      website: json[ApiKey.website],
      address: AddressModel.fromJson(json[ApiKey.address]),
      company: CompanyModel.fromJson(json[ApiKey.company]),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
      'id': id,
      'username': username,
      'website': website,
      ApiKey.company: company,
    };
  }
}
