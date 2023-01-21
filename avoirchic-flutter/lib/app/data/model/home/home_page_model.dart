import 'package:json_annotation/json_annotation.dart';

part 'home_page_model.g.dart';

@JsonSerializable()
class HomePageModel {
  String? content;

  HomePageModel({this.content});

  factory HomePageModel.fromJson(Map<String, dynamic> json) =>
      _$HomePageModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomePageModelToJson(this);
}
