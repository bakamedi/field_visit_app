import 'package:field_visit_app/app/domain/inject_repository.dart';
import 'package:field_visit_app/app/domain/repositories/event/event_repository.dart';
import 'package:field_visit_app/app/presentation/modules/supervisor/controller/supervisor_state.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

final supervisorProvider =
    Provider.state<SupervisorController, SupervisorState>(
      (_) => SupervisorController(
        SupervisorState.initialState,
        eventRepository: Repositories.eventRep.read(),
      ),
    );

class SupervisorController extends StateNotifier<SupervisorState> {
  SupervisorController(
    super.initialState, {
    required EventRepository eventRepository,
  }) : _eventRepository = eventRepository {
    _onInit();
  }

  final EventRepository _eventRepository;

  void _onInit() async {
    await loadEvents();
  }

  Future<void> loadEvents() async {
    state = state.copyWith(loading: true);
    final events = await _eventRepository.getAll();
    state = state.copyWith(events: events, loading: false);
  }
}
