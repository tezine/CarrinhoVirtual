//region imports
//author Bruno Tezine
import 'package:json_annotation/json_annotation.dart';
import 'package:decimal/decimal.dart';
part 'esearch.g.dart';
//endregion

@JsonSerializable(nullable: true)
class ESearch{
	String id;
	String text;
	DateTime creationDateUTC;

	ESearch({
		this.id,
		this.text,
		this.creationDateUTC
});

	factory ESearch.fromJson(Map<String, dynamic> json) => _$ESearchFromJson(json);
	Map<String, dynamic> toJson() => _$ESearchToJson(this);
}