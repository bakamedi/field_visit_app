import 'package:field_visit_app/app/domain/models/items/item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'technician_state.freezed.dart';

@freezed
abstract class TechnicianState with _$TechnicianState {
  const TechnicianState._();

  const factory TechnicianState({
    @Default([]) List<ItemModel> events,
    @Default(true) bool loading,
  }) = _TechnicianState;

  static TechnicianState get initialState => const TechnicianState();
}

