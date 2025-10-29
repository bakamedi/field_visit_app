import 'package:field_visit_app/app/domain/models/items/item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_map/flutter_map.dart';

part 'detail_state.freezed.dart';

@freezed
abstract class DetailState with _$DetailState {
  const DetailState._();

  const factory DetailState({
    ItemModel? itemSelected,
    MapController? mapController,
  }) = _DetailState;

  static DetailState get initialState => const DetailState();
}
