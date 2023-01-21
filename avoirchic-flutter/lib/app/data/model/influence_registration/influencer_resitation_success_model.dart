// To parse this JSON data, do
//
//     final influencerRegistrationModel = influencerRegistrationModelFromJson(jsonString);
import 'package:json_annotation/json_annotation.dart';

part 'influencer_resitation_success_model.g.dart';

@JsonSerializable()
class InfluencerRegistrationModel {
  InfluencerRegistrationModel({
    this.status,
    this.message,
  });

  String? status;
  String? message;

  factory InfluencerRegistrationModel.fromJson(Map<String, dynamic> json) =>
      _$InfluencerRegistrationModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfluencerRegistrationModelToJson(this);
}
