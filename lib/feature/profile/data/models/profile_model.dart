import 'package:fynd/core/utils/model_parser.dart';
import 'package:fynd/feature/profile/domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  ProfileModel({
    required super.id,
    required super.userName,
    required super.email,
    required super.phoneNumber,
    required super.createdAt,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> json) => ProfileModel(
    id: ModelParser.intValue(json['id']),
    userName: ModelParser.stringValue(json['userName']),
    email: ModelParser.stringValue(json['email']),
    phoneNumber: ModelParser.stringValue(json['phoneNumber']),
    createdAt: ModelParser.dateTimeValue(json['createdAt']),
  );
}
