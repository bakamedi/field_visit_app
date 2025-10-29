import 'package:freezed_annotation/freezed_annotation.dart';

part 'technician_state.freezed.dart';

@freezed
abstract class TechnicianState with _$TechnicianState {
  const TechnicianState._();

  const factory TechnicianState({List<String>? technicians}) = _TechnicianState;

  static TechnicianState get initialState => const TechnicianState();
}
