// To parse this JSON data, do
//
//     final optionModel = optionModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'option_model.g.dart';

@JsonSerializable()
class OptionModel {
  OptionModel({
    this.label,
    this.value,
  });

  String? label;
  String? value;

  factory OptionModel.fromJson(Map<String, dynamic> json) =>
      _$OptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$OptionModelToJson(this);
}
