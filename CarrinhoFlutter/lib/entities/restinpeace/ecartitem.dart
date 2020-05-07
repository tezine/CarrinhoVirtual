//region imports
//author Bruno Tezine
import 'package:json_annotation/json_annotation.dart';
import 'package:decimal/decimal.dart';
part 'ecartitem.g.dart';
//endregion

@JsonSerializable(nullable: true)
class ECartItem{
	String id;
	String name;
	double amount;
	double unitPrice;
	double totalPrice;

	ECartItem({
		this.id,
		this.name,
		this.amount,
		this.unitPrice,
		this.totalPrice
});

	factory ECartItem.fromJson(Map<String, dynamic> json) => _$ECartItemFromJson(json);
	Map<String, dynamic> toJson() => _$ECartItemToJson(this);
}