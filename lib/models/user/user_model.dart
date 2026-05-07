import 'package:freezed_annotation/freezed_annotation.dart';
// explain in copy (part vala)
part 'user_model.freezed.dart';
part 'user_model.g.dart';

// jb v freezed use krenge to @freezed jarur likhenge
@freezed
sealed class UserModel with _$UserModel {
  const factory UserModel({
    // string bna rhe h
    // agr kus n milega to by default empty value aayega
    // jsonkey esliye likhte h kyuki api se data le rhe h
    @Default('') @JsonKey(name: 'token') String token,
    @Default('') @JsonKey(name: 'error') String error,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
