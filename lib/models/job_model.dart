import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_model.freezed.dart';
part 'job_model.g.dart';

@freezed
class JobModel with _$JobModel {
  const factory JobModel({
    required int id,
    required String name,
    required int year,
    required String color,
    required String pantoneValue,
  }) = _JobModel;

  factory JobModel.fromJson(Map<String, dynamic> json) => _$JobModelFromJson(json);
  
  @override
  // TODO: implement color
  String get color => throw UnimplementedError();
  
  @override
  // TODO: implement id
  int get id => throw UnimplementedError();
  
  @override
  // TODO: implement name
  String get name => throw UnimplementedError();
  
  @override
  // TODO: implement pantoneValue
  String get pantoneValue => throw UnimplementedError();
  
  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
  
  @override
  // TODO: implement year
  int get year => throw UnimplementedError();


}
