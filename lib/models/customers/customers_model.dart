import 'package:json_annotation/json_annotation.dart';
part 'customers_model.g.dart';

@JsonSerializable()
class CustomersModel {
  final String fullname;
  final String age;
  final String phone;
  final String photoUrl;
  final String id;
  final registereddate;

  CustomersModel(this.fullname, this.age, this.phone, this.registereddate,
      this.photoUrl, this.id);
  factory CustomersModel.fromJson(Map<String, dynamic> json) =>
      _$CustomersModelFromJson(json);
  Map<String, dynamic> toJson() => _$CustomersModelToJson(this);
}
