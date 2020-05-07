//region imports
//author Bruno Tezine
import 'package:json_annotation/json_annotation.dart';
import 'package:decimal/decimal.dart';
part 'eusercompany.g.dart';
//endregion

@JsonSerializable(nullable: true)
class EUserCompany{
	String id;
	String userId;
	String companyId;
	String companyName;
	DateTime creationDateUTC;
	DateTime modificationDateUTC;

	EUserCompany({
		this.id,
		this.userId,
		this.companyId,
		this.companyName,
		this.creationDateUTC,
		this.modificationDateUTC
});

	factory EUserCompany.fromJson(Map<String, dynamic> json) => _$EUserCompanyFromJson(json);
	Map<String, dynamic> toJson() => _$EUserCompanyToJson(this);
}