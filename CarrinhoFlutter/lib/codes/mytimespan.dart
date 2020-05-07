
import 'package:fcharts/fcharts.dart';
import 'package:json_annotation/json_annotation.dart';
part 'mytimespan.g.dart';
//endregion

@JsonSerializable(nullable: true)
class MyTimeSpan extends TimeSpan{


  MyTimeSpan() : super(null, null){

  }

  factory MyTimeSpan.fromJson(Map<String, dynamic> json) => _$MyTimeSpanFromJson(json);
  Map<String, dynamic> toJson() => _$MyTimeSpanToJson(this);
}