import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'message')
  String? message;
}

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'numOfNotifications')
  int? numOfNotifications;

  CustomerResponse(this.id, this.name, this.numOfNotifications);

  // From json
  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);

  // To json
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}

@JsonSerializable()
class ContactsResponse {
  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'link')
  String? link;

  ContactsResponse(this.phone, this.email, this.link);

  // From json
  factory ContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseFromJson(json);

  // To json
  Map<String, dynamic> toJson() => _$ContactsResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: 'customer')
  CustomerResponse? customer;

  @JsonKey(name: 'contacts')
  ContactsResponse? contacts;

  AuthenticationResponse(this.customer, this.contacts);

  // From json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

  // To json
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}
