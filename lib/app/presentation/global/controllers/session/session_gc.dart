import 'package:field_visit_app/app/domain/inject_repository.dart';
import 'package:field_visit_app/app/domain/repositories/user/user_preferences_repository.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

import 'session_state.dart';

final sessionGP = Provider.state<SessionGC, SessionState>(
  (_) => SessionGC(
    SessionState.initialState,
    userPreferencesRepository: Repositories.userPreferenceRep.read(),
  ),
  autoDispose: false,
);

class SessionGC extends StateNotifier<SessionState> {
  SessionGC(
    super.initialState, {
    required UserPreferencesRepository userPreferencesRepository,
  }) : _userPreferencesRepository = userPreferencesRepository;

  final UserPreferencesRepository _userPreferencesRepository;

  void toggleDarkMode(bool isDarkMode) {
    state = state.copyWith(
      userPreferences: state.userPreferences.copyWith(isDarkMode: isDarkMode),
    );
    _userPreferencesRepository.saveUserPreferences(state.userPreferences);
  }
}
