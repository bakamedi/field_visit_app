import 'package:field_visit_app/app/domain/models/items/item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'supervisor_state.freezed.dart';

@freezed
abstract class SupervisorState with _$SupervisorState {
  const SupervisorState._();

  const factory SupervisorState({
    @Default([]) List<ItemModel> events,
    @Default(true) bool loading,
  }) = _SupervisorState;

  static SupervisorState get initialState => const SupervisorState();
}
