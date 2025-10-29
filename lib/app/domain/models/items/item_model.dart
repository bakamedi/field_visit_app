import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_model.freezed.dart';
part 'item_model.g.dart';

@freezed
abstract class ItemModel with _$ItemModel {
  const ItemModel._();

  const factory ItemModel({
    String? id,
    String? code,
    double? lat,
    double? lng,
    String? createdAt,
    String? userId,
  }) = _ItemModel;

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
}
