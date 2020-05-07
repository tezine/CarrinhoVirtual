//region imports
//author Bruno Tezine
import 'package:json_annotation/json_annotation.dart';
import 'package:decimal/decimal.dart';
part 'eadminuser.g.dart';
//endregion

@JsonSerializable(nullable: true)
class EAdminUser{
	String id;
	String name;
	String email;
	String password;
	String mobile;
	DateTime creationDateUTC;
	DateTime modificationDateUTC;

	EAdminUser({
		this.id,
		this.name,
		this.email,
		this.password,
		this.mobile,
		this.creationDateUTC,
		this.modificationDateUTC
});

	factory EAdminUser.fromJson(Map<String, dynamic> json) => _$EAdminUserFromJson(json);
	Map<String, dynamic> toJson() => _$EAdminUserToJson(this);
}