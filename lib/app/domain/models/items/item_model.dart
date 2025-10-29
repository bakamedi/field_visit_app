import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_model.freezed.dart';

@freezed
abstract class ItemModel with _$ItemModel {
  const ItemModel._();

  const factory ItemModel({
    String? id,
    String? code,
    double? lat,
    double? lng,
    DateTime? createdAt,
  }) = _ItemModel;

  static ItemModel get initialState => const ItemModel();
}
