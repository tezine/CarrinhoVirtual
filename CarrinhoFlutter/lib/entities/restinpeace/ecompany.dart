//region imports
//author Bruno Tezine
import 'package:json_annotation/json_annotation.dart';
import 'package:decimal/decimal.dart';
part 'ecompany.g.dart';
//endregion

@JsonSerializable(nullable: true)
class ECompany{
	String id;
	String name;
	String email;
	String password;
	String phone;
	String mobile;
	DateTime creationDateUTC;
	DateTime modificationDateUTC;

	ECompany({
		this.id,
		this.name,
		this.email,
		this.password,
		this.phone,
		this.mobile,
		this.creationDateUTC,
		this.modificationDateUTC
});

	factory ECompany.fromJson(Map<String, dynamic> json) => _$ECompanyFromJson(json);
	Map<String, dynamic> toJson() => _$ECompanyToJson(this);
}