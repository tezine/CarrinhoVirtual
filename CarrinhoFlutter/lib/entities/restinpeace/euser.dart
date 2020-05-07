//region imports
//author Bruno Tezine
import 'package:json_annotation/json_annotation.dart';
import 'package:decimal/decimal.dart';
part 'euser.g.dart';
//endregion

@JsonSerializable(nullable: true)
class EUser{
	String id;
	String name;
	String email;
	String password;
	String mobile;
	DateTime creationDateUTC;
	DateTime modificationDateUTC;

	EUser({
		this.id,
		this.name,
		this.email,
		this.password,
		this.mobile,
		this.creationDateUTC,
		this.modificationDateUTC
});

	factory EUser.fromJson(Map<String, dynamic> json) => _$EUserFromJson(json);
	Map<String, dynamic> toJson() => _$EUserToJson(this);
}