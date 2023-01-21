import 'package:json_annotation/json_annotation.dart';

part 'options_response_model.g.dart';

@JsonSerializable()
class OptionsListResponse {
  OptionsListResponse({
    this.label,
    this.value,
  });

  String? label;
  String? value;

  factory OptionsListResponse.fromJson(Map<String, dynamic> json) =>
      _$OptionsListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OptionsListResponseToJson(this);
}
