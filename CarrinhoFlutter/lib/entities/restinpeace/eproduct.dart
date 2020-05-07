//region imports
//author Bruno Tezine
import 'package:json_annotation/json_annotation.dart';
import 'package:decimal/decimal.dart';
part 'eproduct.g.dart';
//endregion

@JsonSerializable(nullable: true)
class EProduct{
	String id;
	String companyID;
	String name;
	String tags;
	double unitPrice;
	String description;
	DateTime creationDateUTC;
	DateTime modificationDateUTC;
	double amount;
	double totalPrice;

	EProduct({
		this.id,
		this.companyID,
		this.name,
		this.tags,
		this.unitPrice,
		this.description,
		this.creationDateUTC,
		this.modificationDateUTC,
		this.amount,
		this.totalPrice
});

	factory EProduct.fromJson(Map<String, dynamic> json) => _$EProductFromJson(json);
	Map<String, dynamic> toJson() => _$EProductToJson(this);
}